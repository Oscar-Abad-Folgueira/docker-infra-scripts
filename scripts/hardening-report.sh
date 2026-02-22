#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

check() {
  local name="$1" cmd="$2"
  if eval "$cmd"; then
    echo "[OK] $name"
  else
    echo "[WARN] $name"
  fi
}

echo "Hardening report for: $TARGET"
check "No .env in git" "[ ! -f '$TARGET/.git/.env' ]"
check "Compose file exists" "[ -f '$TARGET/docker-compose.yml' ]"
check "Has backup folder" "[ -d '$TARGET/backups' ]"
check "No obvious secrets in repo" "! rg -n -S '(ghp_|xoxb-|PRIVATE_KEY)' '$TARGET' -g '!**/.git/**' >/dev/null"
check "Containers declared with named services" "docker compose -f '$TARGET/docker-compose.yml' config --services >/dev/null 2>&1"
