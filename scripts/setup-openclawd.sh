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
  # Read config inside the container — openclaw.json is owned by uid 1000 after onboarding.
  docker compose run --rm --no-deps \
    -e HOME=/home/node \
    -e OPENCLAW_CONFIG_PATH=/home/node/.openclaw/openclaw.json \
    --entrypoint node openclawd -e "
const fs = require('fs');
const cfg = JSON.parse(fs.readFileSync('/home/node/.openclaw/openclaw.json', 'utf8'));
const list = cfg.agents?.list ?? [];
for (let i = 0; i < list.length; i++) {
  if (list[i].id === 'beacon-lab') {
    console.log(i);
    process.exit(0);
  }
}
process.exit(1);
"
}

ensure_openclaw_volume_layout() {
  echo "==> Preparando volúmenes openclaw/ (uid 1000, evita dirs root al montar)"
  docker compose run --rm --no-deps openclaw-init
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

  if [[ ! -f "$skill_src/SKILL.md" ]]; then
    warn "No se encontró $skill_src/SKILL.md — omitiendo sync de skills"
    return
  fi

  echo "==> Sincronizando skills al workspace beacon-lab (vía contenedor)"
  docker compose run --rm --no-deps --user root \
    -v "${skill_src}:/skill-src:ro" \
    --entrypoint sh openclawd -c \
    'rm -rf /home/node/.openclaw/workspace/beacon-lab/skills/cybolt-presales
mkdir -p /home/node/.openclaw/workspace/beacon-lab/skills/cybolt-presales
cp -R /skill-src/. /home/node/.openclaw/workspace/beacon-lab/skills/cybolt-presales/
chown -R node:node /home/node/.openclaw/workspace/beacon-lab/skills'
  echo "Skill cybolt-presales → openclaw/workspace/beacon-lab/skills/cybolt-presales/"
}

require_cmd docker
docker compose version >/dev/null 2>&1 || fail "Docker Compose v2 no disponible"

# Solo crear el árbol base; permisos finos los fija openclaw-init (como root → uid 1000).
mkdir -p "$ROOT_DIR/openclaw"

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
docker compose pull openclawd openclaw-init

ensure_openclaw_volume_layout

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
ensure_openclaw_volume_layout

echo ""
echo "OpenClawD listo (MiniMax + Tavily)."
echo "  Control UI: http://localhost:18789"
echo "  Token: OPENCLAW_GATEWAY_TOKEN en .env"
echo "  LLM: ${MINIMAX_MODEL} (requiere MINIMAX_API_KEY)"
echo "  Search: Tavily (requiere TAVILY_API_KEY)"
echo ""
echo "Levanta el stack:"
echo "  docker compose up -d --build"
