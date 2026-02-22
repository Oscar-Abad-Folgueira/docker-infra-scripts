#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/backup-db.sh" "$TARGET"
cd "$TARGET"
docker compose exec app sh -lc 'cd src && php artisan migrate --force'
echo "Safe migrate done"
