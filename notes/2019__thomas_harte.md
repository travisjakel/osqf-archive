---
type: Talk
title: "Hedging the Unhedgeable: Hedging Risk When Prices Are Not Observable"
description: "This talk presents a framework for hedging derivatives on private-equity funds when market prices are unobservable, using Bayesian calibration of stochastic differential equations (SDEs) and passive portfolio replication as hedging instruments."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Thomas Harte
speaker_slug: thomas_harte
talk_type: Talk
time_slot: "13:35 - 13:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/ThomasHarte.pdf"
file_local: "./_cache/files/2019/2019__thomas_harte.pdf"
slug: 2019__thomas_harte
status: archived
tags: [osqf, 2019, thomas_harte, stochastic_differential_equations_sdes]
---

# Hedging the Unhedgeable: Hedging Risk When Prices Are Not Observable

_2019 · Thomas Harte (pe-analytics.io, University of Passau, Germany)_

**Headline:** This talk presents a framework for hedging derivatives on private-equity funds when market prices are unobservable, using Bayesian calibration of stochastic differential equations (SDEs) and passive portfolio replication as hedging instruments.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/ThomasHarte.pdf>
- Local: `./_cache/files/2019/2019__thomas_harte.pdf`
- Talk type: Talk
- Time slot: 13:35 - 13:55

## Topics
- parameter inference in SDEs
- hedging instruments for private-equity derivatives
- Bayesian time-series calibration
- financial risk management

## Methods
- stochastic differential equations (SDEs)
- Bayesian time-series calibration
- Particle Marginal Metropolis-Hastings (PMMH)
- passive portfolio replication for hedging

## Datasets used
*(none extracted)*

## Code & tools
- `Stan`
- R

## Key findings
- A novel Bayesian time-series method is used to calibrate the SDE model for private-equity funds.  
  > We calibrate our model using a novel Bayesian time-series method.
- Private-equity funds can be approximated by passive portfolios of publicly-traded indices with leverage, enabling hedging instruments.  
  > a passive portfolio consisting of such an investment (with modest amounts of leverage...) can produce cash flows consistent with private-equity funds.
- Online parameter inference in SDEs with low-frequency data (40 observations typical) is exceptionally challenging.  
  > We have between 32 (eight-year legal lifetime) and 60 (fifteen-year legal lifetime) observations for each fund-most typically 40 observations (ten-year legal lifetime).

## Applications
- derivative pricing in incomplete markets
- risk management for private-equity investments

## References cited
- Harte and Buchner, 2017
- Harte and Buchner, 2018
- Golightly and Wilkinson, 2011
- Andrieu et al., 2010

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/thomas_harte.md`](../speakers/thomas_harte.md)
- [`methods/stochastic_differential_equations_sdes.md`](../methods/stochastic_differential_equations_sdes.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

