"""Local VLM reader — reads retrieved page screenshots and answers, fully on-prem
(airgap mode for pixel_search; no cloud). Qwen2.5-VL-3B-Instruct on GPU (~8GB).
Binds 127.0.0.1:8904.  POST /read {images:[paths], question} -> {answer}.

  ~/pixelrag_venv/bin/python vlm_reader_server.py
VRAM: ~8GB; co-resides with pixel_embed_server (10GB) under 24GB, but NOT with vLLM.
"""
import os
import torch
from flask import Flask, request, jsonify
from PIL import Image
from transformers import AutoProcessor, Qwen2_5_VLForConditionalGeneration

MODEL = os.environ.get("VLM_READER_MODEL", "Qwen/Qwen2.5-VL-3B-Instruct")
print(f"loading {MODEL} ...", flush=True)
PROC = AutoProcessor.from_pretrained(MODEL, trust_remote_code=True)
MODELV = Qwen2_5_VLForConditionalGeneration.from_pretrained(
    MODEL, torch_dtype=torch.bfloat16, trust_remote_code=True).cuda().eval()
print("vlm reader ready", flush=True)
app = Flask(__name__)

# Minimal local multimodal chat UI (text + optional image). Raw string so HTML/JS
# quotes embed without escaping.
_VLM_CHAT_PAGE = """<!DOCTYPE html><html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>Local VLM chat</title>
<style>:root{--bg:#0f1419;--panel:#1a2230;--line:#2a3547;--accent:#3da5ff;--txt:#e6edf3;--dim:#8b98a9}
*{box-sizing:border-box}html,body{margin:0;height:100%}
body{background:var(--bg);color:var(--txt);font:15px/1.55 -apple-system,Segoe UI,Roboto,sans-serif;display:flex;flex-direction:column}
header{padding:12px 18px;border-bottom:1px solid var(--line);background:var(--panel);font-weight:650}
header small{color:var(--dim);font-weight:400}
#log{flex:1;overflow-y:auto;padding:18px;max-width:900px;width:100%;margin:0 auto}
.m{margin:0 0 14px}.u{color:#cdd9e5}
.bub{background:var(--panel);border:1px solid var(--line);border-radius:10px;padding:11px 14px;white-space:pre-wrap}
.bub img{max-width:240px;border-radius:6px;display:block;margin-bottom:6px}
footer{border-top:1px solid var(--line);padding:12px;background:var(--panel)}
.row{max-width:900px;margin:0 auto;display:flex;gap:9px;align-items:center}
#q{flex:1;background:#0d1117;color:var(--txt);border:1px solid var(--line);border-radius:9px;padding:11px;font:inherit;resize:none}
#go{background:var(--accent);color:#04243d;border:0;border-radius:9px;padding:0 18px;font-weight:700;cursor:pointer}
label.img{color:var(--dim);cursor:pointer;font-size:.85rem}#thumb{max-height:34px;border-radius:5px}</style></head>
<body><header>Local VLM chat <small>&middot; Qwen2.5-VL-3B &middot; airgap (no cloud)</small></header><div id="log"></div>
<footer><div class="row">
<label class="img" title="attach an image">&#128247;<input id="img" type="file" accept="image/*" style="display:none"></label>
<img id="thumb" style="display:none">
<textarea id="q" rows="1" placeholder="Chat with the local vision model (attach an image to ask about it)..."></textarea>
<button id="go">Send</button></div></footer>
<script>
const log=document.getElementById("log"),q=document.getElementById("q"),go=document.getElementById("go"),
 imgIn=document.getElementById("img"),thumb=document.getElementById("thumb");
let history=[],pendingImg=null;
function esc(s){return (s||"").replace(/&/g,"&amp;").replace(/</g,"&lt;")}
function add(cls,html){const d=document.createElement("div");d.className="m "+cls;d.innerHTML=html;log.appendChild(d);log.scrollTop=log.scrollHeight;return d}
imgIn.onchange=function(){const f=imgIn.files[0];if(!f)return;const r=new FileReader();r.onload=function(){pendingImg=r.result;thumb.src=r.result;thumb.style.display="inline"};r.readAsDataURL(f)};
async function send(){const t=q.value.trim();if(!t&&!pendingImg)return;q.value="";go.disabled=true;
 let uh=(pendingImg?"<img src='"+pendingImg+"'>":"")+esc(t);add("u","<div class='bub'>"+uh+"</div>");
 const w=add("a","<div class='bub'>...</div>");
 try{const r=await fetch("/chat",{method:"POST",headers:{"Content-Type":"application/json"},
   body:JSON.stringify({prompt:t,history:history,image:pendingImg})});
  const d=await r.json();const reply=d.reply||d.error||"(no reply)";
  w.querySelector(".bub").textContent=reply;
  history.push({role:"user",content:t});history.push({role:"assistant",content:reply});
 }catch(e){w.querySelector(".bub").textContent="error: "+e}
 pendingImg=null;thumb.style.display="none";imgIn.value="";go.disabled=false}
go.onclick=send;q.addEventListener("keydown",function(e){if(e.key==="Enter"&&!e.shiftKey){e.preventDefault();send()}});
</script></body></html>"""


