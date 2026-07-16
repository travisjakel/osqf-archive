"""Thin public chat wrapper over the osqf-archive tools.

One Starlette app (default 127.0.0.1:8790, put Caddy in front): a single-page
chat UI + /chat/api SSE agent loop. The LLM is a cloud API (OpenAI-compatible,
default OpenRouter); the archive tools are called IN-PROCESS from
osqf_mcp.server, so the demo exercises exactly what MCP clients see. Answers
stream token-by-token; identical questions are served from a deterministic
cache (free); slide-page images (OSQF_PAGES_DIR) render inline via show_page.

Guards (this is a public page over a paid API):
  * same bearer-token table as the MCP server (?t=<token> or form field)
  * per-token daily message cap          (OSQF_CHAT_MSG_CAP, default 30)
  * per-token per-minute rate limit      (OSQF_CHAT_RATE_PER_MIN, default 8)
  * hard daily spend cap in USD          (OSQF_CHAT_DAILY_USD, default 5.0)
  * tool-result truncation + bounded agent loop (MAX_TOOL_ROUNDS)
  * cache hits bypass all caps — they cost nothing

Env: OPENROUTER_API_KEY (required)   OSQF_CHAT_MODEL (default anthropic/claude-haiku-4.5)
     OSQF_CHAT_PORT=8790  OSQF_CHAT_PRICE_IN=1.0  OSQF_CHAT_PRICE_OUT=5.0  ($/Mtok)
     OSQF_CHAT_STATE (default /var/lib/osqf-mcp)   OSQF_CHAT_CACHE_TTL (default 86400)
     OSQF_PAGES_DIR (default /opt/osqf-mcp/pages)  OSQF_CHAT_BASE_URL
"""
from __future__ import annotations

import datetime
import hashlib
import io
import json
import os
import re
import threading
import time
import urllib.request
import zipfile
from collections import deque
from pathlib import Path

from starlette.applications import Starlette
from starlette.responses import (FileResponse, HTMLResponse, JSONResponse, Response,
                                 StreamingResponse)
from starlette.routing import Route

from . import server as S
from .serve_http import _load_token_table

API_URL = os.environ.get("OSQF_CHAT_API_URL", "https://openrouter.ai/api/v1/chat/completions")
API_KEY = os.environ.get("OPENROUTER_API_KEY", "")
MODEL = os.environ.get("OSQF_CHAT_MODEL", "anthropic/claude-haiku-4.5")
PRICE_IN = float(os.environ.get("OSQF_CHAT_PRICE_IN", "1.0"))    # $ / M tokens
PRICE_OUT = float(os.environ.get("OSQF_CHAT_PRICE_OUT", "5.0"))
DAILY_USD = float(os.environ.get("OSQF_CHAT_DAILY_USD", "5.0"))
MSG_CAP = int(os.environ.get("OSQF_CHAT_MSG_CAP", "30"))
RATE_PER_MIN = int(os.environ.get("OSQF_CHAT_RATE_PER_MIN", "8"))   # per token, sliding 60s
STATE = Path(os.environ.get("OSQF_CHAT_STATE", "/var/lib/osqf-mcp")) / "chat_budget.json"
MAX_TOOL_ROUNDS = 12
TOOL_RESULT_CAP = 8000

TOKENS = _load_token_table()
_lock = threading.Lock()
_recent: dict[str, deque] = {}   # label -> timestamps of recent requests

SYSTEM = (
    "You are the osqf-archive assistant: a search agent over 18 years of osQF / "
    "R-in-finance conference talks (2009-2025; 626 talks, 462 with extracted notes). "
    "Always ground answers in tool results — never invent talks or speakers. "
    "Cite talks inline as (year, speaker: title) and include the file_url link when you "
    "have it. Prefer search_talks + get_talk; use find_experts for who-questions and "
    "related_talks for exploration. When the user asks about a chart, table, or figure, "
    "or asks to SEE a slide/deck, call show_page for the cited talk and put the returned "
    "image_url on its own line — the page renders it inline with page-flip controls. "
    "Be concise: a short direct answer, then the "
    "citations. If a question is unrelated to the archive or quantitative finance, "
    "say so briefly and suggest an archive question instead."
)

