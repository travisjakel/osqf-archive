#!/usr/bin/env bash
# Pull the latest notes.duckdb Release asset and hot-swap it.
#   sudo bash update_data.sh                       # public repo
#   sudo GH_TOKEN=... bash update_data.sh          # while the repo is private
set -euo pipefail
APP=/opt/osqf-mcp
REPO="${OSQF_REPO:-travisjakel/osqf-archive}"
URL="https://github.com/$REPO/releases/latest/download/notes.duckdb"

AUTH=()
[ -n "${GH_TOKEN:-}" ] && AUTH=(-H "Authorization: Bearer $GH_TOKEN")

echo "fetching $URL"
curl -fL "${AUTH[@]}" -o "$APP/data/notes.duckdb.new" "$URL"
[ -s "$APP/data/notes.duckdb.new" ] || { echo "empty download"; exit 1; }
mv "$APP/data/notes.duckdb.new" "$APP/data/notes.duckdb"
chown osqf:osqf "$APP/data/notes.duckdb"
systemctl restart osqf-mcp
sleep 3
curl -s --max-time 5 http://127.0.0.1:8788/health && echo " <- health OK after swap"
