"""OCR the rendered OSQF corpus (~/pixel_tiles_osqf) through the local VLM-OCR
server on :8905 (start_ocr_server.sh) and write per-slug transcripts where the
R side (osqf_wiki/scripts/02b_ocr_apply.R) picks them up.

- Per-page sha1 cache (~/ocr_page_cache/<sha1>.txt) keyed on (png bytes, model,
  prompt) — fully resumable; page order re-joined from filenames.
- Transcripts: /mnt/c/.../osqf_wiki/_cache/ocr_text/<slug>.txt with pages
  joined by "--- PAGE BREAK ---" and NO header line (02b adds provenance).
- JSONL log: _cache/ocr_text/_ocr_run_log.jsonl (slug, model, pages, chars, secs).

  SLUGS="a;b"  limit to specific slugs (bake-off)   OCR_MODEL=unlimited|paddle
  python 23_ocr_osqf_corpus.py
"""
import os, glob, json, base64, hashlib, re, time, urllib.request

TILES = os.path.expanduser(os.environ.get("TILES", "~/pixel_tiles_osqf"))
OUT_DIR = os.environ.get(
    "OUT_DIR", "$OSQF_ARCHIVE_ROOT/_cache/ocr_text")
CACHE = os.path.expanduser("~/ocr_page_cache")
URL = "http://127.0.0.1:8905/v1/chat/completions"
MODEL = os.environ.get("OCR_MODEL", "unlimited")
ONLY = set(s for s in os.environ.get("SLUGS", "").split(";") if s)

# Per-model transcription prompt. These models only answer their TRAINED task
# prompts — free-form instructions return empty (probed 2026-07-08 with
# test_ocr_prompt.py: unlimited answers "Free OCR." only; markdown-mode and
# custom prompts -> 0 chars; "Parse the document." hallucinates).
PROMPTS = {
    "unlimited": "Free OCR.",
    "paddle": "OCR:",
}
PROMPT = os.environ.get("OCR_PROMPT", PROMPTS[MODEL])


def clean_ocr(txt):
    """Strip Unlimited-OCR grounding wrappers: keep <|ref|>text<|/ref|>, drop
    <|det|>[[coords]]<|/det|> blocks and any stray special tokens."""
    txt = re.sub(r"<\|ref\|>(.*?)<\|/ref\|>", r"\1", txt, flags=re.S)
    txt = re.sub(r"<\|det\|>.*?<\|/det\|>", "", txt, flags=re.S)
    txt = re.sub(r"<\|(?:/)?(?:ref|det|grounding)\|>", "", txt)
    return txt


def ocr_page(png_path):
    raw = open(png_path, "rb").read()
    key = hashlib.sha1(raw + MODEL.encode() + PROMPT.encode()).hexdigest()
    cpath = f"{CACHE}/{key}.txt"
    if os.path.exists(cpath):
        return open(cpath, encoding="utf-8").read(), True
    b64 = base64.b64encode(raw).decode()
    body = {"model": "ocr", "temperature": 0.0, "max_tokens": 4096,
            "messages": [{"role": "user", "content": [
                {"type": "image_url",
                 "image_url": {"url": f"data:image/png;base64,{b64}"}},
                {"type": "text", "text": PROMPT}]}]}
    if MODEL == "unlimited":
        # official recipe: NGram anti-loop needs these per-request args, and
        # special tokens must survive so clean_ocr() can unwrap grounding.
        body["vllm_xargs"] = {"ngram_size": 35, "window_size": 128}
        body["skip_special_tokens"] = False
    req = urllib.request.Request(URL, data=json.dumps(body).encode(),
                                 headers={"Content-Type": "application/json"},
                                 method="POST")
    with urllib.request.urlopen(req, timeout=300) as r:
        txt = json.loads(r.read())["choices"][0]["message"]["content"]
    txt = clean_ocr(txt)
    open(cpath, "w", encoding="utf-8").write(txt)
    return txt, False


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    os.makedirs(CACHE, exist_ok=True)
    log_path = f"{OUT_DIR}/_ocr_run_log.jsonl"
    dirs = sorted(glob.glob(f"{TILES}/*/"))
    slugs = [os.path.basename(d.rstrip("/")) for d in dirs]
    if ONLY:
        slugs = [s for s in slugs if s in ONLY]
    print(f"{len(slugs)} slugs | model={MODEL} | prompt={PROMPT[:60]!r}", flush=True)
    with open(log_path, "a", encoding="utf-8") as log:
        for n, slug in enumerate(slugs):
            out_txt = f"{OUT_DIR}/{slug}.txt"
            pngs = sorted(glob.glob(f"{TILES}/{slug}/*.png"))
            if not pngs:
                continue
            t0, hits, pages = time.time(), 0, []
            try:
                for p in pngs:
                    txt, cached = ocr_page(p)
                    pages.append(txt.strip())
                    hits += cached
            except Exception as e:
                print(f"  !! {slug}: {e}", flush=True)
                log.write(json.dumps({"slug": slug, "model": MODEL,
                                      "error": str(e)[:200]}) + "\n")
                continue
            full = "\n--- PAGE BREAK ---\n".join(pages)
            open(out_txt, "w", encoding="utf-8").write(full)
            rec = {"slug": slug, "model": MODEL, "pages": len(pngs),
                   "cached": hits, "chars": len(full),
                   "secs": round(time.time() - t0, 1)}
            log.write(json.dumps(rec) + "\n")
            log.flush()
            if n % 10 == 0:
                print(f"  [{n}/{len(slugs)}] {slug}: {len(pngs)}pp "
                      f"{len(full)}ch {rec['secs']}s", flush=True)
    print("DONE", flush=True)


if __name__ == "__main__":
    main()
