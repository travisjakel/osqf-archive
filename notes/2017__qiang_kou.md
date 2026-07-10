---
type: Talk
title: Text analysis using Apache MxNet
description: "The talk discusses using Apache MXNet for text analysis, covering model training with R and GPU support, and applications in deep learning."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Qiang Kou
speaker_slug: qiang_kou
talk_type: Talk
time_slot: "16:00 - 16:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/QiangKou.pdf"
file_local: "./_cache/files/2017/2017__qiang_kou.pdf"
slug: 2017__qiang_kou
status: archived
tags: [osqf, 2017, qiang_kou, text_analysis]
---

# Text analysis using Apache MxNet

_2017 · Qiang Kou (Indiana University)_

**Headline:** The talk discusses using Apache MXNet for text analysis, covering model training with R and GPU support, and applications in deep learning.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/QiangKou.pdf>
- Local: `./_cache/files/2017/2017__qiang_kou.pdf`
- Talk type: Talk
- Time slot: 16:00 - 16:20

## Topics
- text analysis
- deep learning frameworks
- GPU acceleration
- NLP models
- R integration
- sequence learning

## Methods
- character-level CNN
- RNN
- LSTM
- MXNet model training
- GPU-accelerated training

## Datasets used
- Amazon review data (alphabet size 69, VDCNN model, 100,000 training samples, 20,000 validation samples)

## Code & tools
- Apache MXNet
- R
- `Python`
- GitHub repository (thirdwing/r_fin_2017)

## Key findings
- GPU training achieves 638.36 samples/sec vs. CPU's 43.23 samples/sec for text classification.  
  > 43.23 samples/sec using CPU, 638.36 samples/sec using GPU
- LSTM model training demonstrates 97% validation accuracy after 10 epochs.  
  > Epoch | Training | Validation
10 | 0.97 | 0.97
- MXNet supports R integration for deep learning model development.  
  > model <- mx.model.FeedForward.create(softmax, X=train.x, y=train.y, ctx=mx.gpu()

## Applications
- text classification
- sequence learning

## References cited
- Convolutional Kernel Networks, arXiv:1406.3332 [cs.CV]
- Character-level Convolutional Networks for Text Classification, arXiv:1509.01626 [cs.LG]
- A Critical Review of Recurrent Neural Networks for Sequence Learning, arXiv:1506.00019 [cs.LG]

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/qiang_kou.md`](../speakers/qiang_kou.md)
- [`topics/text_analysis.md`](../topics/text_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

