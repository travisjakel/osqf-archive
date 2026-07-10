---
type: Talk
title: "Stan (Almost!) Has GPU Capabilities Now! Example Performance of Gaussian Processes"
description: "Stan is introducing GPU support for Gaussian Processes, achieving up to 8x speedups while maintaining precision."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Stephen Bronder
speaker_slug: stephen_bronder
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/SteveBronder.pdf"
file_local: "./_cache/files/2018/2018__stephen_bronder.pdf"
slug: 2018__stephen_bronder
status: archived
tags: [osqf, 2018, stephen_bronder]
---

# Stan (Almost!) Has GPU Capabilities Now! Example Performance of Gaussian Processes

_2018 · Stephen Bronder (Columbia University)_

**Headline:** Stan is introducing GPU support for Gaussian Processes, achieving up to 8x speedups while maintaining precision.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/SteveBronder.pdf>
- Local: `./_cache/files/2018/2018__stephen_bronder.pdf`
- Talk type: Lightning

## Topics
- GPU acceleration in probabilistic programming
- Gaussian Processes
- Performance optimization in Stan

## Methods
- GPU acceleration with MPI and threading
- Cholesky decomposition
- Blocking algorithm for matrix inversion

## Datasets used
*(none extracted)*

## Code & tools
- `Stan`
- `OpenCL`
- `cholesky_decompose_gpu`
- R

## Key findings
- Stan achieves 8x speedups for Gaussian Processes with N=5000  
  > We see speedups of 8x for GPs with N = 5000
- Parameter estimates retain precision (10-14 decimal places)  
  > Parameter estimates retain precision (10 - 14)
- GPU support will be production-ready by July 2018  
  > In production by July

## Applications
- Gaussian Process regression in financial modeling

## References cited
- Betancourt (2017)
- Mahfoudhi (2012)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/stephen_bronder.md`](../speakers/stephen_bronder.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

