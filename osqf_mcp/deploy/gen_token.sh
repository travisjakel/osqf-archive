#!/usr/bin/env bash
# Generate (or add) a bearer token for the osqf-archive endpoint.
# Prints the RAW token ONCE; only its sha256 is stored in tokens.json.
#   sudo bash gen_token.sh <label>     # e.g. conference, workshop, demo
set -euo pipefail
LABEL="${1:-conference}"
TOKENS="${OSQF_AUTH_TOKENS_FILE:-/opt/osqf-mcp/tokens.json}"

python3 - "$LABEL" "$TOKENS" <<'EOF'
import hashlib, json, secrets, sys
from pathlib import Path

label, path = sys.argv[1], Path(sys.argv[2])
words = ["ledger","kernel","quantile","copula","lattice","spline","vector",
         "monad","garch","sortino","kalman","wavelet","tensor","bootstrap",
         "drawdown","duration","factor","hessian","jacobian","stochastic"]
raw = f"osqf2026-{secrets.choice(words)}-{secrets.choice(words)}-{secrets.token_hex(2)}"
table = json.loads(path.read_text()) if path.exists() else {}
table[label] = hashlib.sha256(raw.encode()).hexdigest()
path.write_text(json.dumps(table, indent=2) + "\n")
path.chmod(0o600)
print(f"label : {label}")
print(f"token : {raw}")
print("(shown once — hashed at rest; restart the service to load it)")
EOF
