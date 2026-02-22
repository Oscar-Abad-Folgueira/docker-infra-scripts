#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-}"
STACK="${2:-}"
PROJECT="${3:-auto}"

if [ -z "$TARGET" ] || [ -z "$STACK" ]; then
  echo "Usage: $0 <target> <laravel|wordpress|node|postgres> [project_slug]" >&2
  exit 1
fi

"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/create.sh" \
  --stack "$STACK" --target "$TARGET" --project "$PROJECT"

echo "Stack switched to '$STACK' in $TARGET"
