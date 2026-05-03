#!/usr/bin/env bash
# BkkBoost Tools — local dev server launcher
#
# Starts a Python HTTP server on port 8765 (chosen to avoid common dev-port
# collisions) from the directory of this script and opens the browser.

set -euo pipefail

PORT="${PORT:-8765}"
HOST="127.0.0.1"
URL="http://${HOST}:${PORT}/"

# Always serve from the directory containing this script, regardless of cwd.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

# Pick the python binary.
if command -v python3 >/dev/null 2>&1; then
  PY=python3
elif command -v python >/dev/null 2>&1; then
  PY=python
else
  echo "❌ Python is not installed. Install python3 and try again." >&2
  exit 1
fi

# If port is already in use, fail clearly instead of silently sharing the port.
if command -v lsof >/dev/null 2>&1 && lsof -i ":$PORT" -sTCP:LISTEN -t >/dev/null 2>&1; then
  echo "⚠️  Port $PORT is already in use."
  echo "   Either stop the other process or run:  PORT=8766 ./start.sh"
  exit 1
fi

# Pick a browser opener for the current platform.
open_browser() {
  local url="$1"
  if command -v xdg-open >/dev/null 2>&1; then xdg-open "$url" >/dev/null 2>&1 &
  elif command -v open    >/dev/null 2>&1; then open    "$url" >/dev/null 2>&1 &
  elif command -v start   >/dev/null 2>&1; then start   "$url" >/dev/null 2>&1 &
  fi
}

echo "──────────────────────────────────────────────"
echo "  BkkBoost Tools"
echo "  Serving:  $DIR"
echo "  URL:      $URL"
echo "  Stop:     Ctrl+C"
echo "──────────────────────────────────────────────"

# Open browser shortly after the server starts listening.
( sleep 1; open_browser "$URL" ) &

exec "$PY" -m http.server "$PORT" --bind "$HOST"
