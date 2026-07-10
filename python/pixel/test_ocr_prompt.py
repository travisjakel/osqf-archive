"""One-page prompt-format probe for the :8905 OCR server. Tries several prompt
forms and prints the first 300 chars of each response (raw, before cleaning).
Usage: python test_ocr_prompt.py [png_path]"""
import sys, json, glob, base64, os, urllib.request

png = sys.argv[1] if len(sys.argv) > 1 else sorted(
    glob.glob(os.path.expanduser("~/pixel_tiles_osqf/2011__ang/*.png")))[0]
b64 = base64.b64encode(open(png, "rb").read()).decode()
print("page:", png)

PROMPTS = [
    "Free OCR.",
    "<image>\nFree OCR.",
    "<image>\n<|grounding|>Convert the document to markdown.",
    "Transcribe this slide/page completely. Tables as markdown pipe tables, "
    "formulas as LaTeX, preserve reading order. Output only the transcription.",
]

for p in PROMPTS:
    body = {"model": "ocr", "temperature": 0.0, "max_tokens": 1200,
            "skip_special_tokens": False,
            "vllm_xargs": {"ngram_size": 35, "window_size": 128},
            "messages": [{"role": "user", "content": [
                {"type": "image_url",
                 "image_url": {"url": f"data:image/png;base64,{b64}"}},
                {"type": "text", "text": p}]}]}
    req = urllib.request.Request("http://127.0.0.1:8905/v1/chat/completions",
                                 data=json.dumps(body).encode(),
                                 headers={"Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=180) as r:
            txt = json.loads(r.read())["choices"][0]["message"]["content"]
        print(f"\n=== PROMPT {p[:50]!r} -> {len(txt)} chars ===\n{txt[:300]}")
    except Exception as e:
        print(f"\n=== PROMPT {p[:50]!r} -> ERROR {str(e)[:200]}")
