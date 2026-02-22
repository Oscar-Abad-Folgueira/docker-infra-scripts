#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
cd "$TARGET"

docker compose exec app sh -lc 'cd src && php artisan queue:work --tries=3 --timeout=120'
