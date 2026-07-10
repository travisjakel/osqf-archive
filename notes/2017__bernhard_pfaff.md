---
type: Talk
title: R packagemcrpMultiple criteria risk contribution optimization
description: "Presentation on the R package mcrp for optimizing portfolio risk contributions across multiple criteria including variance, skewness, and kurtosis."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Bernhard Pfaff
speaker_slug: bernhard_pfaff
talk_type: Talk
time_slot: "15:10 - 15:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/BernhardPfaff.pdf"
file_local: "./_cache/files/2017/2017__bernhard_pfaff.pdf"
slug: 2017__bernhard_pfaff
status: archived
tags: [osqf, 2017, bernhard_pfaff, risk_parity]
---

# R packagemcrpMultiple criteria risk contribution optimization

_2017 · Bernhard Pfaff (Invesco Asset Management GmbH)_

**Headline:** Presentation on the R package mcrp for optimizing portfolio risk contributions across multiple criteria including variance, skewness, and kurtosis.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/BernhardPfaff.pdf>
- Local: `./_cache/files/2017/2017__bernhard_pfaff.pdf`
- Talk type: Talk
- Time slot: 15:10 - 15:30

## Topics
- risk parity
- higher-moment risk optimization
- portfolio optimization
- R package development

## Methods
- higher-moment risk contribution analysis
- constrained optimization with lambda weights
- nlminb optimization algorithm

## Datasets used
- FRAPO MultiAsset (month-end 2004-2011)

## Code & tools
- mcrp R package
- `FRAPO`
- `testthat`
- stats::nlminb()

## Key findings
- Higher-moment risk contributions (skewness, kurtosis) reduce portfolio dispersion vs. ERC-only solutions  
  > By considering higher moment risk contributions, overall dispersion is reduced compared to the ERC-only solution.
- Optimization balances risk, skewness, and kurtosis via lambda parameters  
  > Weighting between (higher) moment risk contributions is possible by setting of λ...
- mcrp package implements PortSol class for storing optimization results  
  > S4-Class: PortSol from package FRAPO...

## Applications
- portfolio optimization
- risk management

## References cited
- Baitinger et al. (2017)
- Jondeau and Rockinger (2006)
- Maillard et al. (2010)
- Pfaff (2016)
- Qian (2005, 2006, 2011)
- Roncalli (2013)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/bernhard_pfaff.md`](../speakers/bernhard_pfaff.md)
- [`topics/risk_parity.md`](../topics/risk_parity.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

