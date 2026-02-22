#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/doctor.sh" "$TARGET"
"$SCRIPT_DIR/secrets-check.sh" "$TARGET"

if [ -d "$TARGET/src" ] && [ -f "$TARGET/src/artisan" ]; then
  echo "Laravel app detected. Running test-safe..."
  "$SCRIPT_DIR/test-safe.sh" "$TARGET" || true
fi

echo "Preflight complete"
