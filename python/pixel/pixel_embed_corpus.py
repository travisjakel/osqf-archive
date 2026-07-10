"""Embed the rendered OSQF/R_Finance conference corpus (300-dpi page images)
into Qdrant `pixel_osqf`, batched + incremental. Sibling of
21_pixel_embed_corpus.py (pixel_research stays untouched).

- Scans ~/pixel_tiles_osqf/<slug>/*.png; slug == osqf_wiki note slug, so
  doc_ids join back to notes/<slug>.md. Payload carries year (slug prefix).
- Stable per-page id = uuid5(NS, doc_id) -> idempotent, incremental.
- REBUILD=1 env -> delete the collection first.

Run from pixelrag venv, pixel mode (GPU free of vLLM/:8905):
  python scripts/22_pixel_embed_osqf.py
"""
import os, glob, uuid
import numpy as np, torch
from PIL import Image
from qdrant_client import QdrantClient, models
from pixelrag_embed.embed import _init_direct_gpu, _embed_direct_gpu

QURL = os.environ.get("TG_QURL", "http://127.0.0.1:6333")
COLL = "pixel_osqf"
TILES = os.path.expanduser("~/pixel_tiles_osqf")
MODEL = os.environ.get("PIXEL_MODEL", "Qwen/Qwen3-VL-Embedding-2B")
BATCH = int(os.environ.get("PIXEL_BATCH", "8"))
REBUILD = os.environ.get("REBUILD") == "1"
NS = uuid.UUID("9f2f7e71-0000-5000-8000-00000000000a")  # distinct from pixel_research


def slug_year(slug):
    head = slug.split("__", 1)[0]
    return int(head) if head.isdigit() else None


def main():
    items = []
    for d in sorted(glob.glob(f"{TILES}/*/")):
        slug = os.path.basename(d.rstrip("/"))
        for p in sorted(glob.glob(f"{d}*.png")):
            page = int(os.path.splitext(os.path.basename(p))[0].split("_")[-1])
            items.append({"slug": slug, "page": page, "path": p,
                          "doc_id": f"pxosqf:{slug}:p{page}"})
    docs = len({it["slug"] for it in items})
    print(f"{len(items)} page-images across {docs} docs", flush=True)

    c = QdrantClient(url=QURL, timeout=120)
    if REBUILD and c.collection_exists(COLL):
        c.delete_collection(COLL); print("deleted existing collection (REBUILD)")

    existing = set()
    if c.collection_exists(COLL):
        off = None
        while True:
            pts, off = c.scroll(COLL, limit=2000, offset=off, with_payload=True, with_vectors=False)
            existing.update(p.payload.get("doc_id") for p in pts)
            if off is None or not pts:
                break
    todo = [it for it in items if it["doc_id"] not in existing]
    print(f"{len(todo)} new to embed ({len(existing)} already present)", flush=True)
    if not todo:
        print("nothing to do"); return

    print("loading Qwen3-VL embedder...", flush=True)
    engine = _init_direct_gpu(MODEL, gpu_id=0)
    created = c.collection_exists(COLL)
    done = 0
    for i in range(0, len(todo), BATCH):
        chunk = todo[i:i + BATCH]
        imgs = [Image.open(it["path"]).convert("RGB") for it in chunk]
        vecs = [v.astype(np.float32) for v in _embed_direct_gpu(engine, "", imgs)]
        for im in imgs:
            im.close()
        if not created:
            dim = int(vecs[0].shape[0])
            c.create_collection(COLL, vectors_config=models.VectorParams(
                size=dim, distance=models.Distance.COSINE))
            created = True
        c.upsert(COLL, points=[models.PointStruct(
            id=str(uuid.uuid5(NS, it["doc_id"])), vector=vecs[j].tolist(),
            payload={"doc_id": it["doc_id"], "slug": it["slug"], "page": it["page"],
                     "year": slug_year(it["slug"]), "src": "pixel_osqf",
                     "image_path": it["path"]})
            for j, it in enumerate(chunk)])
        done += len(chunk)
        if i // BATCH % 25 == 0:
            print(f"  {done}/{len(todo)} | VRAM {torch.cuda.max_memory_allocated()/1e9:.1f}GB", flush=True)
    print(f"DONE. pixel_osqf count = {c.count(COLL).count}", flush=True)


if __name__ == "__main__":
    main()
