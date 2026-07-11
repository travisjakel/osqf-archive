"""Thin public chat wrapper over the osqf-archive tools.

One Starlette app (default 127.0.0.1:8790, put Caddy in front): a single-page
chat UI + /chat/api agent loop. The LLM is a cloud API (OpenAI-compatible,
default OpenRouter); the seven archive tools are called IN-PROCESS from
osqf_mcp.server, so the demo exercises exactly what MCP clients see.

Guards (this is a public page over a paid API):
  * same bearer-token table as the MCP server (?t=<token> or form field)
  * per-token daily message cap          (OSQF_CHAT_MSG_CAP, default 30)
  * hard daily spend cap in USD          (OSQF_CHAT_DAILY_USD, default 5.0)
  * tool-result truncation + bounded agent loop (6 tool rounds max)

Env: OPENROUTER_API_KEY (required)   OSQF_CHAT_MODEL (default anthropic/claude-haiku-4.5)
     OSQF_CHAT_PORT=8790  OSQF_CHAT_PRICE_IN=1.0  OSQF_CHAT_PRICE_OUT=5.0  ($/Mtok)
     OSQF_CHAT_STATE (default /var/lib/osqf-mcp)
"""
from __future__ import annotations

import datetime
import hashlib
import json
import os
import threading
import urllib.request
from pathlib import Path

from starlette.applications import Starlette
from starlette.responses import HTMLResponse, JSONResponse
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
STATE = Path(os.environ.get("OSQF_CHAT_STATE", "/var/lib/osqf-mcp")) / "chat_budget.json"
MAX_TOOL_ROUNDS = 6
TOOL_RESULT_CAP = 8000

TOKENS = _load_token_table()
_lock = threading.Lock()

SYSTEM = (
    "You are the osqf-archive assistant: a search agent over 18 years of osQF / "
    "R-in-finance conference talks (2009-2025; 626 talks, 462 with extracted notes). "
    "Always ground answers in tool results — never invent talks or speakers. "
    "Cite talks inline as (year, speaker: title) and include the file_url link when you "
    "have it. Prefer search_talks + get_talk; use find_experts for who-questions and "
    "related_talks for exploration. Be concise: a short direct answer, then the "
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
]
TOOL_FNS = {"search_talks": S.search_talks, "get_talk": S.get_talk, "browse": S.browse,
            "related_talks": S.related_talks, "find_experts": S.find_experts,
            "run_select": S.run_select, "about": S.about}


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


# ---- agent loop ----------------------------------------------------------------
def _llm(messages, use_tools=True):
    body = {"model": MODEL, "messages": messages,
            "max_tokens": 1200, "temperature": 0.2}
    if use_tools:
        body["tools"] = TOOLS
    req = urllib.request.Request(API_URL, data=json.dumps(body).encode(), headers={
        "Authorization": f"Bearer {API_KEY}", "Content-Type": "application/json"})
    with urllib.request.urlopen(req, timeout=120) as r:
        j = json.loads(r.read())
    u = j.get("usage", {})
    usd = (u.get("prompt_tokens", 0) * PRICE_IN + u.get("completion_tokens", 0) * PRICE_OUT) / 1e6
    return j["choices"][0]["message"], usd


def _run_agent(history):
    msgs = [{"role": "system", "content": SYSTEM}] + history[-12:]
    spent, trace = 0.0, []
    for _ in range(MAX_TOOL_ROUNDS):
        msg, usd = _llm(msgs)
        spent += usd
        calls = msg.get("tool_calls") or []
        if not calls:
            return (msg.get("content") or "").strip(), trace, spent
        msgs.append(msg)
        for c in calls:
            name = c["function"]["name"]
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
    msg, usd = _llm(msgs, use_tools=False)
    spent += usd
    text = (msg.get("content") or "").strip()
    return (text or "I ran out of tool calls before finishing — try a narrower question."), trace, spent


# ---- routes --------------------------------------------------------------------
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

    with _lock:
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

    try:
        answer, trace, spent = _run_agent(history)
    except Exception as e:
        return JSONResponse({"error": f"upstream model error: {type(e).__name__}"}, status_code=502)

    with _lock:
        st = _state()
        st["usd"] = round(st["usd"] + spent, 6)
        _save(st)
    return JSONResponse({"answer": answer, "tools_used": trace})


async def health(request):
    return JSONResponse({"status": "ok", "model": MODEL})


PAGE = """<!doctype html><html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>osqf-archive — chat with 18 years of R/Finance</title>
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
.bot a{color:var(--acc)} .tools{color:var(--dim);font-size:.75em;margin:.2em 0 0 .4em}
#bar{display:flex;gap:.6em;padding: .8em 1.2em 1.1em;max-width:900px;width:100%;margin:0 auto}
#q{flex:1;padding:.7em .9em;border-radius:10px;border:1px solid #ffffff33;background:var(--panel);color:var(--text);font-size:1em}
button{padding:.7em 1.2em;border:0;border-radius:10px;background:var(--acc);color:#fff;font-size:1em;cursor:pointer}
button:disabled{opacity:.5}
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
<div id="bar"><input id="q" placeholder="Ask the archive…" autocomplete="off">
<button id="go">Send</button></div>
<script>
const P=new URLSearchParams(location.search);
if(P.get('demo'))document.body.classList.add('demo');
let TOK=P.get('t')||localStorage.getItem('osqf_t')||'';
if(P.get('t'))localStorage.setItem('osqf_t',P.get('t'));
const log=document.getElementById('log'),q=document.getElementById('q'),go=document.getElementById('go');
const hist=[];
function esc(s){return s.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;')}
function link(s){return s.replace(/(https?:\\/\\/[^\\s)]+)/g,'<a href="$1" target="_blank">$1</a>')}
function add(cls,txt,tools){const d=document.createElement('div');d.className='msg '+cls;
d.innerHTML=link(esc(txt));if(tools&&tools.length){const t=document.createElement('div');
t.className='tools';t.textContent='tools: '+tools.join(' → ');d.appendChild(t)}
log.appendChild(d);log.scrollTop=log.scrollHeight;return d}
async function send(text){
if(!TOK){TOK=prompt('Access token (from the talk slide / QR):')||'';localStorage.setItem('osqf_t',TOK)}
if(!text.trim()||!TOK)return;
add('user',text);hist.push({role:'user',content:text});q.value='';go.disabled=true;
const w=add('bot','…thinking');
try{const r=await fetch('/chat/api',{method:'POST',headers:{'Content-Type':'application/json'},
body:JSON.stringify({token:TOK,messages:hist})});const j=await r.json();
if(j.error){w.innerHTML=esc(j.error);if(r.status===403){TOK='';localStorage.removeItem('osqf_t')}}
else{w.innerHTML=link(esc(j.answer));if(j.tools_used&&j.tools_used.length){const t=document.createElement('div');
t.className='tools';t.textContent='tools: '+j.tools_used.join(' → ');w.appendChild(t)}
hist.push({role:'assistant',content:j.answer})}}
catch(e){w.textContent='network error — try again'}
go.disabled=false;log.scrollTop=log.scrollHeight}
go.onclick=()=>send(q.value);
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
