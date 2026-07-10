---
type: Talk
title: Augmenting Trading Systems with Hidden Markov Models using BayesHMM
description: Using Hidden Markov Models (HMM) with BayesHMM to extract latent states from noisy time series data in trading systems.
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Luis Damiano
speaker_slug: luis_damiano
talk_type: Talk
time_slot: "10:00 - 10:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/LuisDamiano.pdf"
file_local: "./_cache/files/2019/2019__luis_damiano.pdf"
slug: 2019__luis_damiano
status: archived
tags: [osqf, 2019, luis_damiano]
---

# Augmenting Trading Systems with Hidden Markov Models using BayesHMM

_2019 · Luis Damiano (Iowa State University)_

**Headline:** Using Hidden Markov Models (HMM) with BayesHMM to extract latent states from noisy time series data in trading systems.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/LuisDamiano.pdf>
- Local: `./_cache/files/2019/2019__luis_damiano.pdf`
- Talk type: Talk
- Time slot: 10:00 - 10:20

## Topics
- Hidden Markov Models
- Bayesian inference
- Signal extraction in time series
- Trading system augmentation
- Latent state identification

## Methods
- Hidden Markov Models (HMM)
- BayesHMM
- Posterior predictive checks
- Stan (Bayesian inference)

## Datasets used
- CME 6B Futures Depth imbalance (2015-01-13 11:00:00 / 2015-01-13 11:09:55)

## Code & tools
- `BayesHMM`
- `Stan`
- `TCPDF`

## Key findings
- HMM can extract latent states from noisy time series data.  
  > Illustrate how to use a Hidden Markov Model to extract a sequence of latent states from a series of observations.
- The example dataset exhibits complex, non-iid structure with low signal-to-noise ratio.  
  > Overall, the series structure is ugly complex.
- Bayesian HMM (BayesHMM) enables rich interpretation and diagnostics.  
  > The model can be informed via priors. Mathematically tractable. Plethora of diagnostics.
- Posterior predictive checks validate model fit to data.  
  > Posterior predictive check: If the model fits, replicated data generated under the model should look similar to observed data.

## Applications
- Trading system augmentation
- Risk management (identifying risk states)
- Behavioral finance analysis

## References cited
- Cook et al. 2006
- Gabry et al. 2019
- Gelman et al. 2013
- Talts et al. 2018
- Carpenter et al. 2017

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/luis_damiano.md`](../speakers/luis_damiano.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

