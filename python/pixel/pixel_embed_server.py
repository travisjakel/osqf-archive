"""Pixel query-embed server — holds Qwen3-VL-Embedding-2B resident and embeds
text (or image) queries for pixel_search. Mirrors embed_server.py. Binds
127.0.0.1:8903. Run in the pixelrag venv (GPU; ~10GB VRAM — cannot co-reside
with vLLM on a 24GB card).

  ~/pixelrag_venv/bin/python pixel_embed_server.py
"""
import os
import torch
from flask import Flask, request, jsonify
from pixelrag_embed.embed import _init_direct_gpu, DEFAULT_INSTRUCTION

MODEL = os.environ.get("PIXEL_MODEL", "Qwen/Qwen3-VL-Embedding-2B")
print(f"loading {MODEL} for query embedding...", flush=True)
ENGINE = _init_direct_gpu(MODEL, gpu_id=0)
print("pixel embed server ready", flush=True)
app = Flask(__name__)


def _embed_text(q):
    model, proc = ENGINE
    msgs = [{"role": "system", "content": [{"type": "text", "text": DEFAULT_INSTRUCTION}]},
            {"role": "user", "content": [{"type": "text", "text": q}]}]
    text = proc.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True)
    inp = proc(text=[text], return_tensors="pt", padding=True)
    inp = {k: v.to("cuda") if hasattr(v, "to") else v for k, v in inp.items()}
    with torch.no_grad():
        out = model.model(**inp)
    am = inp["attention_mask"]
    last = out.last_hidden_state[torch.arange(1, device=am.device), am.sum(1) - 1]
    last = torch.nn.functional.normalize(last, p=2, dim=-1)
    return last[0].cpu().float().numpy().tolist()


@app.post("/embed_query")
def embed_query():
    q = request.get_json(force=True).get("text", "")
    return jsonify({"vector": _embed_text(q)})


@app.get("/health")
def health():
    return jsonify({"ok": True, "model": MODEL})


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8903, threaded=True)
