#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
SERVICE="${2:-app}"
shift 2 || true

cd "$TARGET"

if [ "$#" -eq 0 ]; then
  docker compose exec "$SERVICE" sh
else
  docker compose exec "$SERVICE" "$@"
fi
