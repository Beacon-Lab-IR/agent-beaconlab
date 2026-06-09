#!/usr/bin/env bash
# Bootstrap OpenClaw Gateway for Beacon Lab (first-time setup).
# Stack: MiniMax (LLM) + Tavily (web search) on agent beacon-lab.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

ENV_FILE="$ROOT_DIR/.env"
CONFIG_DIR="$ROOT_DIR/openclaw/config"
WORKSPACE_DIR="$ROOT_DIR/openclaw/workspace"
AUTH_DIR="$ROOT_DIR/openclaw/auth-secrets"

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

warn() {
  echo "WARN: $*" >&2
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "Falta dependencia: $1"
}

generate_token() {
  if command -v openssl >/dev/null 2>&1; then
    openssl rand -hex 32
  else
    python3 -c "import secrets; print(secrets.token_hex(32))"
  fi
}

upsert_env() {
  local key="$1"
  local value="$2"
  local file="$ENV_FILE"
  if [[ ! -f "$file" ]]; then
    printf '%s=%s\n' "$key" "$value" >>"$file"
    return
  fi
  if grep -q "^${key}=" "$file"; then
    if [[ "$(uname)" == "Darwin" ]]; then
      sed -i '' "s|^${key}=.*|${key}=${value}|" "$file"
    else
      sed -i "s|^${key}=.*|${key}=${value}|" "$file"
    fi
  else
    printf '\n%s=%s\n' "$key" "$value" >>"$file"
  fi
}

is_placeholder() {
  local value="${1:-}"
  [[ -z "$value" || "$value" == your-*-here ]]
}

get_beacon_lab_agent_index() {
  python3 - "$CONFIG_DIR/openclaw.json" <<'PY'
import json
import sys

path = sys.argv[1]
with open(path, encoding="utf-8") as fh:
    cfg = json.load(fh)

for index, agent in enumerate(cfg.get("agents", {}).get("list", [])):
    if agent.get("id") == "beacon-lab":
        print(index)
        sys.exit(0)

sys.exit(1)
PY
}

run_openclawd() {
  docker compose run --rm --no-deps \
    -e HOME=/home/node \
    -e TMPDIR=/home/node/.openclaw/tmp \
    -e OPENCLAW_HOME=/home/node \
    -e OPENCLAW_STATE_DIR=/home/node/.openclaw \
    -e OPENCLAW_CONFIG_PATH=/home/node/.openclaw/openclaw.json \
    -e OPENCLAW_CONFIG_DIR=/home/node/.openclaw \
    -e OPENCLAW_WORKSPACE_DIR=/home/node/.openclaw/workspace \
    -e OPENCLAW_GATEWAY_TOKEN="${OPENCLAW_GATEWAY_TOKEN}" \
    -e TAVILY_API_KEY="${TAVILY_API_KEY:-}" \
    -e MINIMAX_API_KEY="${MINIMAX_API_KEY:-}" \
    --entrypoint node openclawd dist/index.js "$@"
}

configure_gateway_basics() {
  echo "==> Configurando gateway"
  run_openclawd config set --batch-json '[
    {"path":"gateway.mode","value":"local"},
    {"path":"gateway.bind","value":"lan"},
    {"path":"gateway.http.endpoints.chatCompletions.enabled","value":true},
    {"path":"gateway.controlUi.allowedOrigins","value":["http://localhost:18789","http://127.0.0.1:18789"]}
  ]'
}

configure_minimax() {
  if is_placeholder "${MINIMAX_API_KEY:-}"; then
    warn "MINIMAX_API_KEY no configurada — configura el LLM en .env y vuelve a ejecutar este script"
    return
  fi

  echo "==> Configurando MiniMax (LLM)"
  run_openclawd onboard \
    --mode local \
    --no-install-daemon \
    --non-interactive \
    --accept-risk \
    --auth-choice minimax-global-api \
    --minimax-api-key "$MINIMAX_API_KEY" \
    --skip-ui \
    --skip-health \
    --suppress-gateway-token-output
}

configure_tavily_and_beacon_lab_agent() {
  local agent_index model batch_json

  if is_placeholder "${TAVILY_API_KEY:-}"; then
    warn "TAVILY_API_KEY no configurada — web_search fallará hasta que la añadas en .env"
  else
    echo "==> Configurando Tavily (web search)"
  fi

  agent_index="$(get_beacon_lab_agent_index)"
  model="${MINIMAX_MODEL:-minimax/MiniMax-M3}"

  batch_json="$(python3 - "$agent_index" "$model" <<'PY'
import json
import sys

index = int(sys.argv[1])
model = sys.argv[2]
payload = [
    {"path": "plugins.entries.tavily.enabled", "value": True},
    {"path": "tools.web.search.provider", "value": "tavily"},
    {"path": "gateway.bind", "value": "lan"},
    {"path": f"agents.list[{index}].model", "value": model},
    {
        "path": f"agents.list[{index}].tools.allow",
        "value": ["web_search", "tavily_search", "tavily_extract"],
    },
]
print(json.dumps(payload))
PY
)"

  run_openclawd config set --batch-json "$batch_json"
  echo "Agente beacon-lab → modelo ${model}, tools: web_search + tavily_*"
}