TOOLS = [
    {"type": "function", "function": {
        "name": "search_talks",
        "description": "Semantic/BM25 search over talk content. Returns chunk-level hits with slug, section, snippet, score.",
        "parameters": {"type": "object", "properties": {
            "query": {"type": "string"}, "k": {"type": "integer", "default": 8},
            "year": {"type": "array", "items": {"type": "integer"}},
            "speaker": {"type": "string"}, "topic": {"type": "string"}},
            "required": ["query"]}}},
    {"type": "function", "function": {
        "name": "get_talk",
        "description": "Full derived note + metadata + related talks for one slug (e.g. '2019__kris_boudt').",
        "parameters": {"type": "object", "properties": {"slug": {"type": "string"}},
                       "required": ["slug"]}}},
    {"type": "function", "function": {
        "name": "browse",
        "description": "List talks from the manifest by year / speaker / file format.",
        "parameters": {"type": "object", "properties": {
            "year": {"type": "array", "items": {"type": "integer"}},
            "speaker": {"type": "string"}, "file_format": {"type": "string"},
            "limit": {"type": "integer", "default": 25}}}}},
    {"type": "function", "function": {
        "name": "related_talks",
        "description": "Precomputed PageRank neighbours of a talk slug.",
        "parameters": {"type": "object", "properties": {
            "slug": {"type": "string"}, "k": {"type": "integer", "default": 8}},
            "required": ["slug"]}}},
    {"type": "function", "function": {
        "name": "find_experts",
        "description": "Who presents most centrally on a topic/method/tag across 18 years.",
        "parameters": {"type": "object", "properties": {
            "topic": {"type": "string"}, "k": {"type": "integer", "default": 8}},
            "required": ["topic"]}}},
    {"type": "function", "function": {
        "name": "run_select",
        "description": "Read-only SELECT/WITH SQL over tables: chunks, talks, notes, talk_tags, paper_links, related_talks, experts (500-row cap).",
        "parameters": {"type": "object", "properties": {"sql": {"type": "string"}},
                       "required": ["sql"]}}},
    {"type": "function", "function": {
        "name": "about",
        "description": "Archive contents, coverage and retrieval mode.",
        "parameters": {"type": "object", "properties": {}}}},
    {"type": "function", "function": {
        "name": "show_page",
        "description": "Embed a slide-page image of a talk in the chat. Returns image_url "
                       "and the talk's page count; put image_url on its own line in the "
                       "answer to display it. Page 1 is the title slide. Use when the user "
                       "asks about a chart/table/figure or wants to see the deck.",
        "parameters": {"type": "object", "properties": {
            "slug": {"type": "string"}, "page": {"type": "integer", "default": 1}},
            "required": ["slug"]}}},
]

# slide-page images (built by downsample_pages.py; served by /chat/page/...)
PAGES_DIR = Path(os.environ.get("OSQF_PAGES_DIR", "/opt/osqf-mcp/pages"))
try:
    _PAGES = json.loads((PAGES_DIR / "manifest.json").read_text())
except Exception:
    _PAGES = {}


def show_page(slug: str, page: int = 1) -> dict:
    n = _PAGES.get(slug)
    if not n:
        return {"error": f"no page images available for '{slug}'"}
    page = max(1, min(int(page), n))
    return {"image_url": f"{BASE_URL}/chat/page/{slug}/{page}",
            "page": page, "n_pages": n,
            "note": "put image_url on its own line in the answer to render it inline"}


TOOL_FNS = {"search_talks": S.search_talks, "get_talk": S.get_talk, "browse": S.browse,
            "related_talks": S.related_talks, "find_experts": S.find_experts,
            "run_select": S.run_select, "about": S.about, "show_page": show_page}


# ---- budget state --------------------------------------------------------------
def _state():
    today = datetime.date.today().isoformat()
    try:
        st = json.loads(STATE.read_text())
    except Exception:
        st = {}
    if st.get("date") != today:
        st = {"date": today, "usd": 0.0, "msgs": {}}
    return st


def _save(st):
    STATE.parent.mkdir(parents=True, exist_ok=True)
    STATE.write_text(json.dumps(st))


def _auth_label(token: str) -> str | None:
    if not token:
        return None
    return TOKENS.get(hashlib.sha256(token.strip().encode()).hexdigest())


# ---- answer cache ---------------------------------------------------------------
# Deterministic same-question cache: demo-day insurance. A cache hit costs no
# LLM call and charges neither the message cap nor the rate limiter.
CACHE_TTL = int(os.environ.get("OSQF_CHAT_CACHE_TTL", "86400"))
CACHE_MAX = 200
CACHE_PATH = STATE.parent / "chat_cache.json"


def _cache_key(text: str) -> str:
    norm = re.sub(r"\s+", " ", text.strip().lower()).rstrip("?!. ")
    return hashlib.sha256(norm.encode()).hexdigest()[:32]


def _cache_load() -> dict:
    try:
        return json.loads(CACHE_PATH.read_text())
    except Exception:
        return {}


def _cache_get(key):
    e = _cache_load().get(key)
    return e if e and time.time() - e["ts"] < CACHE_TTL else None


def _cache_put(key, answer, trace):
    c = _cache_load()
    c[key] = {"answer": answer, "trace": trace, "ts": time.time()}
    while len(c) > CACHE_MAX:
        c.pop(min(c, key=lambda k: c[k]["ts"]))
    CACHE_PATH.parent.mkdir(parents=True, exist_ok=True)
    CACHE_PATH.write_text(json.dumps(c))


