#!/usr/bin/env bash
set -euo pipefail

# 1) Compose plugin (docker compose)
if ! docker compose version >/dev/null 2>&1; then
  sudo apt-get update -y
  sudo apt-get install -y docker-compose-plugin
fi

# 2) Garantir .envs presentes
cp -n n8n.env.example n8n.env || true
cp -n evolution.env.example evolution.env || true

# 3) Subir os serviços
docker compose pull
docker compose up -d
docker compose ps
