#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
FROM="${2:-}"
TO="${3:-}"

if [ -z "$FROM" ] || [ -z "$TO" ]; then
  echo "Usage: $0 <target> <from> <to>" >&2
  exit 1
fi

cd "$TARGET"
docker compose run --rm wordpress sh -lc "curl -sSLo /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /usr/local/bin/wp && wp search-replace --allow-root '$FROM' '$TO' --all-tables"
