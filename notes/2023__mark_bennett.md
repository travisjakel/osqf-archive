---
type: Talk
title: "No Mystery: Synthetic Limit Order Books and Accelerated Training for Market Direction Prediction"
description: The talk presents methods using synthetic limit order books and accelerated training techniques to improve market direction prediction accuracy.
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Mark Bennett
speaker_slug: mark_bennett
talk_type: Talk
time_slot: "14:25 - 14:45"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/MarkBennett.pdf"
file_local: "./_cache/files/2023/2023__mark_bennett.pdf"
slug: 2023__mark_bennett
status: archived
tags: [osqf, 2023, mark_bennett]
---

# No Mystery: Synthetic Limit Order Books and Accelerated Training for Market Direction Prediction

_2023 · Mark Bennett (NVIDIA)_

**Headline:** The talk presents methods using synthetic limit order books and accelerated training techniques to improve market direction prediction accuracy.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/MarkBennett.pdf>
- Local: `./_cache/files/2023/2023__mark_bennett.pdf`
- Talk type: Talk
- Time slot: 14:25 - 14:45

## Topics
- limit order books (LOB)
- market direction prediction
- synthetic data generation
- accelerated machine learning training

## Methods
- synthetic limit order book generation
- deep convolutional neural networks (DeepLOB)
- GPU-accelerated training with RAPIDS and cuML
- hardware acceleration using NVIDIA GPUs

## Datasets used
- GOOG Limit Order Book
- AAPL 1-Second Fundamental from Intrinio

## Code & tools
- `RAPIDS`
- `cuML`
- DeepLOB (GitHub repository)
- NVIDIA GPU architecture
- `Python`
- C++

## Key findings
- The more detailed the limit order book, the higher the prediction accuracy for market direction.  
  > The More Detailed the Book the Higher the Prediction Accuracy (Percent Out of 100)
- GPU acceleration reduces training runtime by ~90% compared to CPU-based scikit-learn.  
  > Training runtime in seconds | scikit-learn | cuML 0 | 390 | 35
- Nonstationary market conditions make traditional signal separation strategies ineffective.  
  > Nonstationary Breaks These Strategies

## Applications
- market direction prediction
- intraday trading

## References cited
- LOBSTER: Limit Order Book Reconstruction System (Ruihong Huang, Tomas Polak)
- ABIDES: High-Fidelity Multi-Agent Market Simulation (David Byrd et al.)
- DeepLOB: Deep convolutional neural networks for limit order books (Zihao Zhang et al.)
- Financial Analytics with R (Mark J. Bennett, Dirk L. Hugen)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/mark_bennett.md`](../speakers/mark_bennett.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