sync_agent_skills() {
  local skill_src="$ROOT_DIR/skills/cybolt-presales"
  local skill_dest="$WORKSPACE_DIR/beacon-lab/skills/cybolt-presales"

  if [[ ! -f "$skill_src/SKILL.md" ]]; then
    warn "No se encontró $skill_src/SKILL.md — omitiendo sync de skills"
    return
  fi

  echo "==> Sincronizando skills al workspace beacon-lab"
  rm -rf "$skill_dest"
  mkdir -p "$skill_dest"
  cp -R "$skill_src/." "$skill_dest/"
  echo "Skill cybolt-presales → openclaw/workspace/beacon-lab/skills/cybolt-presales/"
}

require_cmd docker
docker compose version >/dev/null 2>&1 || fail "Docker Compose v2 no disponible"

mkdir -p "$CONFIG_DIR/identity" \
  "$CONFIG_DIR/agents/main/agent" \
  "$CONFIG_DIR/agents/main/sessions" \
  "$CONFIG_DIR/agents/beacon-lab/agent" \
  "$CONFIG_DIR/agents/beacon-lab/sessions" \
  "$CONFIG_DIR/tmp" \
  "$WORKSPACE_DIR/beacon-lab" \
  "$AUTH_DIR"

if [[ ! -f "$ENV_FILE" ]]; then
  cp "$ROOT_DIR/.env.example" "$ENV_FILE"
  echo "Creado $ENV_FILE desde .env.example"
fi

# shellcheck disable=SC1090
set -a
source "$ENV_FILE"
set +a

if is_placeholder "${OPENCLAW_GATEWAY_TOKEN:-}"; then
  OPENCLAW_GATEWAY_TOKEN="$(generate_token)"
  upsert_env "OPENCLAW_GATEWAY_TOKEN" "$OPENCLAW_GATEWAY_TOKEN"
  upsert_env "OPENCLAWD_API_KEY" "$OPENCLAW_GATEWAY_TOKEN"
  echo "Generado OPENCLAW_GATEWAY_TOKEN en .env"
fi

export OPENCLAW_GATEWAY_TOKEN
export OPENCLAW_IMAGE="${OPENCLAW_IMAGE:-ghcr.io/openclaw/openclaw:latest}"
export MINIMAX_MODEL="${MINIMAX_MODEL:-minimax/MiniMax-M3}"

echo "==> Descargando imagen OpenClaw: $OPENCLAW_IMAGE"
docker compose pull openclawd

echo "==> Ajustando permisos (uid 1000)"
docker compose run --rm --no-deps --user root --entrypoint sh openclawd -c \
  'mkdir -p /home/node/.openclaw/tmp /home/node/.config/openclaw; \
   find /home/node/.openclaw -xdev -exec chown node:node {} + 2>/dev/null || true; \
   chown node:node /home/node/.config 2>/dev/null || true; \
   find /home/node/.config/openclaw -xdev -exec chown node:node {} + 2>/dev/null || true'

if [[ ! -f "$CONFIG_DIR/openclaw.json" ]]; then
  echo "==> Onboarding OpenClaw (base, sin proveedor)"
  run_openclawd onboard \
    --mode local \
    --no-install-daemon \
    --non-interactive \
    --accept-risk \
    --auth-choice skip \
    --gateway-auth token \
    --gateway-token-ref-env OPENCLAW_GATEWAY_TOKEN \
    --skip-ui \
    --skip-health \
    --suppress-gateway-token-output
else
  echo "==> Config existente en openclaw/config/openclaw.json"
fi

configure_gateway_basics

if ! run_openclawd agents list 2>/dev/null | grep -q 'beacon-lab'; then
  echo "==> Creando agente beacon-lab"
  run_openclawd agents add beacon-lab \
    --non-interactive \
    --workspace /home/node/.openclaw/workspace/beacon-lab
fi

configure_minimax
configure_tavily_and_beacon_lab_agent
sync_agent_skills

echo ""
echo "OpenClawD listo (MiniMax + Tavily)."
echo "  Control UI: http://localhost:18789"
echo "  Token: OPENCLAW_GATEWAY_TOKEN en .env"
echo "  LLM: ${MINIMAX_MODEL} (requiere MINIMAX_API_KEY)"
echo "  Search: Tavily (requiere TAVILY_API_KEY)"
echo ""
echo "Levanta el stack:"
echo "  docker compose up -d --build"
