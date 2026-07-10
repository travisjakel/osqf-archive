---
type: Talk
title: Portfolio Selection with Multiple Criteria Objectives
description: "The talk discusses portfolio optimization using multi-criteria methods like NSGA-II and weighted-sum approaches, applied to multi-asset portfolios with objectives on return, risk, and diversification."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Bernhard Pfaff
speaker_slug: bernhard_pfaff
talk_type: Talk
time_slot: "09:35 - 09:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/BernhardPfaff.pdf"
file_local: "./_cache/files/2016/2016__bernhard_pfaff.pdf"
slug: 2016__bernhard_pfaff
status: archived
tags: [osqf, 2016, bernhard_pfaff, portfolio_selection]
---

# Portfolio Selection with Multiple Criteria Objectives

_2016 · Bernhard Pfaff (Invesco Asset Management GmbH)_

**Headline:** The talk discusses portfolio optimization using multi-criteria methods like NSGA-II and weighted-sum approaches, applied to multi-asset portfolios with objectives on return, risk, and diversification.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/BernhardPfaff.pdf>
- Local: `./_cache/files/2016/2016__bernhard_pfaff.pdf`
- Talk type: Talk
- Time slot: 09:35 - 09:55

## Topics
- portfolio selection
- multi-criteria optimization
- Pareto efficiency
- asset management

## Methods
- NSGA-II
- weighted-sum method
- R package mco
- R package FRAPO

## Datasets used
- MultiAsset (month-end data 11/2004-11/2011)

## Code & tools
- R
- `mco`
- `FRAPO`
- `scatterplot3d`

## Key findings
- NSGA-II algorithm is used to find Pareto-efficient solutions in portfolio optimization.  
  > Solutions can be determined by genetic NSGA-II algorithm.
- The MultiAsset dataset contains month-end data from 11/2004 to 11/2011.  
  > Data set MultiAsset contained in FRAPO: month-end data from 11/2004 until 11/2011.
- Three objectives are optimized: mean return, volatility, and dispersion of risk contributions.  
  > MCO conisting of three objectives: 1 mean return, 2 volatility, and 3 dispersion of risk contributions.

## Applications
- multi-asset portfolio optimization
- risk management

## References cited
- Hirschberger et al. (2013)
- Deb et al. (2011)
- Steuer et al. (2005)
- Steuer et al. (2013)
- Utz et al. (2015)
- Mersmann (2014)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/bernhard_pfaff.md`](../speakers/bernhard_pfaff.md)
- [`topics/portfolio_selection.md`](../topics/portfolio_selection.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

