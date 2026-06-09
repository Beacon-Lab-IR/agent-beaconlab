"""Pydantic request/response models for the Beacon Lab briefing API."""

from __future__ import annotations

from datetime import date as Date
from typing import Literal

from pydantic import BaseModel, Field


class BriefingRequest(BaseModel):
    date: Date = Field(..., description="Briefing date (ISO 8601, e.g. 2026-06-09)")
    language: str = Field(default="en", min_length=2, max_length=10)
    max_words: int = Field(default=1200, ge=100, le=5000)


class BriefingResponse(BaseModel):
    status: Literal["ok"] = "ok"
    date: str
    language: str
    briefing: str
