#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

patterns='(AWS_SECRET_ACCESS_KEY|SECRET_KEY|API_KEY|PRIVATE_KEY|TOKEN|PASSWORD=|passwd|xoxb-|ghp_)'
rg -n -S "$patterns" "$TARGET" \
  -g '!**/.git/**' -g '!**/vendor/**' -g '!**/node_modules/**' || true

echo "Secrets check finished"