# ---- agent loop (streaming) ------------------------------------------------------
def _llm_stream(messages, use_tools=True):
    """Generator over one OpenRouter call: yields ("delta", text) as answer tokens
    arrive and ("reset", None) if tool calls appear after text was streamed.
    Returns (assistant_message, usd) via StopIteration.value."""
    body = {"model": MODEL, "messages": messages, "max_tokens": 1200,
            "temperature": 0.2, "stream": True,
            "stream_options": {"include_usage": True}}
    if use_tools:
        body["tools"] = TOOLS
    req = urllib.request.Request(API_URL, data=json.dumps(body).encode(), headers={
        "Authorization": f"Bearer {API_KEY}", "Content-Type": "application/json"})
    content, calls, usage, streamed = [], {}, {}, False
    with urllib.request.urlopen(req, timeout=180) as r:
        for raw in r:
            line = raw.decode("utf-8", "replace").strip()
            if not line.startswith("data:"):
                continue
            data = line[5:].strip()
            if data == "[DONE]":
                break
            try:
                j = json.loads(data)
            except Exception:
                continue
            if j.get("usage"):
                usage = j["usage"]
            d = ((j.get("choices") or [{}])[0]).get("delta") or {}
            for tc in d.get("tool_calls") or []:
                slot = calls.setdefault(tc.get("index", 0), {
                    "id": "", "type": "function",
                    "function": {"name": "", "arguments": ""}})
                if tc.get("id"):
                    slot["id"] = tc["id"]
                fn = tc.get("function") or {}
                slot["function"]["name"] += fn.get("name") or ""
                slot["function"]["arguments"] += fn.get("arguments") or ""
                if streamed:  # text we already forwarded wasn't the final answer
                    streamed, content = False, []
                    yield ("reset", None)
            if d.get("content"):
                content.append(d["content"])
                if not calls:
                    streamed = True
                    yield ("delta", d["content"])
    usd = (usage.get("prompt_tokens", 0) * PRICE_IN +
           usage.get("completion_tokens", 0) * PRICE_OUT) / 1e6
    msg = {"role": "assistant", "content": "".join(content) or None}
    if calls:
        msg["tool_calls"] = [calls[i] for i in sorted(calls)]
    return msg, usd


def _call_live(msgs, use_tools=True):
    """Generator: forwards one _llm_stream call's events live as UI dicts, then
    yields the terminal ("__res__", (msg, usd)) marker."""
    gen = _llm_stream(msgs, use_tools=use_tools)
    while True:
        try:
            kind, val = next(gen)
        except StopIteration as st:
            yield ("__res__", st.value)
            return
        yield {"t": "delta", "d": val} if kind == "delta" else {"t": "reset"}


def _agent_events(history):
    """Generator of UI event dicts; final event is {"t":"fin", answer, trace, usd}."""
    msgs = [{"role": "system", "content": SYSTEM}] + history[-12:]
    spent, trace = 0.0, []
    for _ in range(MAX_TOOL_ROUNDS):
        msg = usd = None
        for ev in _call_live(msgs):
            if isinstance(ev, tuple):
                msg, usd = ev[1]
            else:
                yield ev
        spent += usd
        calls = msg.get("tool_calls") or []
        if not calls:
            yield {"t": "fin", "answer": (msg.get("content") or "").strip(),
                   "trace": trace, "usd": spent}
            return
        msgs.append(msg)
        for c in calls:
            name = c["function"]["name"]
            yield {"t": "tool", "name": name}
            try:
                args = json.loads(c["function"].get("arguments") or "{}")
                out = TOOL_FNS[name](**args) if name in TOOL_FNS else {"error": "unknown tool"}
                res = json.dumps(out, default=str)[:TOOL_RESULT_CAP]
            except Exception as e:
                res = json.dumps({"error": f"{type(e).__name__}: {e}"})[:500]
            trace.append(name)
            msgs.append({"role": "tool", "tool_call_id": c["id"], "content": res})
    # Tool budget exhausted: force a final answer from what was already retrieved.
    msgs.append({"role": "user", "content":
                 "(Tool-call limit reached. Answer the question now using only the tool "
                 "results above; note briefly if the answer is partial.)"})
    msg = usd = None
    for ev in _call_live(msgs, use_tools=False):
        if isinstance(ev, tuple):
            msg, usd = ev[1]
        else:
            yield ev
    spent += usd
    answer = ((msg.get("content") or "").strip()
              or "I ran out of tool calls before finishing — try a narrower question.")
    yield {"t": "fin", "answer": answer, "trace": trace, "usd": spent}


# ---- session handoff (OKF bundle) ----------------------------------------------
# Deterministic export of the current session as an OKF (Open Knowledge Format)
# bundle so a *different* LLM — local Ollama, Claude, anything — can take over
# with full context. No LLM call is made; costs nothing against the daily caps.
BASE_URL = os.environ.get("OSQF_CHAT_BASE_URL", "https://osqf.assetflow.ai")


def _fm(d: dict) -> str:
    """YAML frontmatter; JSON string quoting is valid YAML and escape-safe."""
    lines = ["---"]
    for k, v in d.items():
        if isinstance(v, list):
            lines.append(f"{k}: [" + ", ".join(json.dumps(str(x)) for x in v) + "]")
        else:
            lines.append(f"{k}: {json.dumps(str(v))}")
    return "\n".join(lines) + "\n---\n\n"


