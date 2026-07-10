"""Entry points:  python -m osqf_mcp            (stdio, for local MCP clients)
                  python -m osqf_mcp --http     (HTTP w/ auth, for hosting)"""
import sys


def main() -> None:
    if "--http" in sys.argv[1:]:
        from .serve_http import run
        run()
    else:
        from .server import mcp
        mcp.run()


if __name__ == "__main__":
    main()
