---
type: Talk
title: Using Markov Models in R to Understand the Lifecycle of Exchange-traded Derivatives
description: Analyzing the lifecycle of exchange-traded derivatives using Markov models in R
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Grant Cavanaugh
speaker_slug: grant_cavanaugh
talk_type: Talk
time_slot: "09:44 - 10:04"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/GrantCavanaugh.pdf"
file_local: "./_cache/files/2013/2013__grant_cavanaugh.pdf"
slug: 2013__grant_cavanaugh
status: archived
tags: [osqf, 2013, grant_cavanaugh]
---

# Using Markov Models in R to Understand the Lifecycle of Exchange-traded Derivatives

_2013 · Grant Cavanaugh (University of Kentucky)_

**Headline:** Analyzing the lifecycle of exchange-traded derivatives using Markov models in R

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/GrantCavanaugh.pdf>
- Local: `./_cache/files/2013/2013__grant_cavanaugh.pdf`
- Talk type: Talk
- Time slot: 09:44 - 10:04

## Topics
- Markov models
- R programming
- exchange-traded derivatives
- lifecycle analysis

## Methods
- Bayesian Gibbs sampling
- Dirichlet distribution
- empirical cumulative distribution function (ECDF)

## Datasets used
- institutional database (futures, options, cleared swaps)
- Mike Penick’s work on futures (1954)

## Code & tools
- `JAGS`
- `rjags`

## Key findings
- Markov models analyze transitions between trading volume states over time  
  > Now ask: given the state that a contract is in this year (year t), what is the probability that it will go to each of the other possible states (i.e. those state we see in the sample) next year (year t+1)?
- Bayesian approach with Dirichlet distribution estimates state transition probabilities  
  > θ ∼ Dirichlet(xvol level 0 , xvol level 1 , . . . , xvol level 108 ) I estimated this using the Bayesian Gibbs sampling program Martyn Plummer’s JAGS (using R package rjags)
- Trading volume concentration decreased until 2000s then reversed sharply  
  > Trading volume grew steadily less concentrated between the 1950’s and 1990’s (perhaps with some retrenchment between the 1980’s and 1990’s.) That trend reversed sharply in the 2000’s, with the annual ECDFs approaching a right angle.

## Applications
- understanding derivative lifecycle
- trading volume analysis
- market structure analysis

## References cited
*(none extracted)*

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/grant_cavanaugh.md`](../speakers/grant_cavanaugh.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

