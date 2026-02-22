#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
PLUGINS_CSV="${2:-}"

if [ -z "$PLUGINS_CSV" ]; then
  echo "Usage: $0 <target> <plugin1,plugin2,...>" >&2
  exit 1
fi

cd "$TARGET"

docker compose run --rm wordpress sh -lc "curl -sSLo /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /usr/local/bin/wp && IFS=','; for p in $PLUGINS_CSV; do wp plugin install --allow-root \"$p\" --activate; done"
