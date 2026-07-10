---
type: Talk
title: The FlexBayes Package
description: The FlexBayes Package is an R package implementing Bayesian hierarchical models via C++ MCMC for computational finance and risk management
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Kjell Konis
speaker_slug: kjell_konis
talk_type: Lightning
time_slot: "16:22 - 16:34"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KjellKonis.pdf"
file_local: "./_cache/files/2014/2014__kjell_konis.pdf"
slug: 2014__kjell_konis
status: archived
tags: [osqf, 2014, kjell_konis, bayesian_statistics]
---

# The FlexBayes Package

_2014 · Kjell Konis (University of Washington)_

**Headline:** The FlexBayes Package is an R package implementing Bayesian hierarchical models via C++ MCMC for computational finance and risk management

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KjellKonis.pdf>
- Local: `./_cache/files/2014/2014__kjell_konis.pdf`
- Talk type: Lightning
- Time slot: 16:22 - 16:34

## Topics
- Bayesian statistics
- hierarchical modeling
- MCMC algorithms
- R package development

## Methods
- Bayesian hierarchical linear mixed models (bhlm)
- Bayesian hierarchical Poisson mixed models (bhpm)
- Bayesian hierarchical binomial mixed models (bhbm)
- Markov Chain Monte Carlo (MCMC)

## Datasets used
*(none extracted)*

## Code & tools
- R
- `FlexBayes`
- `coda`
- `R-Forge`

## Key findings
- FlexBayes implements Bayesian hierarchical models with multiple prior distributions  
  > Parameter Supported prior distributions α, γ normal, t, non-informative (flat) σj2 inverse chi-squared, uniform shrinkage, non-informative power, DuMouchel
- The package supports three types of hierarchical mixed models  
  > Provides functions for fitting the following models bhlm Hierarchical linear mixed model bhpm Hierarchical Poisson mixed model bhbm Hierarchical binomial (logistic) mixed model
- FlexBayes can fit Bayesian linear models with both informative and non-informative priors  
  > Fit the Bayes linear model with non-informative priors > bhlm(rt ˜ rmt, data = df)

## Applications
- computational finance
- risk management

## References cited
- Gelman et. al. 2004
- Scherer & Martin 2005

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/kjell_konis.md`](../speakers/kjell_konis.md)
- [`topics/bayesian_statistics.md`](../topics/bayesian_statistics.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

