# Beacon Lab Agent API

API HTTP en Python (FastAPI) que genera el **Beacon Lab Daily Threat Briefing** usando [OpenClaw](https://docs.openclaw.ai/) como gateway de agentes y LLM.

Pensada para correr en Docker junto a **n8n**: el workflow llama a `POST /briefing` y reenvía la respuesta (por ejemplo a Telegram).

## Arquitectura

```
n8n ──POST /briefing──▶ agent-api ──POST /v1/chat/completions──▶ openclawd (agente beacon-lab)
                              :8000                                        :18789
                                                                               ├─ MiniMax → razonamiento / redacción
                                                                               └─ Tavily  → web_search / tavily_search
```

| Componente | Proveedor | Rol |
|------------|-----------|-----|
| `agent-api` | — | Wrapper HTTP: valida request, llama a OpenClawD |
| `openclawd` | — | Gateway OpenClaw, agente `beacon-lab` |
| LLM | **MiniMax** (`MINIMAX_MODEL`) | Genera y razona el briefing |
| Búsqueda | **Tavily** (`TAVILY_API_KEY`) | Intel de amenazas vía `web_search` / `tavily_search` |

## Estructura del proyecto

```
agent-beaconlab/
├── src/beacon_lab/          # Código de la API
│   ├── api/app.py           # FastAPI (rutas /health, /briefing)
│   ├── core/                # Config y system prompt
│   ├── models/              # Schemas Pydantic
│   └── services/openclawd.py # Cliente HTTP hacia OpenClawD
├── skills/                  # Skills OpenClaw (fuente en git)
│   └── cybolt-presales/
│       ├── SKILL.md         # Skill principal
│       └── references/      # Contexto Cybolt (BUs, RFP, competidores…)
├── scripts/
│   └── setup-openclawd.sh   # Bootstrap del gateway (primera vez)
├── openclaw/                # Datos persistentes del gateway (gitignored)
├── docker-compose.yml
├── Dockerfile
└── requirements.txt
```

### Skills OpenClaw

Los skills viven en el repo bajo `skills/` y el setup los copia al workspace del agente:

```
openclaw/workspace/beacon-lab/skills/cybolt-presales/
```

OpenClaw los descubre automáticamente desde el workspace del agente `beacon-lab`. Tras editar un skill en git, re-ejecuta `./scripts/setup-openclawd.sh` para sincronizar.

## Requisitos

- Docker + Docker Compose v2
- ~2 GB RAM para la imagen de OpenClaw
- `MINIMAX_API_KEY` — [MiniMax](https://www.minimax.io/) (LLM)
- `TAVILY_API_KEY` — [Tavily](https://tavily.com/) (búsqueda web)

## Inicio rápido (Docker)

```bash
cp .env.example .env
# Edita .env: MINIMAX_API_KEY y TAVILY_API_KEY
./scripts/setup-openclawd.sh
docker compose up -d --build
```

Probar:

```bash
curl http://localhost:8010/health

curl -X POST http://localhost:8010/briefing \
  -H "Content-Type: application/json" \
  -d '{"date":"2026-06-09","language":"es","max_words":1200}'
```

Documentación interactiva: http://localhost:8010/docs

OpenClaw Control UI: http://localhost:18789 (token en `OPENCLAW_GATEWAY_TOKEN` del `.env`)

> El compose expone la API en el puerto **8010** del host por defecto (`AGENT_API_PORT=8010`). Dentro de Docker la API sigue en `:8000` (`agent-api:8000` para n8n).

## Proveedores (MiniMax + Tavily)

`scripts/setup-openclawd.sh` configura automáticamente:

| Qué | Dónde |
|-----|-------|
| MiniMax como LLM | `models.providers.minimax` + agente `beacon-lab` |
| Tavily como search | `plugins.entries.tavily` + `tools.web.search.provider: tavily` |
| Tools del agente | `web_search`, `tavily_search`, `tavily_extract` |

Variables en `.env`:

```bash
MINIMAX_API_KEY=sk-...
MINIMAX_MODEL=minimax/MiniMax-M3   # default del setup
TAVILY_API_KEY=tvly-...
```

Si cambias las keys, re-ejecuta `./scripts/setup-openclawd.sh` y reinicia: `docker compose up -d`.

## API

### `GET /health`

```json
{"status": "ok"}
```

### `POST /briefing`

**Request:**

```json
{
  "date": "2026-06-09",
  "language": "es",
  "max_words": 1200
}
```

**Response (200):**

```json
{
  "status": "ok",
  "date": "2026-06-09",
  "language": "es",
  "briefing": "..."
}
```

**Errores:**

| Código | `error`            | Causa típica |
|--------|--------------------|--------------|
| 422    | `validation_error` | JSON inválido |
| 502    | `upstream_error`   | OpenClawD no responde o error del LLM |
| 504    | `upstream_timeout` | Briefing superó el timeout |

## Variables de entorno

| Variable | Descripción |
|----------|-------------|
| `MINIMAX_API_KEY` | API key MiniMax (LLM del agente) |
| `MINIMAX_MODEL` | Modelo OpenClaw (default: `minimax/MiniMax-M3`) |
| `TAVILY_API_KEY` | API key Tavily (búsqueda web) |
| `OPENCLAW_GATEWAY_TOKEN` | Token del gateway (generado por `setup-openclawd.sh`) |
| `OPENCLAWD_BASE_URL` | URL interna del gateway (`http://openclawd:18789` en Docker) |
| `OPENCLAWD_API_KEY` | Debe coincidir con `OPENCLAW_GATEWAY_TOKEN` |
| `OPENCLAWD_MODEL` | Agente OpenClaw (`openclaw:beacon-lab`) |
| `OPENCLAWD_AGENT_ID` | Header `x-openclaw-agent-id` (opcional) |
| `OPENCLAWD_TIMEOUT_SECONDS` | Timeout del briefing (default: 180) |
| `AGENT_API_PORT` | Puerto en el host para acceder a la API (default: 8010) |

Ver `.env.example` para el listado completo.

## Desarrollo local (sin Docker)

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env

export PYTHONPATH=src
export OPENCLAWD_BASE_URL=http://localhost:18789
export OPENCLAWD_API_KEY=<tu-token>

uvicorn beacon_lab.api.app:app --reload --host 127.0.0.1 --port 8010
```

Necesitas OpenClaw corriendo por separado (`docker compose up -d openclawd` o el setup completo).

## Integración con n8n ([n8n-deploy](https://github.com/Piuliss/n8n-deploy))

Ambos stacks comparten la red Docker **`beaconlab`**.

```bash
# 1. Levanta agent-beaconlab (crea la red beaconlab)
cd agent-beaconlab
docker compose up -d --build

# 2. Levanta n8n-deploy (n8n se une a beaconlab como red externa)
cd ../n8n-deploy
docker compose up -d
```

**En n8n** — nodo HTTP Request:

| Campo | Valor |
|-------|-------|
| Method | `POST` |
| URL | `http://agent-api:8000/briefing` |
| Body (JSON) | `{"date":"2026-06-09","language":"es","max_words":1200}` |

> Usa el nombre del contenedor `agent-api` y puerto **8000** (interno). No uses `8010` — ese es solo para acceso desde el host.

Si la red no existe aún (solo n8n, sin agent-beaconlab):

```bash
docker network create beaconlab
```

## Despliegue en VPS

1. Copia el repo en el servidor (ej. `/opt/agent-beaconlab`)
2. `cp .env.example .env && ./scripts/setup-openclawd.sh`
3. Levanta n8n-deploy y luego `docker compose up -d --build`
4. En producción puedes comentar los `ports` de `agent-api` y `openclawd` si solo n8n accede por red interna

## Comandos útiles

```bash
# Logs
docker compose logs -f agent-api
docker compose logs -f openclawd

# Re-ejecutar setup de OpenClaw (idempotente)
./scripts/setup-openclawd.sh

# Listar agentes configurados
docker compose run --rm --entrypoint node openclawd dist/index.js agents list
```

## Licencia

Uso interno Cybolt / Beacon Lab.
