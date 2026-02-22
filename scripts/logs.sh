#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
SERVICE="${2:-}"
cd "$TARGET"
if [ -n "$SERVICE" ]; then
  docker compose logs -f --tail=150 "$SERVICE"
else
  docker compose logs -f --tail=150
fi
