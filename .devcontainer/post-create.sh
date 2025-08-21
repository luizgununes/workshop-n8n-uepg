#!/usr/bin/env bash
set -e
cp -n n8n.env.example n8n.env || true
cp -n evolution.env.example evolution.env || true
docker compose pull
docker compose up -d
