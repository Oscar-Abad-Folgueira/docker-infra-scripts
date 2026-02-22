#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

printf "== Docker\n"
docker --version
printf "== Compose\n"
docker compose version

if [ -f "$TARGET/docker-compose.yml" ]; then
  printf "== Compose file\n"
  docker compose -f "$TARGET/docker-compose.yml" config >/dev/null && echo "compose config OK"
  printf "== Services\n"
  docker compose -f "$TARGET/docker-compose.yml" ps || true
else
  echo "No docker-compose.yml in $TARGET"
fi

echo "== Ports in use from compose (if any) =="
if [ -f "$TARGET/docker-compose.yml" ]; then
  ports=$(docker compose -f "$TARGET/docker-compose.yml" config | awk '/published:/ {print $2}')
  for p in $ports; do
    lsof -nP -iTCP:"$p" -sTCP:LISTEN >/dev/null 2>&1 && echo "BUSY: $p" || echo "FREE: $p"
  done
fi
