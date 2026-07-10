---
type: Talk
title: Parallel and other simulations in R made easyAn end-to-end study
description: "This talk presents an end-to-end framework for conducting parallel and other simulations in R, focusing on risk management applications like Value at Risk (VaR) computation using copula models."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Marius Hofert
speaker_slug: marius_hofert
talk_type: Talk
time_slot: "09:29 - 09:49"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MariusHofert.pdf"
file_local: "./_cache/files/2015/2015__marius_hofert.pdf"
slug: 2015__marius_hofert
status: archived
tags: [osqf, 2015, marius_hofert, parallel_computing_r]
---

# Parallel and other simulations in R made easyAn end-to-end study

_2015 · Marius Hofert (University of Waterloo)_

**Headline:** This talk presents an end-to-end framework for conducting parallel and other simulations in R, focusing on risk management applications like Value at Risk (VaR) computation using copula models.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MariusHofert.pdf>
- Local: `./_cache/files/2015/2015__marius_hofert.pdf`
- Talk type: Talk
- Time slot: 09:29 - 09:49

## Topics
- parallel computing in R
- Monte Carlo simulations
- risk management
- copula models
- VaR estimation

## Methods
- simsalapar package for simulation studies
- doOne() function implementation
- Monte Carlo methods
- copula-based modeling

## Datasets used
*(none extracted)*

## Code & tools
- `simsalapar`
- doOne()
- doLapply()
- doMclapply()
- doClusterApply()
- `copula`
- qrmtools::ARA()

## Key findings
- The simsalapar package simplifies parallel simulation studies through structured variable lists and parallel execution.  
  > Package simsalapar (simulations simplified and launched parallel) For students... validating internal models
- The varList object defines simulation parameters with types (N, grid, frozen, inner) to control study design.  
  > variable of type N gives the number of simulation replications... inner: Variables of this type are dealt with within a sub-job
- The doOne() function implements risk-factor change simulations and VaR computation using copula models.  
  > doOne(): Computation for one set of variables... empirical quantile as VaR estimate
- Results showed VaR estimates increased with dimension d despite decreasing expected losses.  
  > VaRα(L) is increasing in d although E[L] = d(1 − e) ≈ −0.65d ↓

## Applications
- risk management
- Value at Risk (VaR) computation

## References cited
*(none extracted)*

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/marius_hofert.md`](../speakers/marius_hofert.md)
- [`topics/parallel_computing_r.md`](../topics/parallel_computing_r.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4)*