def _cited_slugs(history) -> list[str]:
    text = "\n".join(m["content"] for m in history if m["role"] == "assistant")
    urls = set(re.findall(r"https?://[^\s)\"'<>]+", text))
    slugs = set(re.findall(r"\b(?:19|20)\d{2}__[a-z0-9_]+", text))
    rows = [r for r in S._rows(S._ro, "SELECT slug, file_url FROM talks", cap=5000)
            if r.get("slug")]
    known = {r["slug"] for r in rows}
    for r in rows:
        if r.get("file_url") and r["file_url"] in urls:
            slugs.add(r["slug"])
    return [s for s in sorted(slugs) if s in known][:12]


def _handoff_zip(history, token: str) -> bytes:
    now = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    talks = []
    for slug in _cited_slugs(history):
        try:
            talks.append(S.get_talk(slug))
        except Exception:
            pass

    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w", zipfile.ZIP_DEFLATED) as z:
        root = "osqf-handoff/"

        turns = "\n".join(
            f"## {'User' if m['role'] == 'user' else 'Assistant'}\n\n{m['content']}\n"
            for m in history)
        z.writestr(root + "session/transcript.md", _fm({
            "type": "Conversation", "title": "osqf-archive chat transcript",
            "description": f"{len(history)}-message session with the osqf-archive assistant",
            "timestamp": now, "tags": ["osqf", "handoff", "session"]})
            + "# Session transcript\n\nCited talks are expanded under the "
              "bundle's talks/ directory.\n\n" + turns)

        for t in talks:
            meta = (t.get("meta") or [{}])[0]
            note = t.get("note_markdown") or "(no extracted note for this talk)"
            # notes carry wiki-internal relative links that don't exist in this
            # bundle — unwrap them to plain text so the bundle lints clean
            note = re.sub(r"\[([^\]]*)\]\((?:\.\./|/)[^)]*\)", r"\1", note)
            z.writestr(root + f"talks/{t['slug']}.md", _fm({
                "type": "Talk", "title": meta.get("title") or t["slug"],
                "description": f"{meta.get('year')} osQF/R-Finance talk by {meta.get('speaker')}",
                "resource": meta.get("file_url") or "",
                "timestamp": now, "tags": ["osqf", "talk"]})
                + f"# {meta.get('title') or t['slug']}\n\n"
                  f"- **Year:** {meta.get('year')}\n"
                  f"- **Speaker:** {meta.get('speaker')}\n"
                  f"- **Slides:** {meta.get('file_url') or 'n/a'}\n"
                  f"- **Tags:** {', '.join(t.get('tags') or []) or 'none'}\n\n"
                  f"## Derived note\n\n{note[:6000]}\n")

        z.writestr(root + "archive/continue-here.md", _fm({
            "type": "Runbook", "title": "How to keep querying the osqf archive",
            "description": "Live endpoints (token included) and offline options for the LLM taking over",
            "timestamp": now, "tags": ["osqf", "handoff", "runbook"]})
            + "# How to keep querying the archive\n\n"
              "The archive: 626 osQF / R-Finance talks 2009-2025, 462 with extracted "
              "notes, semantic + BM25 search, precomputed related-talk and expert "
              "graphs.\n\n"
              "## Live (uses the token from this session — rate-limited, rotates "
              "after the conference)\n\n"
              f"- Browser chat: {BASE_URL}/chat?t={token}\n"
              f"- MCP endpoint (streamable-http, for Claude/agents): "
              f"{BASE_URL}/t/{token}/mcp\n"
              "- MCP tools: search_talks, get_talk, browse, related_talks, "
              "find_experts, run_select (read-only SQL), about.\n\n"
              "## Offline / self-hosted\n\n"
              "- Repo (MIT): https://github.com/travisjakel/osqf-archive — "
              "release assets include the full notes.duckdb index; stdio MCP mode "
              "needs no models (BM25 fallback).\n"
              "- This bundle is OKF (Open Knowledge Format): point any OKF consumer "
              "at it, e.g. `pip install okf-ingest` then "
              "`okf context osqf-handoff/ --query \"...\"` for index-first context "
              "assembly.\n")

        talk_lines = "\n".join(
            f"- [{(t.get('meta') or [{}])[0].get('title') or t['slug']}]"
            f"(talks/{t['slug']}.md)" for t in talks) or "- (no talks cited yet)"
        z.writestr(root + "index.md", _fm({
            "type": "Index", "title": "osqf-archive session handoff",
            "description": "OKF bundle handing an in-progress osqf-archive chat session to another LLM",
            "timestamp": now, "tags": ["osqf", "handoff"]})
            + "# osqf-archive session handoff\n\n"
              f"Generated {now} by {BASE_URL}/chat.\n\n"
              "**To the LLM taking over:** you are continuing an in-progress "
              "research session over an archive of 18 years of quantitative-finance "
              "conference talks. Read [session/transcript.md](session/transcript.md) "
              "for the conversation so far; each talk cited there has a full page "
              "in the talks/ directory with its derived note. To answer new questions "
              "with fresh retrieval instead of memory, use the live endpoints in "
              "[archive/continue-here.md](archive/continue-here.md). Ground every "
              "claim in a talk page or a fresh tool result — never invent talks or "
              "speakers.\n\n"
              "## Contents\n\n"
              f"- [Session transcript](session/transcript.md) — {len(history)} messages\n"
              f"{talk_lines}\n"
              "- [How to keep querying](archive/continue-here.md)\n")
    return buf.getvalue()