def _generate(content, imgs, max_new=500):
    text = PROC.apply_chat_template([{"role": "user", "content": content}],
                                    tokenize=False, add_generation_prompt=True)
    inputs = PROC(text=[text], images=imgs, return_tensors="pt", padding=True).to("cuda")
    with torch.no_grad():
        out = MODELV.generate(**inputs, max_new_tokens=max_new, do_sample=False)
    gen = out[:, inputs["input_ids"].shape[1]:]
    return PROC.batch_decode(gen, skip_special_tokens=True)[0].strip()


_ZOOM_RE = None  # compiled lazily


def _parse_zoom(ans):
    """Parse 'ZOOM [x1,y1,x2,y2]' (absolute pixel coords)."""
    global _ZOOM_RE
    import re
    if _ZOOM_RE is None:
        _ZOOM_RE = re.compile(r"ZOOM\s*\[?\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\]?")
    m = _ZOOM_RE.search(ans)
    return tuple(int(g) for g in m.groups()) if m else None


@app.post("/read")
def read():
    b = request.get_json(force=True)
    paths = b.get("images", [])[:3]
    q = b.get("question", "")
    # SOTA-C: one crop-on-demand round (SlideAgent/VRAG-RL-style zoom, minimal
    # version). The 300-dpi tile is on disk at full res; the processor downsizes
    # large pages, so a native-res crop recovers exactly the small-text detail
    # the whole-page pass loses. Opt-in: PIXEL_READER_ZOOM=1 or {"zoom": true}.
    zoom_req = b.get("zoom", os.environ.get("PIXEL_READER_ZOOM") == "1")
    zoom_on = bool(zoom_req)
    zoom_force = zoom_req == "force"   # controller-driven: ALWAYS localize+crop
    imgs = [Image.open(p).convert("RGB") for p in paths]
    zoom_used = None

    base_rules = (f"Read the document page screenshot(s) and answer precisely using ONLY "
                  f"what is visible (tables/charts included). If the answer is not present, "
                  f"reply 'NOT FOUND'.")
    if zoom_force and len(imgs) >= 1:
        # Self-triggered zoom measured ineffective (models don't self-report
        # resolution limits — 0/8 triggers, 2026-07-10). Forced mode exploits
        # Qwen2.5-VL's grounding training instead: always localize, then read
        # the native-res crop.
        w, h = imgs[0].size
        loc = (f"Locate the single region of this page (a table, chart, or text "
               f"block) that contains the information needed to answer: \"{q}\". "
               f"The page is {w}x{h} pixels. Reply ONLY with 'ZOOM [x1,y1,x2,y2]'.")
        content = [{"type": "image", "image": imgs[0]},
                   {"type": "text", "text": loc}]
        box = _parse_zoom(_generate(content, [imgs[0]], max_new=60))
        if box:
            x1, y1, x2, y2 = box
            # generous pad: tight grounding boxes truncate table headers/row
            # labels and DEGRADE answers (measured: "Hematology, 0%" failure)
            pad_x, pad_y = int(0.15 * w), int(0.15 * h)
            x1, x2 = max(0, min(x1, x2) - pad_x), min(w, max(x1, x2) + pad_x)
            y1, y2 = max(0, min(y1, y2) - pad_y), min(h, max(y1, y2) + pad_y)
            if (x2 - x1) > 20 and (y2 - y1) > 20:
                crop = imgs[0].crop((x1, y1, x2, y2))
                zoom_used = [x1, y1, x2, y2]
                ans = _generate([{"type": "image", "image": crop},
                                 {"type": "text", "text":
                                  f"{base_rules} This is a magnified region of the page.\n\n"
                                  f"Question: {q}"}], [crop], max_new=500)
                crop.close()
                for im in imgs:
                    im.close()
                return jsonify({"answer": ans, "model": MODEL, "zoom": zoom_used})
        # localization failed -> fall through to whole-page read below
        zoom_on = False
    if zoom_on and len(imgs) >= 1:
        w, h = imgs[0].size
        ask = (f"{base_rules}\nIf you need to read small text or numbers you cannot "
               f"resolve at this resolution, reply EXACTLY 'ZOOM [x1,y1,x2,y2]' with the "
               f"pixel bounding box of the region to magnify (page 1 is {w}x{h} px). "
               f"Otherwise answer directly.\n\nQuestion: {q}")
        content = [{"type": "image", "image": im} for im in imgs]
        content.append({"type": "text", "text": ask})
        ans = _generate(content, imgs, max_new=300)
        box = _parse_zoom(ans)
        if box:
            x1, y1, x2, y2 = box
            # clamp + 5% pad, guard degenerate boxes
            pad_x, pad_y = int(0.05 * w), int(0.05 * h)
            x1, x2 = max(0, min(x1, x2) - pad_x), min(w, max(x1, x2) + pad_x)
            y1, y2 = max(0, min(y1, y2) - pad_y), min(h, max(y1, y2) + pad_y)
            if (x2 - x1) > 20 and (y2 - y1) > 20:
                crop = imgs[0].crop((x1, y1, x2, y2))
                zoom_used = [x1, y1, x2, y2]
                content2 = [{"type": "image", "image": crop},
                            {"type": "text", "text":
                             f"{base_rules} This is a magnified region of the page.\n\n"
                             f"Question: {q}"}]
                ans = _generate(content2, [crop], max_new=500)
                crop.close()
        for im in imgs:
            im.close()
        return jsonify({"answer": ans, "model": MODEL, "zoom": zoom_used})

    content = [{"type": "image", "image": im} for im in imgs]
    content.append({"type": "text", "text": f"{base_rules}\n\nQuestion: {q}"})
    ans = _generate(content, imgs, max_new=500)
    for im in imgs:
        im.close()
    return jsonify({"answer": ans, "model": MODEL, "zoom": None})


