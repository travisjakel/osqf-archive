---
type: Talk
title: stochvolDealing with Stochastic Volatility in Time Series
description: The R package stochvol provides methods for modeling stochastic volatility in time series data.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Gregor Kastner
speaker_slug: gregor_kastner
talk_type: Talk
time_slot: "14:02 - 14:22"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/GregorKastner.pdf"
file_local: "./_cache/files/2014/2014__gregor_kastner.pdf"
slug: 2014__gregor_kastner
status: archived
tags: [osqf, 2014, gregor_kastner, stochastic_volatility_modeling, mcmc_estimation]
---

# stochvolDealing with Stochastic Volatility in Time Series

_2014 · Gregor Kastner_

**Headline:** The R package stochvol provides methods for modeling stochastic volatility in time series data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/GregorKastner.pdf>
- Local: `./_cache/files/2014/2014__gregor_kastner.pdf`
- Talk type: Talk
- Time slot: 14:02 - 14:22

## Topics
- stochastic volatility modeling
- time series analysis
- Bayesian inference
- MCMC algorithms
- R package development

## Methods
- MCMC estimation
- AWOL sampling
- ASIS strategy
- stochastic volatility models
- Bayesian parameter estimation

## Datasets used
- EUR/USD daily exchange rates (2000-2010)

## Code & tools
- stochvol (R package)
- R (language)
- C
- `Matlab`

## Key findings
- SV models produce more realistic autocorrelation functions for squared returns compared to GARCH.  
  > I . . . while still showing important differences, e.g. a more realistic ACF of squared returns.
- The AWOL method enables fast joint sampling of latent variables without matrix inversion.  
  > No need to invert (band diagonal) precision matrix of latents
- ASIS strategy improves MCMC efficiency by alternating between centered and noncentered parameterizations.  
  > Sample the "critical but cheap" parameters µ, σ (and φ), twice: Once centered, and once noncentered
- Inefficiency factors for parameter estimation show ASIS reduces variance by ~30x compared to standard MCMC.  
  > Inefficiency factors for p(σ|y): 500×100k draws, T = 5k

## Applications
- financial time series analysis
- volatility forecasting
- risk management

## References cited
- Jacquier, Polson, and Rossi (1994)
- Kim, Shephard, and Chib (1998)
- Omori et al. (2007)
- Yu and Meng (2011)
- Bos (2012)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/gregor_kastner.md`](../speakers/gregor_kastner.md)
- [`topics/stochastic_volatility_modeling.md`](../topics/stochastic_volatility_modeling.md)
- [`methods/mcmc_estimation.md`](../methods/mcmc_estimation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4)*

