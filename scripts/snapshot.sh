#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"
OUT_ROOT="${2:-$TARGET/snapshots}"
STAMP="$(date +%Y%m%d_%H%M%S)"
OUT_DIR="$OUT_ROOT/snapshot_$STAMP"

mkdir -p "$OUT_DIR"
cp "$TARGET/docker-compose.yml" "$OUT_DIR/" 2>/dev/null || true

"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/backup-db.sh" "$TARGET" "$OUT_DIR"

docker compose -f "$TARGET/docker-compose.yml" ps > "$OUT_DIR/compose-ps.txt" || true
docker compose -f "$TARGET/docker-compose.yml" config > "$OUT_DIR/compose-config.yml" || true

echo "Snapshot created: $OUT_DIR"
