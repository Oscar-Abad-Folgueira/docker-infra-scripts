#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
URL="${2:-http://localhost:8080}"
TITLE="${3:-WordPress Local}"
ADMIN_USER="${4:-admin}"
ADMIN_PASS="${5:-Admin12345.}"
ADMIN_EMAIL="${6:-admin@local.test}"

cd "$TARGET"

docker compose run --rm wordpress sh -lc "apt-get update >/dev/null && apt-get install -y less >/dev/null || true; curl -sSLo /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x /usr/local/bin/wp && wp core install --allow-root --url='$URL' --title='$TITLE' --admin_user='$ADMIN_USER' --admin_password='$ADMIN_PASS' --admin_email='$ADMIN_EMAIL'"

echo "WordPress installed: $URL"