@app.get("/")
def index():
    from flask import Response
    return Response(_VLM_CHAT_PAGE, mimetype="text/html")


@app.post("/chat")
def chat():
    import base64, io
    b = request.get_json(force=True)
    prompt = b.get("prompt", "")
    history = b.get("history", []) or []      # [{role, content(text)}] prior turns
    img_b64 = b.get("image")                  # optional data-url / raw b64 (this turn)
    msgs = []
    for h in history:
        msgs.append({"role": h.get("role", "user"),
                     "content": [{"type": "text", "text": str(h.get("content", ""))}]})
    user_content, imgs = [], []
    if img_b64:
        try:
            raw = img_b64.split(",", 1)[-1]
            im = Image.open(io.BytesIO(base64.b64decode(raw))).convert("RGB")
            user_content.append({"type": "image", "image": im}); imgs = [im]
        except Exception:
            pass
    user_content.append({"type": "text", "text": prompt})
    msgs.append({"role": "user", "content": user_content})
    text = PROC.apply_chat_template(msgs, tokenize=False, add_generation_prompt=True)
    inputs = PROC(text=[text], images=(imgs or None), return_tensors="pt", padding=True).to("cuda")
    with torch.no_grad():
        out = MODELV.generate(**inputs, max_new_tokens=700, do_sample=False)
    gen = out[:, inputs["input_ids"].shape[1]:]
    reply = PROC.batch_decode(gen, skip_special_tokens=True)[0].strip()
    for im in imgs:
        im.close()
    return jsonify({"reply": reply, "model": MODEL})


@app.get("/health")
def health():
    return jsonify({"ok": True, "model": MODEL})


if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8904, threaded=False)
