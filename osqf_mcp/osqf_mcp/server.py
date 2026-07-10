#!/usr/bin/env python
"""osqf-archive — MCP server (stdio core).

Serves 18 years of osQF / R-in-finance conference talks from ONE self-contained
DuckDB release asset (notes.duckdb, built by R/pipeline/07_mcp_precompute.R):
chunks + embeddings, derived notes, manifest, tags, precomputed PPR
related-talks/experts tables, and a persisted FTS index.

Sandbox model (mirrors the house data-product pattern):
  * an internal READ-ONLY connection to the db file is used solely for
    parameterized semantic/BM25 retrieval;
  * the free-form `run_select` tool runs against a separate IN-MEMORY catalog
    that holds copies of every table WITHOUT the embedding columns, and has
    `SET enable_external_access=false` — it cannot touch the filesystem or
    see raw vectors.

Retrieval modes:
  * semantic — query embedded server-side via a local Ollama nomic-embed-text
    (env OLLAMA_URL, default http://localhost:11434); cosine over chunks.
  * bm25 — zero-model fallback via the persisted DuckDB FTS index; used
    automatically when no embedder is reachable, so the offline bundle works
    with nothing but `pip install duckdb mcp`.

Env:  OSQF_DB   path to notes.duckdb (default: ./notes.duckdb, ./data/, ../data/)
      OLLAMA_URL, OSQF_EMBED_MODEL   optional semantic-mode embedder
"""
from __future__ import annotations

import json
import os
import re
import urllib.request
from pathlib import Path

import duckdb
from mcp.server.fastmcp import FastMCP

ROW_CAP = 500
OLLAMA_URL = os.environ.get("OLLAMA_URL", "http://localhost:11434").rstrip("/")
EMBED_MODEL = os.environ.get("OSQF_EMBED_MODEL", "nomic-embed-text:latest")


def _find_db() -> str:
    env = os.environ.get("OSQF_DB")
    if env:
        return env
    here = Path(__file__).resolve().parent
    for cand in [Path("notes.duckdb"), Path("data/notes.duckdb"),
                 here / "data" / "notes.duckdb", here.parent / "data" / "notes.duckdb",
                 here.parent.parent / "data" / "notes.duckdb"]:
        if Path(cand).exists():
            return str(cand)
    raise FileNotFoundError(
        "notes.duckdb not found. Download the Release asset and set OSQF_DB=/path/to/notes.duckdb")


DB = _find_db()

# internal read-only connection: parameterized retrieval only, never exposed
_ro = duckdb.connect(DB, read_only=True)
try:
    _ro.execute("INSTALL fts; LOAD fts;")
    _HAS_FTS = True
except Exception:
    _HAS_FTS = False

# sandboxed in-memory catalog for run_select: all tables, embeddings stripped
_sand = duckdb.connect(":memory:")
_sand.execute(f"ATTACH '{DB}' AS src (READ_ONLY)")
for (tbl,) in _sand.execute(
        "SELECT table_name FROM information_schema.tables "
        "WHERE table_catalog='src' AND table_schema='main'").fetchall():
    cols = [c for (c,) in _sand.execute(
        "SELECT column_name FROM information_schema.columns "
        "WHERE table_catalog='src' AND table_schema='main' AND table_name=?",
        [tbl]).fetchall() if c != "embedding"]
    collist = ", ".join(f'"{c}"' for c in cols)
    _sand.execute(f'CREATE TABLE "{tbl}" AS SELECT {collist} FROM src."{tbl}"')
_sand.execute("DETACH src")
_sand.execute("SET enable_external_access=false")

mcp = FastMCP("osqf-archive")


def _rows(con, sql, params=None, cap=ROW_CAP):
    cur = con.execute(sql, params or [])
    cols = [d[0] for d in cur.description]
    out = [dict(zip(cols, r)) for r in cur.fetchmany(cap + 1)]
    if len(out) > cap:
        out = out[:cap]
        out.append({"note": f"result truncated at {cap} rows"})
    return out


