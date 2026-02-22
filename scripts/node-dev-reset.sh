#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
cd "$TARGET"

rm -rf node_modules .next dist build .turbo .vite 2>/dev/null || true
npm cache verify || true
npm install
