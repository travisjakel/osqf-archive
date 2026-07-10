#!/usr/bin/env bash
# start_ocr_server.sh — serve a local VLM-OCR model on :8905 via vLLM (~/ocr_venv).
#   OCR_MODEL=unlimited bash start_ocr_server.sh   # baidu/Unlimited-OCR (default)
#   OCR_MODEL=paddle    bash start_ocr_server.sh   # PaddlePaddle/PaddleOCR-VL
# Mode D in the GPU table: mutually exclusive with vLLM-text (:8000), pixel
# (:8903/:8904) AND Windows Ollama — stop those first (see stack.sh).
# Stop:  pkill -f 'vllm serve.*8905'
set -uo pipefail
export PATH="$HOME/.local/bin:/usr/bin:/bin:$PATH"

OCR_MODEL="${OCR_MODEL:-unlimited}"
# Unlimited-OCR needs vLLM >= 0.25 (nightly as of 2026-07) + its NGram logits
# processor (official recipe: recipes.vllm.ai/baidu/Unlimited-OCR — prevents
# coordinate-token loops). Prefix caching off: no benefit for OCR.
case "$OCR_MODEL" in
  unlimited) MODEL_DIR="$HOME/models/unlimited-ocr"; NAME="unlimited-ocr"
    EXTRA="--logits_processors vllm.model_executor.models.unlimited_ocr:NGramPerReqLogitsProcessor --no-enable-prefix-caching --mm-processor-cache-gb 0";;
  paddle)    MODEL_DIR="$HOME/models/paddleocr-vl";  NAME="paddleocr-vl"
    EXTRA="--no-enable-prefix-caching --mm-processor-cache-gb 0";;
  *) echo "OCR_MODEL must be unlimited|paddle"; exit 1;;
esac
[ -d "$MODEL_DIR" ] || { echo "model dir missing: $MODEL_DIR"; exit 1; }

if pgrep -f 'vllm serve.*8905' >/dev/null 2>&1; then
  echo "an OCR server is already on :8905 — pkill -f 'vllm serve.*8905' first"; exit 1
fi
if pgrep -f 'vllm serve.*8000\|pixel_embed_server.py\|vlm_reader_server.py' >/dev/null 2>&1; then
  echo "WARNING: another GPU stack is running (stack.sh down / pixel-down first)"; exit 1
fi

LOG="$HOME/ocr_server_${NAME}.log"
# no CUDA toolkit in WSL -> flashinfer sampler JIT can't compile; use torch sampler
setsid bash -c "VLLM_USE_FLASHINFER_SAMPLER=0 $HOME/ocr_venv/bin/vllm serve $MODEL_DIR \
  --served-model-name ocr --host 0.0.0.0 --port 8905 \
  --max-model-len 8192 --gpu-memory-utilization 0.55 \
  --trust-remote-code $EXTRA" > "$LOG" 2>&1 < /dev/null &
echo "[:8905 $NAME] starting (log $LOG)"

for i in $(seq 1 60); do
  curl -s --max-time 3 "http://127.0.0.1:8905/v1/models" >/dev/null 2>&1 && { echo "  :8905 ready ($NAME)"; exit 0; }
  sleep 5
done
echo "  :8905 NOT ready after 300s — check $LOG"; exit 1
