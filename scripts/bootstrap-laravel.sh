#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-.}"
APP_SERVICE="${APP_SERVICE:-app}"
LARAVEL_DIR="${LARAVEL_DIR:-src}"
cd "$TARGET"

[ -d "$LARAVEL_DIR" ] || { echo "Missing $LARAVEL_DIR directory"; exit 1; }

docker compose exec "$APP_SERVICE" sh -lc "cd '$LARAVEL_DIR' && composer install"
docker compose exec "$APP_SERVICE" sh -lc "cd '$LARAVEL_DIR' && [ -f .env ] || cp .env.example .env"
docker compose exec "$APP_SERVICE" sh -lc "cd '$LARAVEL_DIR' && php artisan key:generate"
docker compose exec "$APP_SERVICE" sh -lc "cd '$LARAVEL_DIR' && php artisan migrate --seed --force"
docker compose exec "$APP_SERVICE" sh -lc "cd '$LARAVEL_DIR' && php artisan optimize:clear"
