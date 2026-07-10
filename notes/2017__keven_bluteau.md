---
type: Talk
title: Forecasting Performance of Markov-Switching GARCH ModelsA Large-Scale Empirical Study
description: "The MSGARCH R package implements Markov-switching GARCH models with C++ optimization, supporting volatility forecasting and risk measures."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Keven Bluteau
speaker_slug: keven_bluteau
talk_type: Talk
time_slot: "14:35 - 14:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/KevenBluteau.pdf"
file_local: "./_cache/files/2017/2017__keven_bluteau.pdf"
slug: 2017__keven_bluteau
status: archived
tags: [osqf, 2017, keven_bluteau, maximum_likelihood_estimation_mle]
---

# Forecasting Performance of Markov-Switching GARCH ModelsA Large-Scale Empirical Study

_2017 · Keven Bluteau_

**Headline:** The MSGARCH R package implements Markov-switching GARCH models with C++ optimization, supporting volatility forecasting and risk measures.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/KevenBluteau.pdf>
- Local: `./_cache/files/2017/2017__keven_bluteau.pdf`
- Talk type: Talk
- Time slot: 14:35 - 14:55

## Topics
- Markov-Switching GARCH models
- volatility forecasting
- R package development
- risk measure forecasting

## Methods
- Maximum Likelihood Estimation (MLE)
- Bayesian estimation
- C++ implementation for computational efficiency

## Datasets used
- SMI log-returns from 1990-11-12 to 2000-10-20

## Code & tools
- `MSGARCH`
- `Rcpp`
- `DEoptim`
- `nmkb`
- `adaptMCMC`
- `rugarch`

## Key findings
- MSGARCH uses C++ (via Rcpp) for fast computations  
  > Core of the package is in C++ (thanks to Rcpp) to allow for fast and efficient computations.
- Package supports skewed distributions via Fernández and Steel (1998) transformation  
  > Skewed versions also available using the Fernández and Steel (1998) transformation.
- MLE and Bayesian estimation are both supported  
  > All functionalities are compatible for both MLE and Bayesian estimation.

## Applications
- volatility forecasting
- risk management (VaR/ES)
- model selection

## References cited
- Haas et al. (2004a)
- Fernández and Steel (1998)
- Bollerslev (1986)
- Nelson (1991)
- Glosten et al. (1993)
- Zakoian (1994)
- Creal et al. (2013)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/keven_bluteau.md`](../speakers/keven_bluteau.md)
- [`methods/maximum_likelihood_estimation_mle.md`](../methods/maximum_likelihood_estimation_mle.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