# ---- routes --------------------------------------------------------------------
def _sse(d) -> str:
    return f"data: {json.dumps(d)}\n\n"


async def api(request):
    body = await request.json()
    label = _auth_label(body.get("token", ""))
    if label is None:
        return JSONResponse({"error": "invalid or missing access token"}, status_code=403)
    history = body.get("messages", [])
    if not isinstance(history, list) or not history:
        return JSONResponse({"error": "empty messages"}, status_code=400)
    history = [{"role": m.get("role", "user"), "content": str(m.get("content", ""))[:4000]}
               for m in history if m.get("role") in ("user", "assistant")]
    last_user = next((m["content"] for m in reversed(history) if m["role"] == "user"), "")
    key = _cache_key(last_user)

    with _lock:
        hit = _cache_get(key)
    if hit:  # free: no LLM call, no cap or rate-limit charge
        def cached():
            yield _sse({"t": "delta", "d": hit["answer"]})
            yield _sse({"t": "done", "tools": hit["trace"], "cached": True})
        return StreamingResponse(cached(), media_type="text/event-stream")

    with _lock:
        now = time.monotonic()
        dq = _recent.setdefault(label, deque())
        while dq and now - dq[0] > 60:
            dq.popleft()
        if len(dq) >= RATE_PER_MIN:
            return JSONResponse({"error": f"Slow down — this shared token is limited to "
                f"{RATE_PER_MIN} messages per minute."}, status_code=429)
        dq.append(now)
        st = _state()
        if st["usd"] >= DAILY_USD:
            return JSONResponse({"error": "Today's shared demo budget is exhausted. "
                "Use the MCP endpoint or the offline bundle (see the GitHub repo)."},
                status_code=429)
        if st["msgs"].get(label, 0) >= MSG_CAP:
            return JSONResponse({"error": f"Daily message limit reached for this token ({MSG_CAP})."},
                status_code=429)
        st["msgs"][label] = st["msgs"].get(label, 0) + 1
        _save(st)

    single_turn = sum(1 for m in history if m["role"] == "user") == 1

    def gen():
        try:
            for ev in _agent_events(history):
                if ev["t"] == "fin":
                    with _lock:
                        st = _state()
                        st["usd"] = round(st["usd"] + ev["usd"], 6)
                        _save(st)
                        if single_turn and ev["answer"] and not ev["answer"].startswith("I ran out"):
                            _cache_put(key, ev["answer"], ev["trace"])
                    yield _sse({"t": "done", "tools": ev["trace"], "cached": False})
                else:
                    yield _sse(ev)
        except Exception as e:
            yield _sse({"t": "err", "m": f"upstream model error: {type(e).__name__}"})
    return StreamingResponse(gen(), media_type="text/event-stream", headers={
        "Cache-Control": "no-cache", "X-Accel-Buffering": "no"})


async def handoff(request):
    body = await request.json()
    token = str(body.get("token", ""))
    label = _auth_label(token)
    if label is None:
        return JSONResponse({"error": "invalid or missing access token"}, status_code=403)
    history = body.get("messages", [])
    if not isinstance(history, list) or not history:
        return JSONResponse({"error": "nothing to hand off yet"}, status_code=400)
    history = [{"role": m.get("role", "user"), "content": str(m.get("content", ""))[:4000]}
               for m in history if m.get("role") in ("user", "assistant")][:40]

    with _lock:  # same per-minute limiter as /chat/api; no daily-cap charge (no LLM call)
        now = time.monotonic()
        dq = _recent.setdefault(label, deque())
        while dq and now - dq[0] > 60:
            dq.popleft()
        if len(dq) >= RATE_PER_MIN:
            return JSONResponse({"error": "Slow down — try again in a minute."}, status_code=429)
        dq.append(now)

    data = _handoff_zip(history, token.strip())
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%d-%H%M")
    return Response(data, media_type="application/zip", headers={
        "Content-Disposition": f'attachment; filename="osqf-handoff-{stamp}.zip"'})


async def page_img(request):
    # <img> tags can't send headers, so the token rides the query string
    if _auth_label(request.query_params.get("t", "")) is None:
        return JSONResponse({"error": "invalid or missing access token"}, status_code=403)
    slug = request.path_params["slug"]
    page = request.path_params["page"]
    if not re.fullmatch(r"[a-z0-9_]{1,120}", slug) or not page.isdigit():
        return JSONResponse({"error": "not found"}, status_code=404)
    f = PAGES_DIR / slug / f"{int(page)}.jpg"
    if not f.is_file():
        return JSONResponse({"error": "not found"}, status_code=404)
    return FileResponse(f, media_type="image/jpeg",
                        headers={"Cache-Control": "public, max-age=86400"})


