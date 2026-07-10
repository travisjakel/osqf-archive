#!/usr/bin/env bash
# One-shot provision of the osqf-archive MCP endpoint on Ubuntu 24.04
# (tested target: AWS Lightsail 2 GB). Idempotent — safe to re-run.
#
#   sudo DOMAIN=osqf-archive.example.com bash setup.sh   # with Caddy/TLS
#   sudo bash setup.sh                                    # no TLS (local only)
#
# Expects (see DEPLOY.md):
#   /tmp/pkg            the repo's osqf_mcp/ directory (pyproject + package)
#   /tmp/notes.duckdb   the Release data asset
#   /tmp/deploy/        this directory
set -euo pipefail
[ "$(id -u)" -eq 0 ] || { echo "run with sudo"; exit 1; }

APP=/opt/osqf-mcp
DOMAIN="${DOMAIN:-}"

echo "== packages =="
apt-get update -y
apt-get install -y python3-venv python3-pip curl jq

echo "== ollama (CPU embedder) =="
if ! command -v ollama >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
fi
systemctl enable --now ollama
for i in $(seq 1 20); do
  curl -s --max-time 2 http://127.0.0.1:11434/api/tags >/dev/null && break; sleep 2
done
ollama pull nomic-embed-text

echo "== app layout =="
id -u osqf >/dev/null 2>&1 || useradd --system --home "$APP" --shell /usr/sbin/nologin osqf
mkdir -p "$APP/data" "$APP/deploy"
[ -d /tmp/pkg ] && rm -rf "$APP/pkg" && cp -r /tmp/pkg "$APP/pkg"
[ -f /tmp/notes.duckdb ] && cp /tmp/notes.duckdb "$APP/data/notes.duckdb"
cp /tmp/deploy/*.sh "$APP/deploy/" 2>/dev/null || true
cp /tmp/deploy/osqf-mcp.service /etc/systemd/system/osqf-mcp.service
[ -f "$APP/pkg/pyproject.toml" ] || { echo "missing $APP/pkg (scp the repo's osqf_mcp/ to /tmp/pkg)"; exit 1; }
[ -f "$APP/data/notes.duckdb" ]  || { echo "missing $APP/data/notes.duckdb"; exit 1; }

echo "== venv =="
[ -d "$APP/venv" ] || python3 -m venv "$APP/venv"
"$APP/venv/bin/pip" install --quiet --upgrade pip
"$APP/venv/bin/pip" install --quiet "$APP/pkg[http]"

echo "== env + tokens =="
if [ ! -f /etc/osqf-mcp.env ]; then
  cat > /etc/osqf-mcp.env <<EOF
OSQF_DB=$APP/data/notes.duckdb
OSQF_AUTH_TOKENS_FILE=$APP/tokens.json
OSQF_BIND_HOST=127.0.0.1
OSQF_BIND_PORT=8788
OSQF_RATE_LIMIT=60
OSQF_ALLOWED_HOSTS=$DOMAIN
OLLAMA_URL=http://127.0.0.1:11434
EOF
  chmod 600 /etc/osqf-mcp.env
fi
if [ ! -f "$APP/tokens.json" ]; then
  bash "$APP/deploy/gen_token.sh" conference
fi
chown -R osqf:osqf "$APP"

echo "== service =="
systemctl daemon-reload
systemctl enable --now osqf-mcp
sleep 3
curl -s --max-time 5 http://127.0.0.1:8788/health && echo " <- local health OK"

if [ -n "$DOMAIN" ]; then
  echo "== caddy (TLS for $DOMAIN) =="
  if ! command -v caddy >/dev/null 2>&1; then
    apt-get install -y debian-keyring debian-archive-keyring apt-transport-https
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' \
      | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' \
      > /etc/apt/sources.list.d/caddy-stable.list
    apt-get update -y && apt-get install -y caddy
  fi
  # /t/<token>/... route: claude.ai custom connectors (web/mobile) can't send
  # bearer headers, so the token rides the URL and Caddy converts it.
  cat > /etc/caddy/Caddyfile <<CADDYEOF
$DOMAIN {
	@tok path_regexp tok ^/t/([^/]+)(/.*)\$
	handle @tok {
		rewrite * {re.tok.2}
		reverse_proxy 127.0.0.1:8788 {
			header_up Authorization "Bearer {re.tok.1}"
		}
	}
	reverse_proxy 127.0.0.1:8788
}
CADDYEOF
  systemctl enable caddy
  systemctl restart caddy
  echo "Caddy serving https://$DOMAIN (Let's Encrypt is automatic once DNS resolves here)"
fi

echo
echo "DONE. Logs: journalctl -u osqf-mcp -f"
