---
type: Talk
title: Implementation of the stochastic volatility and interest rate model with multiple GPUs in R
description: Implementation of a multi-GPU stochastic volatility and interest rate model in R for financial simulations
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: JJ Lay
speaker_slug: jj_lay
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/JJLay.pdf"
file_local: "./_cache/files/2018/2018__jj_lay.pdf"
slug: 2018__jj_lay
status: archived
tags: [osqf, 2018, jj_lay, stochastic_volatility_modeling]
---

# Implementation of the stochastic volatility and interest rate model with multiple GPUs in R

_2018 · JJ Lay (Thompson Machinery)_

**Headline:** Implementation of a multi-GPU stochastic volatility and interest rate model in R for financial simulations

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/JJLay.pdf>
- Local: `./_cache/files/2018/2018__jj_lay.pdf`
- Talk type: Lightning

## Topics
- stochastic volatility modeling
- interest rate modeling
- multilevel Monte Carlo simulations
- GPU acceleration in finance
- R programming for quantitative finance

## Methods
- Multilevel Monte Carlo (MLMC)
- Antithetic MLMC
- CUDA kernel simulations
- Rcpp for GPU integration
- Stochastic Differential Equations (SDEs)

## Datasets used
*(none extracted)*

## Code & tools
- R
- `Rcpp`
- C++
- `CUDA`
- Tesla K40
- Quadro M2200
- Quadro K3100M

## Key findings
- MLMC achieves high accuracy in European put pricing with errors below 0.05%  
  > Error % 0.05% 0.00% 0.02% 0.02% 0.00% 0.01%
- Antithetic MLMC reduces variance through fine-step antithetic operations  
  > Antithetic MLMC 4 further reduces variance in the system.
- GPU implementation uses Rcpp to launch CUDA kernels across multiple GPUs  
  > C++ launches CUDA kernel on each GPU with an equal number of simulations

## Applications
- financial simulations
- option pricing
- risk management

## References cited
- Medvedev, Alexy, and Olivier Scaillet. 2010.
- Giles, Michael B. 2008.
- Giles, Michael B, and Lukasz Szpruch. 2014.
- Lay, H., Colgin, Z., Reshniak, V., & Khaliq, A. (2018)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/jj_lay.md`](../speakers/jj_lay.md)
- [`topics/stochastic_volatility_modeling.md`](../topics/stochastic_volatility_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

