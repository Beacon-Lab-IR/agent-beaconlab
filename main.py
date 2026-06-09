"""FastAPI application for the Beacon Lab Daily Threat Briefing agent API."""

from __future__ import annotations

import logging

from dotenv import load_dotenv
from fastapi import FastAPI, Request, status
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse

from agent_client import (
    AgentClientError,
    AgentTimeoutError,
    AgentUpstreamError,
    call_beacon_lab_agent,
)
from schemas import BriefingRequest, BriefingResponse

load_dotenv()

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s [%(name)s] %(message)s",
)
logger = logging.getLogger(__name__)

app = FastAPI(
    title="Beacon Lab Agent API",
    description="HTTP wrapper for the Beacon Lab Daily Threat Briefing agent (OpenClawD + LLM).",
    version="0.1.0",
)


@app.exception_handler(RequestValidationError)
async def validation_exception_handler(
    _request: Request,
    exc: RequestValidationError,
) -> JSONResponse:
    logger.warning("Validation error: %s", exc.errors())
    return JSONResponse(
        status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
        content={
            "status": "error",
            "error": "validation_error",
            "detail": exc.errors(),
        },
    )


@app.get("/health")
async def health() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/briefing", response_model=BriefingResponse)
async def create_briefing(body: BriefingRequest) -> BriefingResponse | JSONResponse:
    logger.info(
        "Incoming briefing request date=%s language=%s max_words=%d",
        body.date.isoformat(),
        body.language,
        body.max_words,
    )

    try:
        briefing_text = await call_beacon_lab_agent(body)
    except AgentTimeoutError as exc:
        logger.warning("Briefing timeout: %s", exc)
        return JSONResponse(
            status_code=status.HTTP_504_GATEWAY_TIMEOUT,
            content={"status": "error", "error": "upstream_timeout", "detail": str(exc)},
        )
    except AgentUpstreamError as exc:
        logger.error("Briefing upstream error: %s", exc)
        return JSONResponse(
            status_code=status.HTTP_502_BAD_GATEWAY,
            content={"status": "error", "error": "upstream_error", "detail": str(exc)},
        )
    except AgentClientError as exc:
        logger.exception("Agent client error")
        return JSONResponse(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            content={"status": "error", "error": "agent_error", "detail": str(exc)},
        )
    except Exception as exc:
        logger.exception("Unexpected error while generating briefing")
        return JSONResponse(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            content={"status": "error", "error": "internal_error", "detail": str(exc)},
        )

    return BriefingResponse(
        date=body.date.isoformat(),
        language=body.language,
        briefing=briefing_text,
    )
