---
type: Talk
title: gpusvcalibrationFast Stochastic Volatility Model Calibration using GPUs
description: "The gpusvcalibration R package accelerates stochastic volatility model calibration using GPUs, achieving up to 760x performance improvements by offloading computations to the GPU."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Matthew Dixon
speaker_slug: matthew_dixon
talk_type: Talk
time_slot: "15:42 - 16:02"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MatthewDixon.pdf"
file_local: "./_cache/files/2014/2014__matthew_dixon.pdf"
slug: 2014__matthew_dixon
status: archived
tags: [osqf, 2014, matthew_dixon, stochastic_volatility_modeling]
---

# gpusvcalibrationFast Stochastic Volatility Model Calibration using GPUs

_2014 · Matthew Dixon (University of San Francisco; Old Dominion University)_

**Headline:** The gpusvcalibration R package accelerates stochastic volatility model calibration using GPUs, achieving up to 760x performance improvements by offloading computations to the GPU.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MatthewDixon.pdf>
- Local: `./_cache/files/2014/2014__matthew_dixon.pdf`
- Talk type: Talk
- Time slot: 15:42 - 16:02

## Topics
- stochastic volatility modeling
- GPU acceleration
- calibration techniques
- financial computing
- parallel computing
- option pricing

## Methods
- Bates model
- Fourier-Cosine method
- differential evolution (DEoptim)
- parallel reduction using shared memory
- constrained least squares optimization

## Datasets used
*(none extracted)*

## Code & tools
- R
- `DEoptim`
- `nloptr`
- `CUDA`
- C++
- gpusvcalibration package

## Key findings
- GPU implementation achieves up to 760x speedup over CPU for calibration tasks  
  > provides a factor of up to 760x performance improvement by offloading bottle-neck computations to the GPU.
- Parallel Fourier-Cosine method reduces computation time significantly  
  > Each thread computes a term of the Fourier-Cosine series
- GPU-based error function computation is 79.2-86.3% of total runtime  
  > % ErrorFunction 79.2% 73.9% 64.7% 62.5% 86.3% 61.1%
- R package interface enables use with existing optimization libraries  
  > The package is designed for use with existing optimization CRAN packages such as DEoptim and nloptr

## Applications
- option pricing
- risk management
- financial modeling

## References cited
- M.F. Dixon, S. Khan and M. Zubair, gpusvcalibration: A R Package for Fast Stochastic Volatility Model Calibration using GPUs, R/Finance, Chicago, 2014
- Yacine Ait-Sahalia, Jianqing Fan and Yingying Li, The leverage effect puzzle: Disentangling sources of bias at high frequency, Journal of Financial Economics 109 (2013): 224–249

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/matthew_dixon.md`](../speakers/matthew_dixon.md)
- [`topics/stochastic_volatility_modeling.md`](../topics/stochastic_volatility_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4)*

