#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
SERVICE="${2:-}"
cd "$TARGET"

if [ -n "$SERVICE" ]; then
  docker compose restart "$SERVICE"
else
  docker compose restart
fi

docker compose ps
