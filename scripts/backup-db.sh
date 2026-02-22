#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
OUT_DIR="${2:-$TARGET/backups}"
STAMP="$(date +%Y%m%d_%H%M%S)"

cd "$TARGET"
mkdir -p "$OUT_DIR"

if docker compose config --services | grep -qx db; then
  if docker compose exec -T db sh -lc 'command -v pg_dump >/dev/null'; then
    OUT="$OUT_DIR/db_$STAMP.sql"
    docker compose exec -T db sh -lc 'pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" --no-owner --no-privileges' > "$OUT"
    echo "Postgres backup: $OUT"
  elif docker compose exec -T db sh -lc 'command -v mysqldump >/dev/null'; then
    OUT="$OUT_DIR/db_$STAMP.sql"
    docker compose exec -T db sh -lc 'mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"' > "$OUT"
    echo "MySQL backup: $OUT"
  else
    echo "Could not detect pg_dump/mysqldump in db container" >&2
    exit 1
  fi
else
  echo "Service 'db' not found" >&2
  exit 1
fi
