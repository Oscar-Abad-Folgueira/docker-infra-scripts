#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
shift || true
ARGS="$*"

cd "$TARGET"
docker compose exec app sh -lc "cd src && APP_ENV=testing DB_CONNECTION=sqlite DB_DATABASE=':memory:' CACHE_STORE=array SESSION_DRIVER=array QUEUE_CONNECTION=sync MAIL_MAILER=array php artisan test $ARGS"
