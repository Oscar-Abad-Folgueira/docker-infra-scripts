#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

if [ -d "$TARGET/src/storage" ]; then
  chmod -R ug+rwX "$TARGET/src/storage" "$TARGET/src/bootstrap/cache" 2>/dev/null || true
  echo "Fixed Laravel writable permissions"
else
  echo "No Laravel writable dirs found; nothing to fix"
fi
