---
type: Talk
title: Generalized Linear Model Fitting with Elastic Net Regularization for Gamma Distributed Data using Rcpp
description: Generalized Linear Model with Elastic Net Regularization for Gamma Distributed Response Variables using Rcpp
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: XIn Chen
speaker_slug: xin_chen
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/XinChen.pdf"
file_local: "./_cache/files/2018/2018__xin_chen.pdf"
slug: 2018__xin_chen
status: archived
tags: [osqf, 2018, xin_chen]
---

# Generalized Linear Model Fitting with Elastic Net Regularization for Gamma Distributed Data using Rcpp

_2018 · XIn Chen (University of Washington, Department of Applied Mathematics)_

**Headline:** Generalized Linear Model with Elastic Net Regularization for Gamma Distributed Response Variables using Rcpp

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/XinChen.pdf>
- Local: `./_cache/files/2018/2018__xin_chen.pdf`
- Talk type: Lightning

## Topics
- Generalized Linear Models
- Elastic Net Regularization
- Gamma Distribution
- Rcpp Optimization
- Risk/Performance Estimation

## Methods
- Elastic Net Regularization (L1+L2)
- FISTA Algorithm
- Cross Validation
- Gamma Distribution GLM

## Datasets used
- Hedge Fund Returns (CTAG, DIS, EM, EMN, ED, FIA, GM, SS, FoF)

## Code & tools
- `Rcpp`
- `glmGammaNet`
- `FISTA`
- `glmnet`
- `h2o`
- `bestglm`

## Key findings
- OLS assumes normal distribution and linear relationships, failing to identify sparsity or handle collinearity  
  > Assumes response variable is normally distributed Cannot identify possible sparsity in the data set May encounter numerical problems when there is collinearity
- glmNet combines L1/L2 regularization for sparsity and collinearity, with applications in risk/performance estimation  
  > Add ℓ1 regularization to discover sparsity Add ℓ2 regularization to deal with collinearity Chen and Martin (2018) used a glmNet model for exponentially-distributed spectral density estimate to compute the standard error of a variety of risk/performance measures
- glmGammaNet outperforms other GLM methods in L1 error and zero coefficient identification  
  > glmGammaNet.1sd.nonzero 0.23 5.8 glmGammaNet.percentile.nonzero 0.33 8.3
- Modified FISTA algorithm and cross-validation with percentile/1sd criteria improve model selection  
  > Use Cross Validation to choose appropriate λ from a grid of possible values Choose λ that corresponds to the pth percentile of CV errors

## Applications
- risk management
- performance estimation
- serially correlated returns analysis

## References cited
- arXiv:1804.07780
- SSRN:3085672
- https://github.com/chenx26/glmGammaNet

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/xin_chen.md`](../speakers/xin_chen.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4), source=ocr(paddle)*

