# osqf-archive MCP — client setup

Chat with 18 years of osQF / R-in-finance conference talks from any MCP client
(Claude Desktop, Claude Code, Cursor, ...). Two ways in:

## A. Hosted (conference endpoint — zero install beyond your MCP client)

You need the endpoint URL and the shared conference token (on the talk's
closing slide / QR code).

**Claude Code**
```bash
claude mcp add osqf-archive --transport http <ENDPOINT_URL>/mcp \
  --header "Authorization: Bearer <CONFERENCE_TOKEN>"
```

**Claude Desktop** (`claude_desktop_config.json`)
```json
{
  "mcpServers": {
    "osqf-archive": {
      "type": "http",
      "url": "<ENDPOINT_URL>/mcp",
      "headers": { "Authorization": "Bearer <CONFERENCE_TOKEN>" }
    }
  }
}
```

Smoke test without an MCP client:
```bash
curl -s <ENDPOINT_URL>/health
curl -s -X POST <ENDPOINT_URL>/mcp \
  -H "Authorization: Bearer <CONFERENCE_TOKEN>" \
  -H "Content-Type: application/json" -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-03-26","capabilities":{},"clientInfo":{"name":"curl","version":"0"}}}'
```

The endpoint is rate-limited globally (~60 req/min shared) and read-only.
It may go away after the conference; the offline bundle below is forever.

## B. Offline (runs on your laptop, no server, no account)

1. `pip install "mcp>=1.9" "duckdb>=1.1"` (Python ≥ 3.10)
2. Download **`notes.duckdb`** from the repo's Release assets (~60 MB).
3. Point your MCP client at the package over stdio:

```bash
claude mcp add osqf-archive \
  --env OSQF_DB=/path/to/notes.duckdb \
  -- python -m osqf_mcp
```

(or the equivalent `command`/`args`/`env` block in Claude Desktop.)

Offline mode uses a **built-in BM25 full-text index** — no models needed.
For semantic search, optionally run [Ollama](https://ollama.com) and
`ollama pull nomic-embed-text`; the server auto-detects it (env `OLLAMA_URL`
if not on localhost:11434).

## Tools

| tool | what it does |
|---|---|
| `about` | archive contents, coverage, current retrieval mode |
| `search_talks(query, k, year, speaker, topic)` | search talk content (semantic or BM25) |
| `get_talk(slug)` | full derived note + metadata + related talks |
| `browse(year, speaker, file_format)` | list the manifest (800+ entries) |
| `related_talks(slug)` | precomputed PageRank neighbours |
| `find_experts(topic)` | who presents most centrally on a topic, 2009–2026 |
| `run_select(sql)` | read-only SQL over all tables (500-row cap) |

Try: *"Who are the recurring experts on portfolio optimization, and what did
they present most recently?"* — the client should chain `find_experts` →
`browse`/`get_talk`.

## Provenance & terms

Derived notes and embeddings come from publicly posted conference decks at
osqf.org; **original PDFs are not redistributed** — every talk carries its
`file_url` back to the source. Code MIT; derived notes CC-BY-4.0 with speaker
attribution. Takedown requests: open a GitHub issue.
