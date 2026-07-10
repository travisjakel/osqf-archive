"""HTTP transport for osqf-mcp: bearer-token auth + global rate limit.

Designed for conference hosting: bind loopback, publish via a tunnel
(e.g. `tailscale funnel --bg 8788`), hand attendees ONE shared token on a
slide/QR. Tokens are sha256-hashed at rest; rotate by editing the tokens file.

Env knobs:
  OSQF_BIND_HOST          default 127.0.0.1 (tunnel-friendly)
  OSQF_BIND_PORT          default 8788
  OSQF_AUTH_TOKEN         single static bearer token, OR
  OSQF_AUTH_TOKENS_FILE   JSON {"label": "<sha256-hex>", ...}
  OSQF_RATE_LIMIT         global requests/minute (default 60)
  OSQF_ALLOWED_HOSTS      extra Host headers (comma-sep), e.g. the public
                          tunnel hostname — required for DNS-rebinding protection
  OSQF_TRANSPORT          "streamable-http" (default) or "sse"

Refuses to start with no auth configured.
"""
from __future__ import annotations

import hashlib
import json
import logging
import os
import sys
import time
from collections import deque
from pathlib import Path

log = logging.getLogger("osqf_mcp.http")


def _load_token_table() -> dict[str, str]:
    """{sha256-hex: label}. Empty dict = no auth configured."""
    table: dict[str, str] = {}
    single = os.getenv("OSQF_AUTH_TOKEN")
    if single:
        table[hashlib.sha256(single.encode()).hexdigest()] = "default"
    multi_path = os.getenv("OSQF_AUTH_TOKENS_FILE")
    if multi_path:
        p = Path(multi_path).expanduser()
        if p.exists():
            for label, hashed in json.loads(p.read_text(encoding="utf-8")).items():
                if not isinstance(hashed, str) or len(hashed) != 64:
                    log.warning("token entry %s: expected sha256 hex; skipped", label)
                    continue
                table[hashed.lower()] = label
        else:
            log.warning("OSQF_AUTH_TOKENS_FILE %s not found", p)
    return table


def run() -> None:
    import uvicorn
    from starlette.middleware import Middleware
    from starlette.middleware.base import BaseHTTPMiddleware
    from starlette.responses import JSONResponse
    from starlette.routing import Route

    logging.basicConfig(level=logging.INFO,
                        format="%(asctime)s %(levelname)s %(name)s %(message)s")
    tokens = _load_token_table()
    if not tokens:
        sys.stderr.write("FATAL: no auth tokens. Set OSQF_AUTH_TOKEN or "
                         "OSQF_AUTH_TOKENS_FILE. Refusing to start unprotected.\n")
        sys.exit(2)

    class BearerAuth(BaseHTTPMiddleware):
        async def dispatch(self, request, call_next):
            if request.url.path in {"/health", "/readiness"}:
                return await call_next(request)
            auth = request.headers.get("authorization", "")
            if not auth.lower().startswith("bearer "):
                return JSONResponse({"error": "missing_bearer_token"}, status_code=401)
            h = hashlib.sha256(auth.split(None, 1)[1].strip().encode()).hexdigest()
            label = tokens.get(h)
            if label is None:
                log.warning("auth_failed peer=%s",
                            request.client.host if request.client else "?")
                return JSONResponse({"error": "invalid_token"}, status_code=403)
            request.state.client_label = label
            return await call_next(request)

    rate = int(os.getenv("OSQF_RATE_LIMIT", "60"))
    hits: deque[float] = deque()

    class RateLimit(BaseHTTPMiddleware):
        async def dispatch(self, request, call_next):
            if request.url.path in {"/health", "/readiness"}:
                return await call_next(request)
            now = time.monotonic()
            while hits and now - hits[0] > 60:
                hits.popleft()
            if len(hits) >= rate:
                return JSONResponse({"error": "rate_limited",
                                     "detail": f"global limit {rate}/min"},
                                    status_code=429)
            hits.append(now)
            return await call_next(request)

    from .server import mcp
    from mcp.server.transport_security import TransportSecuritySettings

    host = os.getenv("OSQF_BIND_HOST", "127.0.0.1")
    port = int(os.getenv("OSQF_BIND_PORT", "8788"))
    extra = [h.strip() for h in os.getenv("OSQF_ALLOWED_HOSTS", "").split(",") if h.strip()]
    allowed = [host, f"{host}:{port}", "127.0.0.1", f"127.0.0.1:{port}",
               "localhost", f"localhost:{port}", *extra]
    mcp.settings.transport_security = TransportSecuritySettings(
        enable_dns_rebinding_protection=True,
        allowed_hosts=allowed, allowed_origins=["*"])

    transport = os.getenv("OSQF_TRANSPORT", "streamable-http")
    if transport == "streamable-http":
        inner = mcp.streamable_http_app()
    elif transport == "sse":
        inner = mcp.sse_app()
    else:
        sys.stderr.write(f"FATAL: unknown OSQF_TRANSPORT={transport}\n")
        sys.exit(2)

    async def health(_request):
        return JSONResponse({"status": "ok"})

    inner.user_middleware = [Middleware(RateLimit),
                             Middleware(BearerAuth)] + list(inner.user_middleware)
    inner.middleware_stack = None
    inner.router.routes = [Route("/health", health),
                           Route("/readiness", health)] + list(inner.router.routes)

    log.info("osqf-mcp http transport=%s host=%s port=%s clients=%d rate=%d/min",
             transport, host, port, len(tokens), rate)
    uvicorn.run(inner, host=host, port=port, log_level="info", access_log=True)


if __name__ == "__main__":
    run()
