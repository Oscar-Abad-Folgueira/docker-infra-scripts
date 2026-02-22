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

npm run lint --if-present
npm run test --if-present

echo "Next.js bootstrap complete"