async def health(request):
    return JSONResponse({"status": "ok", "model": MODEL})


PAGE = """<!doctype html><html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>osqf-archive — chat with 18 years of R/Finance</title>
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>%F0%9F%93%88</text></svg>">
<style>
:root{--bg:#0f1420;--panel:#1a2233;--text:#e8ecf4;--dim:#8a94a8;--acc:#4f8ef7}
@media (prefers-color-scheme: light){:root{--bg:#f5f7fb;--panel:#fff;--text:#1a2233;--dim:#5a6478;--acc:#2563eb}}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--text);
font:16px/1.55 system-ui,Segoe UI,Roboto,sans-serif;display:flex;flex-direction:column;height:100dvh}
header{padding:.8em 1.2em;border-bottom:1px solid #ffffff22}
header h1{font-size:1.05em;margin:0}header p{margin:.15em 0 0;color:var(--dim);font-size:.85em}
#log{flex:1;overflow-y:auto;padding:1em 1.2em;max-width:900px;width:100%;margin:0 auto}
.msg{margin:.6em 0;padding:.7em 1em;border-radius:10px;white-space:pre-wrap;word-wrap:break-word}
.user{background:var(--acc);color:#fff;margin-left:15%}
.bot{background:var(--panel);margin-right:5%}
.bot a{color:var(--acc)}
#bar{display:flex;gap:.6em;padding: .8em 1.2em 1.1em;max-width:900px;width:100%;margin:0 auto}
#q{flex:1;padding:.7em .9em;border-radius:10px;border:1px solid #ffffff33;background:var(--panel);color:var(--text);font-size:1em}
button{padding:.7em 1.2em;border:0;border-radius:10px;background:var(--acc);color:#fff;font-size:1em;cursor:pointer}
button:disabled{opacity:.5}
.acts{display:flex;gap:.4em;margin:.55em 0 0}
button.act{padding:.25em .75em;font-size:.75em;border-radius:999px;background:transparent;
border:1px solid #ffffff33;color:var(--dim)}
button.act:hover{border-color:var(--acc);color:var(--acc)}
.src{margin:.45em 0 0;padding:.5em .75em;border-radius:8px;background:#00000026;
font-size:.8em;color:var(--dim);word-break:break-all}
.src a{color:var(--acc)}
.pv{margin:.55em 0}
.pv img{max-width:100%;border-radius:8px;border:1px solid #ffffff22;display:block}
.pvc{display:flex;gap:.5em;align-items:center;margin-top:.3em}
.pvn{color:var(--dim);font-size:.8em}
.exlabel{display:inline-block;margin:.25em .4em 0 0;font-size:.8em;color:var(--dim)}
.ex{display:inline-block;margin:.25em .3em 0 0;padding:.35em .7em;border:1px solid var(--acc);
border-radius:999px;font-size:.8em;color:var(--acc);cursor:pointer;user-select:none;
transition:background .12s,color .12s,transform .06s}
.ex:hover,.ex:focus-visible{background:var(--acc);color:#fff;outline:none}
.ex:active{transform:scale(.96)}
body.demo{font-size:20px}
</style></head><body>
<header><h1>osqf-archive</h1>
<p>Chat with 18 years of osQF / R-in-finance talks (2009–2025). Answers cite real talks.
Code + data: <a href="https://github.com/travisjakel/osqf-archive" style="color:var(--acc)">github.com/travisjakel/osqf-archive</a></p>
<div id="ex">
<span class="exlabel">Try one:</span>
<span class="ex" role="button" tabindex="0">Who are the recurring experts on portfolio optimization?</span>
<span class="ex" role="button" tabindex="0">Which talks covered regime switching, and what did they find?</span>
<span class="ex" role="button" tabindex="0">What R packages for backtesting were presented over the years?</span>
</div></header>
<div id="log"></div>
<div id="bar"><input id="q" placeholder="Ask the archive… (/copy n → clipboard context for another LLM)" autocomplete="off">
<button id="go">Send</button></div>
<script>
const P=new URLSearchParams(location.search);
if(P.get('demo'))document.body.classList.add('demo');
let TOK=P.get('t')||localStorage.getItem('osqf_t')||'';
if(P.get('t'))localStorage.setItem('osqf_t',P.get('t'));
const log=document.getElementById('log'),q=document.getElementById('q'),go=document.getElementById('go');
const hist=[];
function esc(s){return s.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;').replace(/'/g,'&#39;')}
function link(s){return s.replace(/(https?:\\/\\/[^\\s)\\]]+)/g,'<a href="$1" target="_blank">$1</a>')}
function pgurl(slug,p){return location.origin+'/chat/page/'+slug+'/'+p+'?t='+encodeURIComponent(TOK)}
function pagify(html){return html.replace(
/<a href="[^"]*\\/chat\\/page\\/([a-z0-9_]+)\\/(\\d+)[^"]*"[^>]*>[^<]*<\\/a>/g,
(m,slug,p)=>'<div class="pv" data-slug="'+slug+'" data-page="'+p+'">'+
'<img src="'+pgurl(slug,p)+'" loading="lazy">'+
'<div class="pvc"><button class="act pvp">‹</button><span class="pvn">page '+p+'</span>'+
'<button class="act pvx">›</button></div></div>')}
function add(cls,txt){const d=document.createElement('div');d.className='msg '+cls;
d.innerHTML=link(esc(txt));log.appendChild(d);log.scrollTop=log.scrollHeight;return d}
function mkbtn(label,fn){const b=document.createElement('button');b.className='act';
b.textContent=label;b.onclick=()=>fn(b);return b}
function copyText(t){
const ta=document.createElement('textarea');ta.value=t;ta.style.position='fixed';ta.style.opacity='0';
document.body.appendChild(ta);ta.select();let ok=false;try{ok=document.execCommand('copy')}catch(e){}
ta.remove();
return ok?Promise.resolve():navigator.clipboard.writeText(t)}
function qaBlob(idx,n){
const upto=hist.slice(0,idx+1),pairs=[];
for(let i=0;i<upto.length;i++){if(upto[i].role==='assistant'){
let qi=i-1;while(qi>=0&&upto[qi].role!=='user')qi--;
pairs.push({q:qi>=0?upto[qi].content:'(no question)',a:upto[i].content})}}
const take=pairs.slice(-n);
return '---\\ntype: "Conversation"\\ntitle: "osqf-archive chat excerpt"\\n'+
'description: "'+take.length+' Q&A with the osqf-archive assistant over 18 years of osQF/R-Finance talks (2009-2025)"\\n'+
'timestamp: "'+new Date().toISOString()+'"\\nsource: "'+location.origin+'/chat"\\n'+
'tags: ["osqf", "conversation", "handoff"]\\n---\\n\\n'+
'**Context for the LLM taking over:** the Q&A below comes from the osqf-archive assistant, '+
'a retrieval agent over 626 osQF/R-Finance conference talks (2009-2025). Citations like '+
'(year, speaker: title) refer to real archive talks; treat them as grounded sources.\\n\\n'+
take.map(p=>'## Q: '+p.q+'\\n\\n'+p.a+'\\n').join('\\n')+
'\\n## Continue querying (optional)\\n'+
'- MCP endpoint (streamable-http): '+location.origin+'/t/'+TOK+'/mcp\\n'+
'- Browser chat: '+location.origin+'/chat?t='+TOK+'\\n'+
'- Tools: search_talks, get_talk, browse, related_talks, find_experts, run_select, about\\n'}
function finish(w,ans,tools,idx){
w.innerHTML=pagify(link(esc(ans)));
const src=document.createElement('div');src.className='src';src.style.display='none';
const urls=[...new Set(ans.match(/https?:\\/\\/[^\\s)\\]]+/g)||[])];
src.innerHTML=(urls.length?'<b>Cited links</b><br>'+urls.map(u=>'<a href="'+esc(u)+'" target="_blank">'+esc(u)+'</a>').join('<br>')+'<br>':'')+
'<b>Tools</b>: '+(tools&&tools.length?esc(tools.join(' → ')):'none');
const acts=document.createElement('div');acts.className='acts';
acts.appendChild(mkbtn('Copy',b=>{copyText(ans).then(
()=>{b.textContent='Copied ✓';setTimeout(()=>b.textContent='Copy',1200)},
()=>{b.textContent='copy failed'})}));
acts.appendChild(mkbtn('Copy +',b=>{
const raw=prompt('How many recent Q&A pairs to copy? (blank = all)');
if(raw===null)return;
let n=parseInt(raw,10);if(!(n>0))n=1e9;
const blob=qaBlob(idx,n);
setTimeout(()=>{copyText(blob).then(   // let focus return after the prompt closes
()=>{b.textContent='Copied ✓';setTimeout(()=>b.textContent='Copy +',1200)},
()=>{b.textContent='copy failed'})},150)}));
acts.appendChild(mkbtn('Sources',()=>{src.style.display=src.style.display==='none'?'block':'none';
log.scrollTop=log.scrollHeight}));
acts.appendChild(mkbtn('Handoff',handoff));
w.appendChild(acts);w.appendChild(src)}
async function handoff(b){if(!hist.length||!TOK)return;b.disabled=true;
try{const r=await fetch('/chat/api/handoff',{method:'POST',headers:{'Content-Type':'application/json'},
body:JSON.stringify({token:TOK,messages:hist})});
if(!r.ok){const j=await r.json().catch(()=>({}));alert(j.error||'handoff failed')}
else{const bl=await r.blob();const a=document.createElement('a');a.href=URL.createObjectURL(bl);
const fn=(r.headers.get('Content-Disposition')||'').match(/filename="([^"]+)"/)?.[1]||'osqf-handoff.zip';
a.download=fn;a.click();URL.revokeObjectURL(a.href);
add('bot','Handoff saved to your downloads as '+fn+'.\\n\\nTo continue with a different LLM:\\n'+
'1. Unzip it — you get an osqf-handoff/ folder (an OKF knowledge bundle).\\n'+
'2. Give the new LLM the folder (or paste index.md into the chat) and say: '+
'"Read index.md, then session/transcript.md, and take over this session."\\n'+
'3. Cited talks are under talks/ with full notes; live endpoints + your access token are in archive/continue-here.md.\\n'+
'4. Tool-using agents can also run: pip install okf-ingest, then okf context osqf-handoff/ --query "…"')}}
catch(e){alert('network error')}
b.disabled=false}
async function send(text){
const cm=text.trim().match(/^\\/copy\\+?(?:\\s+(\\d+))?$/i);
if(cm){q.value='';
const avail=hist.filter(x=>x.role==='assistant').length;
if(!avail){add('bot','Nothing to copy yet — ask a question first, then /copy or /copy n.');return}
const n=cm[1]?parseInt(cm[1],10):1e9;
copyText(qaBlob(hist.length-1,n)).then(
()=>add('bot','Copied ✓ — '+Math.min(n,avail)+' Q&A pair(s) on your clipboard as an OKF context blob. Paste into any LLM session to hand this conversation over.'),
()=>add('bot','Copy failed — try the Copy + button on a response instead.'));
return}
if(!TOK){TOK=prompt('Access token (from the talk slide / QR):')||'';localStorage.setItem('osqf_t',TOK)}
if(!text.trim()||!TOK)return;
add('user',text);hist.push({role:'user',content:text});q.value='';go.disabled=true;
const w=add('bot','…thinking');
try{const r=await fetch('/chat/api',{method:'POST',headers:{'Content-Type':'application/json'},
body:JSON.stringify({token:TOK,messages:hist})});
const ct=r.headers.get('content-type')||'';
if(ct.includes('json')){const j=await r.json();
w.innerHTML=esc(j.error||'error');if(r.status===403){TOK='';localStorage.removeItem('osqf_t')}}
else{const rd=r.body.getReader(),dec=new TextDecoder();
let buf='',acc='',tools=[],err=null;
while(true){const{done,value}=await rd.read();if(done)break;
buf+=dec.decode(value,{stream:true});let i;
while((i=buf.indexOf('\\n\\n'))>=0){const ln=buf.slice(0,i).trim();buf=buf.slice(i+2);
if(!ln.startsWith('data:'))continue;let e;try{e=JSON.parse(ln.slice(5))}catch(x){continue}
if(e.t==='delta'){acc+=e.d;w.innerHTML=link(esc(acc));log.scrollTop=log.scrollHeight}
else if(e.t==='tool'&&!acc){w.innerHTML='<span style="color:var(--dim)">… '+esc(e.name)+'</span>'}
else if(e.t==='reset'){acc='';w.innerHTML='…thinking'}
else if(e.t==='err'){err=e.m}
else if(e.t==='done'){tools=e.tools||[]}}}
if(acc){hist.push({role:'assistant',content:acc});finish(w,acc,tools,hist.length-1)}
else{w.innerHTML=esc(err||'no answer — try again')}}}
catch(e){w.textContent='network error — try again'}
go.disabled=false;log.scrollTop=log.scrollHeight}
go.onclick=()=>send(q.value);
log.addEventListener('click',ev=>{const b=ev.target,pv=b.closest&&b.closest('.pv');
if(!pv||b.tagName!=='BUTTON')return;
let p=parseInt(pv.dataset.page,10);
if(b.classList.contains('pvp'))p=Math.max(1,p-1);
else if(b.classList.contains('pvx'))p=p+1;else return;
const img=pv.querySelector('img'),lab=pv.querySelector('.pvn'),old=pv.dataset.page;
img.onerror=()=>{img.onerror=null;pv.dataset.page=old;
img.src=pgurl(pv.dataset.slug,old);lab.textContent='page '+old};
pv.dataset.page=p;img.src=pgurl(pv.dataset.slug,p);lab.textContent='page '+p});
q.addEventListener('keydown',e=>{if(e.key==='Enter')send(q.value)});
document.querySelectorAll('.ex').forEach(x=>{x.onclick=()=>send(x.textContent);
x.addEventListener('keydown',e=>{if(e.key==='Enter'||e.key===' ')send(x.textContent)})});
</script></body></html>"""


async def page(request):
    return HTMLResponse(PAGE)


app = Starlette(routes=[
    Route("/chat", page),
    Route("/chat/", page),
    Route("/chat/api", api, methods=["POST"]),
    Route("/chat/api/handoff", handoff, methods=["POST"]),
    Route("/chat/page/{slug}/{page}", page_img),
    Route("/chat/health", health),
])


def run():
    import uvicorn
    if not API_KEY:
        raise SystemExit("FATAL: OPENROUTER_API_KEY not set")
    if not TOKENS:
        raise SystemExit("FATAL: no access tokens configured (OSQF_AUTH_TOKEN[S_FILE])")
    port = int(os.environ.get("OSQF_CHAT_PORT", "8790"))
    uvicorn.run(app, host=os.environ.get("OSQF_CHAT_HOST", "127.0.0.1"),
                port=port, log_level="info")


if __name__ == "__main__":
    run()