def _slugify(v: str) -> str:
    return re.sub(r"^_+|_+$", "", re.sub(r"[^a-z0-9]+", "_", v.lower()))


def _embed(text: str) -> list[float] | None:
    try:
        req = urllib.request.Request(
            f"{OLLAMA_URL}/api/embeddings",
            data=json.dumps({"model": EMBED_MODEL, "prompt": text}).encode(),
            headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(req, timeout=30) as r:
            emb = json.loads(r.read()).get("embedding")
        return emb if emb else None
    except Exception:
        return None


def _talk_filters(year, speaker, topic):
    """Shared WHERE fragments over the chunks table. Parameterized."""
    where, params = [], []
    if year:
        yrs = [int(y) for y in (year if isinstance(year, list) else [year])]
        where.append(f"year IN ({','.join('?' * len(yrs))})")
        params.extend(yrs)
    if speaker:
        where.append("(speaker_slug = ? OR lower(speaker) LIKE ?)")
        params.extend([_slugify(speaker), f"%{speaker.lower()}%"])
    if topic:
        where.append("slug IN (SELECT slug FROM talk_tags WHERE tag_value = ?)")
        params.append(_slugify(topic))
    return (" AND " + " AND ".join(where)) if where else "", params


@mcp.tool()
def about() -> dict:
    """What this archive is, what it contains, and how to use the tools."""
    info = {r["key"]: r["value"] for r in _rows(_ro, "SELECT key, value FROM about_info")}
    info["tools"] = {
        "search_talks": "semantic (or BM25-fallback) search over talk content",
        "get_talk": "full derived note + metadata + related talks for one slug",
        "browse": "list talks by year / speaker / file format",
        "related_talks": "precomputed PageRank neighbours of a talk",
        "find_experts": "precomputed speaker ranking for a topic/method/tag",
        "run_select": "free-form read-only SQL over the archive tables",
    }
    info["retrieval_mode"] = "semantic" if _embed("ping") else (
        "bm25 (no local embedder found; set OLLAMA_URL + pull nomic-embed-text for semantic)")
    return info


@mcp.tool()
def search_talks(query: str, k: int = 10, year=None, speaker: str = "",
                 topic: str = "") -> dict:
    """Search 18 years of talk content. Semantic when a local embedder is
    available, BM25 otherwise. Optional filters: year (int or list),
    speaker (name or slug), topic (tag, e.g. 'portfolio_optimization').
    Returns chunk-level hits; follow up with get_talk(slug) for the full note."""
    k = max(1, min(int(k), 50))
    fsql, fparams = _talk_filters(year, speaker, topic)
    base_cols = ("chunk_id, slug, section, year, speaker, file_format, "
                 "substr(text, 1, 400) AS snippet")
    emb = _embed(query)
    if emb is not None:
        lit = "[" + ",".join(f"{x:.7g}" for x in emb) + "]::FLOAT[768]"
        rows = _rows(_ro, f"""
            SELECT {base_cols}, round(array_cosine_similarity(embedding, {lit}), 3) AS score
            FROM chunks WHERE embedding IS NOT NULL {fsql}
            ORDER BY score DESC LIMIT {k}""", fparams)
        mode = "semantic-nomic"
    elif _HAS_FTS:
        rows = _rows(_ro, f"""
            SELECT * FROM (
              SELECT {base_cols},
                     round(fts_main_chunks.match_bm25(chunk_id, ?), 3) AS score
              FROM chunks WHERE 1=1 {fsql}
            ) WHERE score IS NOT NULL ORDER BY score DESC LIMIT {k}""",
            [query] + fparams)
        mode = "bm25-fts"
    else:
        raise RuntimeError("no retrieval backend: embedder unreachable and FTS unavailable")
    return {"retrieval": mode, "hits": rows}


@mcp.tool()
def get_talk(slug: str) -> dict:
    """Everything about one talk: manifest metadata, tags, the full derived
    note (markdown, with source URL — PDFs are not redistributed), companion
    papers, and precomputed related talks."""
    return {
        "slug": slug,
        "meta": _rows(_ro, "SELECT * FROM talks WHERE slug = ?", [slug]),
        "tags": [r["tag_value"] for r in
                 _rows(_ro, "SELECT tag_value FROM talk_tags WHERE slug = ?", [slug])],
        "note_markdown": (_rows(_ro, "SELECT markdown FROM notes WHERE slug = ?", [slug])
                          or [{"markdown": None}])[0]["markdown"],
        "papers": _rows(_ro, "SELECT paper_id, kind FROM paper_links WHERE slug = ?", [slug]),
        "related": _rows(_ro, "SELECT rank, related_slug, lift FROM related_talks "
                              "WHERE slug = ? ORDER BY rank LIMIT 5", [slug]),
    }


@mcp.tool()
def browse(year=None, speaker: str = "", file_format: str = "", limit: int = 50) -> list:
    """List talks from the manifest (all 800+ archive entries, including ones
    without extracted notes). Filters: year (int or list), speaker, file_format
    (pdf/html/pptx...)."""
    where, params = [], []
    if year:
        yrs = [int(y) for y in (year if isinstance(year, list) else [year])]
        where.append(f"year IN ({','.join('?' * len(yrs))})")
        params.extend(yrs)
    if speaker:
        where.append("(speaker_slug = ? OR lower(speaker) LIKE ?)")
        params.extend([_slugify(speaker), f"%{speaker.lower()}%"])
    if file_format:
        where.append("file_ext = ?")
        params.append(file_format.lower().lstrip("."))
    w = ("WHERE " + " AND ".join(where)) if where else ""
    lim = max(1, min(int(limit), ROW_CAP))
    return _rows(_ro, f"SELECT slug, year, speaker, title, talk_type, file_ext, file_url "
                      f"FROM talks {w} ORDER BY year DESC, slug LIMIT {lim}", params)


@mcp.tool()
def related_talks(slug: str, k: int = 10) -> list:
    """Precomputed associative neighbours of a talk: Personalized PageRank over
    the talk-entity graph (shared rare topics/tags bridge strongest), ranked by
    lift over a popularity baseline."""
    k = max(1, min(int(k), 25))
    return _rows(_ro, "SELECT rank, related_slug, lift FROM related_talks "
                      "WHERE slug = ? ORDER BY rank LIMIT ?", [slug, k])


@mcp.tool()
def find_experts(topic: str, k: int = 10) -> dict:
    """Who has presented most centrally on a topic/method/tag across 18 years?
    Precomputed PPR speaker ranking. Try e.g. 'portfolio optimization',
    'market microstructure', 'machine learning'."""
    s = _slugify(topic)
    k = max(1, min(int(k), 25))
    cands = [f"topics/{s}", f"tag/{s}", s]
    for ent in cands:
        rows = _rows(_ro, "SELECT rank, speaker, speaker_slug, score, n_talks "
                          "FROM experts WHERE entity = ? ORDER BY rank LIMIT ?", [ent, k])
        if rows:
            return {"entity": ent, "experts": rows}
    words = [w for w in s.split("_") if len(w) > 3] or [s]
    cond = " OR ".join("entity LIKE ?" for _ in words)
    fuzzy = _rows(_ro, f"SELECT DISTINCT entity FROM experts WHERE {cond} LIMIT 12",
                  [f"%{w}%" for w in words])
    return {"entity": None, "experts": [],
            "suggestions": [r["entity"] for r in fuzzy] or
                           ["no matching entity; see run_select on the experts table"]}


@mcp.tool()
def run_select(sql: str) -> list:
    """Free-form read-only SELECT/WITH over the archive tables (chunks,
    paper_chunks, talks, notes, talk_tags, paper_links, related_talks, experts,
    about_info). Embedding vectors are excluded; writes and filesystem access
    are blocked; results cap at 500 rows."""
    s = sql.strip().rstrip(";")
    head = s.lstrip("(").lower()
    if not (head.startswith("select") or head.startswith("with")):
        raise ValueError("only SELECT / WITH queries are allowed")
    if ";" in s:
        raise ValueError("multiple statements are not allowed")
    return _rows(_sand, s)


if __name__ == "__main__":
    mcp.run()
