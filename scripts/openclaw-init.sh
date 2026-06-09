#!/bin/sh
# Prepara directorios bind-mount de OpenClaw con dueño node (uid 1000).
# Se ejecuta como root antes de openclawd (evita carpetas creadas como root al montar).
set -eu

mkdir -p \
  /home/node/.openclaw/tmp \
  /home/node/.openclaw/identity \
  /home/node/.openclaw/agents/main/agent \
  /home/node/.openclaw/agents/main/sessions \
  /home/node/.openclaw/agents/beacon-lab/agent \
  /home/node/.openclaw/agents/beacon-lab/sessions \
  /home/node/.openclaw/workspace/beacon-lab \
  /home/node/.config/openclaw

chown -R node:node /home/node/.openclaw /home/node/.config/openclaw
chmod -R u+rwX,g+rwX /home/node/.openclaw /home/node/.config/openclaw
