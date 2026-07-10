---
type: Talk
title: GPU Programming with R
description: "The gputools package enables GPU computing in R, offering significant performance gains for certain operations."
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Seligman
speaker_slug: seligman
talk_type: Tutorial
time_slot: "10:00 - 11:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/MarkSeligman_Tutorial.pdf"
file_local: "./_cache/files/2010/2010__seligman.pdf"
slug: 2010__seligman
status: archived
tags: [osqf, 2010, seligman]
---

# GPU Programming with R

_2010 · Seligman (Rapid Biologics)_

**Headline:** The gputools package enables GPU computing in R, offering significant performance gains for certain operations.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/MarkSeligman_Tutorial.pdf>
- Local: `./_cache/files/2010/2010__seligman.pdf`
- Talk type: Tutorial
- Time slot: 10:00 - 11:00

## Topics
- GPU computing in R
- CUDA programming
- R package development
- Performance optimization
- Numerical linear algebra on GPUs
- Parallel computing

## Methods
- CUDA
- Stream API
- QR decomposition
- matrix multiplication
- linear modeling

## Datasets used
*(none extracted)*

## Code & tools
- `gputools`
- `CUDA`
- `CULA`
- R
- CUDA Toolkit
- NVidia drivers

## Key findings
- Granger causality (gpuGranger) achieves >60x speedup  
  > Granger causality (gpuGranger): > 60x.
- CUDA-enabled hardware required for 64-bit operations  
  > SVM training and prediction, as well as Kendall correlation, are 64–bit, hence require hardware capability ≥ 1.3.
- Package remains a work in progress with evolving capabilities  
  > I Remains very much a work in progress.
- Linux and 32-bit Mac supported, with Windows/64-bit Mac pending  
  > Primarily Linux, although 32–bit Mac is supported. 64–bit Mac and Windows are to–do.

## Applications
- statistical computing acceleration
- large-scale data analysis
- parallel statistical modeling

## References cited
- Bioinformatics, 2010 26(1):134–135

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/seligman.md`](../speakers/seligman.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4)*

