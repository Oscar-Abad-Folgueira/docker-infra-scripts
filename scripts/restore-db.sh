#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
DUMP_FILE="${2:-}"

if [ -z "$DUMP_FILE" ]; then
  echo "Usage: $0 <target> <dump.sql>" >&2
  exit 1
fi

cd "$TARGET"
[ -f "$DUMP_FILE" ] || { echo "Dump not found: $DUMP_FILE" >&2; exit 1; }

if docker compose exec -T db sh -lc 'command -v psql >/dev/null'; then
  cat "$DUMP_FILE" | docker compose exec -T db sh -lc 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"'
  echo "Restored into Postgres"
elif docker compose exec -T db sh -lc 'command -v mysql >/dev/null'; then
  cat "$DUMP_FILE" | docker compose exec -T db sh -lc 'mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"'
  echo "Restored into MySQL"
else
  echo "Could not detect psql/mysql in db container" >&2
  exit 1
fi
