"""Downsample the 300dpi pixel corpus to web JPEGs for the chat page viewer.
in : ~/pixel_tiles_osqf/<slug>/page_NNN.png   (0-indexed)
out: ~/pixel_pages_web/<slug>/<n>.jpg         (1-based) + manifest.json {slug: n_pages}
"""
import json, os, sys
from multiprocessing import Pool
from pathlib import Path
from PIL import Image

SRC = Path.home() / "pixel_tiles_osqf"
DST = Path.home() / "pixel_pages_web"
W = 1200
Q = 70


def one(args):
    slug, png = args
    n = int(png.stem.split("_")[1]) + 1
    out = DST / slug / f"{n}.jpg"
    if out.exists():
        return 0
    try:
        im = Image.open(png)
        if im.mode != "RGB":
            im = im.convert("RGB")
        if im.width > W:
            im = im.resize((W, int(im.height * W / im.width)), Image.LANCZOS)
        out.parent.mkdir(parents=True, exist_ok=True)
        im.save(out, "JPEG", quality=Q, optimize=True)
        return 1
    except Exception as e:
        print(f"FAIL {slug}/{png.name}: {e}", flush=True)
        return 0


def main():
    jobs, manifest = [], {}
    for d in sorted(SRC.iterdir()):
        if not d.is_dir():
            continue
        pngs = sorted(d.glob("page_*.png"))
        if not pngs:
            continue
        manifest[d.name] = len(pngs)
        jobs.extend((d.name, p) for p in pngs)
    print(f"{len(manifest)} talks, {len(jobs)} pages", flush=True)
    with Pool(8) as pool:
        done = sum(pool.imap_unordered(one, jobs, chunksize=32))
    DST.mkdir(exist_ok=True)
    (DST / "manifest.json").write_text(json.dumps(manifest))
    print(f"converted {done}, manifest {len(manifest)} slugs", flush=True)


if __name__ == "__main__":
    main()
