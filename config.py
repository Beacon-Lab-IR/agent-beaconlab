"""Environment-based configuration."""

from __future__ import annotations

import os
from dataclasses import dataclass


def _env_bool(name: str, default: bool = False) -> bool:
    raw = os.getenv(name)
    if raw is None:
        return default
    return raw.strip().lower() in {"1", "true", "yes", "on"}


@dataclass(frozen=True)
class Settings:
    openclawd_base_url: str
    openclawd_api_key: str
    openclawd_model: str
    openclawd_agent_id: str | None
    openclawd_timeout_seconds: float
    enable_web_search_tool: bool

    @classmethod
    def from_env(cls) -> Settings:
        base_url = os.getenv("OPENCLAWD_BASE_URL", "").rstrip("/")
        api_key = os.getenv("OPENCLAWD_API_KEY", "")
        if not base_url:
            raise ValueError("OPENCLAWD_BASE_URL is required")
        if not api_key:
            raise ValueError("OPENCLAWD_API_KEY is required")

        return cls(
            openclawd_base_url=base_url,
            openclawd_api_key=api_key,
            openclawd_model=os.getenv("OPENCLAWD_MODEL", "openclaw:beacon-lab"),
            openclawd_agent_id=os.getenv("OPENCLAWD_AGENT_ID"),
            openclawd_timeout_seconds=float(os.getenv("OPENCLAWD_TIMEOUT_SECONDS", "180")),
            enable_web_search_tool=_env_bool("ENABLE_WEB_SEARCH_TOOL", default=True),
        )


_settings: Settings | None = None


def get_settings() -> Settings:
    global _settings
    if _settings is None:
        _settings = Settings.from_env()
    return _settings
