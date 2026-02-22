#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
cd "$TARGET"

if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi
npm run lint --if-present
npm test --if-present
npm run build --if-present
