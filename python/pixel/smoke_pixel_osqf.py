"""Smoke test: text->image retrieval on the new pixel_osqf collection."""
import torch
from qdrant_client import QdrantClient
from pixelrag_embed.embed import _init_direct_gpu, DEFAULT_INSTRUCTION

QC = QdrantClient(url="http://127.0.0.1:6333", timeout=60)
print("pixel_research count:", QC.count("pixel_research").count)
print("pixel_osqf count    :", QC.count("pixel_osqf").count)

ENGINE = _init_direct_gpu("Qwen/Qwen3-VL-Embedding-2B", gpu_id=0)


def embed_query(q):
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
    return torch.nn.functional.normalize(last, p=2, dim=-1)[0].cpu().float().numpy().tolist()


for q in ["scatter plot of oil prices versus Houston housing prices",
          "table of GARCH model parameter estimates",
          "R code for order book reconstruction"]:
    hits = QC.query_points("pixel_osqf", query=embed_query(q), limit=3, with_payload=True).points
    print(f"\nQ: {q}")
    for h in hits:
        print(f"  {h.payload['doc_id']}  score={h.score:.3f}")
