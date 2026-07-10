---
type: Talk
title: Regularizing Bayesian Predictive Regressions
description: "The talk explores the connection between Bayesian predictive regressions and regularization methods, using prior sensitivity analysis to optimize model performance."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Guanhao Feng
speaker_slug: guanhao_feng
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/GuanhaoFeng-1.pdf"
file_local: "./_cache/files/2017/2017__guanhao_feng.pdf"
slug: 2017__guanhao_feng
status: archived
tags: [osqf, 2017, guanhao_feng]
---

# Regularizing Bayesian Predictive Regressions

_2017 · Guanhao Feng (Booth School of Business, University of Chicago)_

**Headline:** The talk explores the connection between Bayesian predictive regressions and regularization methods, using prior sensitivity analysis to optimize model performance.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/GuanhaoFeng-1.pdf>
- Local: `./_cache/files/2017/2017__guanhao_feng.pdf`
- Talk type: Lightning

## Topics
- Bayesian predictive regressions
- regularization methods
- prior sensitivity analysis
- financial forecasting

## Methods
- VAR(1) model
- Lasso regression
- Ridge regression
- cross-validation
- AIC/BIC
- shrinkage priors

## Datasets used
- Quarterly data from Goyal and Welch (2008) for S&P 500 index forecasting

## Code & tools
*(none extracted)*

## Key findings
- Regularization and Bayesian methods share a duality through prior sensitivity analysis.  
  > A duality between Bayesian predictive regressions and regularization, which leads to a framework of prior sensitivity analysis through the regularization path of the predictors.
- Hyperparameters (λ, γ) control bias-variance tradeoff in regularization and prior specification in Bayesian analysis.  
  > If ∆φ(B, Σ) = λ∆φ1(B) + γ∆φ2(Σ), then λ and γ are hyper-parameters of a prior distribution and tuning parameters in a regularization problem.
- Shrinkage priors enable high-dimensional predictor selection and sparse covariance matrix estimation.  
  > Additional insights using shrinkage priors include high-dimensional predictor selection and a interpretable sparse variance-covariance matrix.

## Applications
- financial forecasting
- market timing strategies
- predictive return modeling

## References cited
- Goyal and Welch (2008)
- Lettau and Ludvigson (2001)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/guanhao_feng.md`](../speakers/guanhao_feng.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

