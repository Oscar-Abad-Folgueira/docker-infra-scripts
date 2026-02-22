#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-}"
REPO_URL="${2:-}"

if [ -z "$TARGET_DIR" ]; then
  echo "Usage: $0 /path/to/project [repo_url]" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
if [ -n "$REPO_URL" ]; then
  if [ -n "$(ls -A "$TARGET_DIR" 2>/dev/null || true)" ]; then
    echo "Target is not empty: $TARGET_DIR" >&2
    exit 1
  fi
  git clone "$REPO_URL" "$TARGET_DIR"
fi

echo "Project ready: $TARGET_DIR"
