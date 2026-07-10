# Deploying the hosted osqf-archive MCP endpoint (AWS Lightsail)

Runs the authenticated HTTP server permanently on a small VM: DuckDB + BM25
need almost nothing; CPU Ollama adds semantic search. No GPU anywhere.

**Footprint:** ~1.2 GB RAM with the embedder loaded → use the **2 GB
Lightsail plan** (~$7/mo). 1 GB works if you skip Ollama (BM25-only).

## 1. Create the instance

Lightsail console → Create instance → **Ubuntu 24.04 LTS**, 2 GB plan.
Then, on the instance's *Networking* tab:

- Attach a **static IP**.
- Firewall: keep SSH (22), add **HTTP (80)** and **HTTPS (443)**.
  Port 8788 stays closed — Caddy terminates TLS and proxies internally.

Point a DNS **A record** for your chosen hostname (e.g.
`osqf-archive.example.com`) at the static IP.

## 2. Ship the code + data

From your workstation (repo checkout + the Release `notes.duckdb`):

```bash
scp -r osqf_mcp   ubuntu@<STATIC_IP>:/tmp/pkg
scp notes.duckdb  ubuntu@<STATIC_IP>:/tmp/notes.duckdb
scp osqf_mcp/deploy/* ubuntu@<STATIC_IP>:/tmp/deploy/
```

## 3. Provision (one shot, idempotent)

```bash
ssh ubuntu@<STATIC_IP>
sudo DOMAIN=osqf-archive.example.com bash /tmp/deploy/setup.sh
```

`setup.sh` installs python/venv + Ollama (pulls `nomic-embed-text`) + Caddy,
lays out `/opt/osqf-mcp/{pkg,venv,data}`, writes `/etc/osqf-mcp.env`,
installs + starts the `osqf-mcp` systemd service, and configures Caddy with
automatic Let's Encrypt for `$DOMAIN`. Omit `DOMAIN=` to skip Caddy (plain
localhost:8788 — for tunnels or testing only).

It finishes by printing the **first conference token** (generated on the box,
sha256-hashed at rest in `/opt/osqf-mcp/tokens.json`). Save it — it is shown
once.

## 4. Smoke test (from anywhere)

```bash
curl -s https://osqf-archive.example.com/health
curl -s -X POST https://osqf-archive.example.com/mcp \
  -H "Authorization: Bearer <TOKEN>" \
  -H "Content-Type: application/json" -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-03-26","capabilities":{},"clientInfo":{"name":"curl","version":"0"}}}'
```

Expect `{"status":"ok"}` and an `initialize` result naming `osqf-archive`.
Then register it in an MCP client per `../CLIENT_SETUP.md` (hosted section).

## 5. Operate

| task | command (on the instance) |
|---|---|
| logs | `journalctl -u osqf-mcp -f` |
| restart | `sudo systemctl restart osqf-mcp` |
| add/rotate a token | `sudo bash /opt/osqf-mcp/deploy/gen_token.sh <label>` then restart |
| revoke a token | delete its line from `/opt/osqf-mcp/tokens.json`, restart |
| new data release | `sudo bash /opt/osqf-mcp/deploy/update_data.sh` |
| semantic vs bm25 check | call the `about` tool — it reports `retrieval_mode` |

Rate limit defaults to 60 req/min globally (`OSQF_RATE_LIMIT` in
`/etc/osqf-mcp.env`).

## 6. Teardown

Delete the Lightsail instance and release the static IP (a detached static
IP bills). DNS record can stay — recreate later with the same runbook.
