#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
cd "$TARGET"

if [ ! -f package.json ]; then
  echo "No package.json found in $TARGET" >&2
  exit 1
fi

if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi

[ -f .env ] || cp .env.example .env 2>/dev/null || true

echo "Strapi bootstrap complete"
