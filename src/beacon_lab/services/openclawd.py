"""
OpenClawD / LLM client for the Beacon Lab Daily Threat Briefing agent.

- OPENCLAWD_BASE_URL: Gateway root (e.g. http://openclawd:18789)
- OPENCLAWD_API_KEY: Bearer token for Authorization header
- Endpoint: POST {OPENCLAWD_BASE_URL}/v1/chat/completions (OpenAI-compatible)
- Response text: choices[0].message.content
"""

from __future__ import annotations

import logging
import os
from typing import Any

import httpx

from beacon_lab.core.prompts import BEACON_LAB_SYSTEM_PROMPT
from beacon_lab.models.briefing import BriefingRequest

logger = logging.getLogger(__name__)

OPENCLAWD_TIMEOUT_SECONDS = float(os.getenv("OPENCLAWD_TIMEOUT_SECONDS", "180"))


class AgentClientError(Exception):
    """Base error from the OpenClawD client."""

    def __init__(self, message: str, *, status_code: int | None = None) -> None:
        super().__init__(message)
        self.status_code = status_code


class AgentTimeoutError(AgentClientError):
    """Raised when the upstream LLM call times out."""


class AgentUpstreamError(AgentClientError):
    """Raised when OpenClawD returns a non-success HTTP status or malformed payload."""


def _build_user_message(request: BriefingRequest) -> str:
    return (
        f"Generate the Beacon Lab Daily Threat Briefing for {request.date.isoformat()}.\n"
        f"Language: {request.language}\n"
        f"Maximum length: {request.max_words} words.\n"
        "Use current open-source threat intelligence where available."
    )


def _build_payload(request: BriefingRequest) -> dict[str, Any]:
    return {
        "model": os.getenv("OPENCLAWD_MODEL", "openclaw:beacon-lab"),
        "stream": False,
        "messages": [
            {"role": "system", "content": BEACON_LAB_SYSTEM_PROMPT},
            {"role": "user", "content": _build_user_message(request)},
        ],
        # Search tools (Tavily) are configured on the OpenClaw agent beacon-lab,
        # not in this HTTP payload — the gateway runs the tool loop internally.
    }


def _build_headers() -> dict[str, str]:
    api_key = os.getenv("OPENCLAWD_API_KEY", "")
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    }
    agent_id = os.getenv("OPENCLAWD_AGENT_ID")
    if agent_id:
        headers["x-openclaw-agent-id"] = agent_id
    return headers


def _extract_briefing_text(data: dict[str, Any]) -> str:
    try:
        content = data["choices"][0]["message"]["content"]
    except (KeyError, IndexError, TypeError) as exc:
        raise AgentUpstreamError(
            "OpenClawD response missing choices[0].message.content",
            status_code=502,
        ) from exc

    if not content or not str(content).strip():
        raise AgentUpstreamError("OpenClawD returned an empty briefing", status_code=502)

    return str(content).strip()


async def _call_openclawd(request: BriefingRequest) -> str:
    """Call OpenClawD chat completions endpoint."""
    base_url = os.getenv("OPENCLAWD_BASE_URL", "").rstrip("/")
    if not base_url:
        raise AgentUpstreamError("OPENCLAWD_BASE_URL is not configured", status_code=502)
    if not os.getenv("OPENCLAWD_API_KEY"):
        raise AgentUpstreamError("OPENCLAWD_API_KEY is not configured", status_code=502)

    url = f"{base_url}/v1/chat/completions"
    payload = _build_payload(request)
    headers = _build_headers()

    logger.info(
        "Calling OpenClawD date=%s language=%s max_words=%d",
        request.date.isoformat(),
        request.language,
        request.max_words,
    )

    async with httpx.AsyncClient(timeout=httpx.Timeout(OPENCLAWD_TIMEOUT_SECONDS)) as client:
        try:
            response = await client.post(url, json=payload, headers=headers)
        except httpx.TimeoutException as exc:
            logger.warning(
                "OpenClawD timeout after %.0fs for date=%s",
                OPENCLAWD_TIMEOUT_SECONDS,
                request.date.isoformat(),
            )
            raise AgentTimeoutError(
                f"OpenClawD request timed out after {OPENCLAWD_TIMEOUT_SECONDS:.0f}s",
                status_code=504,
            ) from exc
        except httpx.HTTPError as exc:
            logger.error("OpenClawD HTTP error: %s", exc)
            raise AgentUpstreamError(f"Failed to reach OpenClawD: {exc}", status_code=502) from exc

        if response.status_code >= 400:
            logger.error(
                "OpenClawD error status=%d body=%s",
                response.status_code,
                response.text[:500],
            )
            raise AgentUpstreamError(
                f"OpenClawD returned HTTP {response.status_code}",
                status_code=502,
            )

        return _extract_briefing_text(response.json())


async def call_beacon_lab_agent(request: BriefingRequest) -> str:
    """
    Generate a daily threat briefing via OpenClawD / LLM.

    Raises AgentTimeoutError, AgentUpstreamError, or AgentClientError on failure.
    """
    logger.info(
        "Generating briefing date=%s language=%s max_words=%d",
        request.date.isoformat(),
        request.language,
        request.max_words,
    )

    return await _call_openclawd(request)
