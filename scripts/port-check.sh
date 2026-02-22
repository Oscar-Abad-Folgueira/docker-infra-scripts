#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <port> [port2 ...]" >&2
  exit 1
fi

busy=0
for p in "$@"; do
  if lsof -nP -iTCP:"$p" -sTCP:LISTEN >/dev/null 2>&1; then
    echo "BUSY: port $p"
    lsof -nP -iTCP:"$p" -sTCP:LISTEN | tail -n +2
    busy=1
  else
    echo "FREE: port $p"
  fi
done

exit $busy
