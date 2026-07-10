---
type: Talk
title: Diversification ReconsideredMinimum Tail Dependence
description: "The talk re-examines diversification strategies by focusing on minimum tail dependence, proposing optimal portfolios that minimize lower tail risk."
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Pfaff
speaker_slug: pfaff
talk_type: Talk
time_slot: "10:30 - 10:50"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/BernhardPfaff.pdf"
file_local: "./_cache/files/2012/2012__pfaff.pdf"
slug: 2012__pfaff
status: archived
tags: [osqf, 2012, pfaff, diversification]
---

# Diversification ReconsideredMinimum Tail Dependence

_2012 · Pfaff (Invesco Asset Management Deutschland GmbH, Frankfurt am Main)_

**Headline:** The talk re-examines diversification strategies by focusing on minimum tail dependence, proposing optimal portfolios that minimize lower tail risk.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/BernhardPfaff.pdf>
- Local: `./_cache/files/2012/2012__pfaff.pdf`
- Talk type: Talk
- Time slot: 10:30 - 10:50

## Topics
- diversification
- tail dependence
- portfolio optimization
- risk management
- copula models
- non-parametric estimation

## Methods
- non-parametric tail dependence estimation
- copula-based models
- portfolio optimization with tail dependence
- comparison of diversification strategies (GMV, MDP, ERC, MTD)
- risk contribution analysis

## Datasets used
- Swiss Performance Sector Indexes (SPISECTOR)
- INDTRACK6 (OR-Library)

## Code & tools
- `FRAPO`
- `fPortfolio`
- `lattice`
- `copula`
- R

## Key findings
- Minimum Tail Dependent (MTD) portfolios reduce lower tail risk compared to traditional strategies like GMV and ERC.  
  > Table: Key measures of portfolio solutions for SPI sectors
- Non-parametric estimators for lower tail dependence (e.g., secant-, slope-, mixture-based) are implemented in FRAPO.  
  > Implemented in package FRAPO (see Pfaff, 2012)
- MTD portfolios show lower concentration ratios and similar risk measures to ERC but with distinct allocation patterns.  
  > Standard Deviation: 0.903; Diversification Ratio: 1.549

## Applications
- portfolio optimization
- risk management
- asset allocation

## References cited
- Boudt et al. (2010, 2011)
- Choueifaty and Coignard (2008)
- Dobric and Schmid (2005)
- Frahm et al. (2005)
- Maillard et al. (2010)
- Malevergne and Sornette (2008)
- Markowitz (1952, 1956, 1991)
- Pfaff (2012)
- Qian (2005, 2006, 2011)
- Schmidt and Stadtmueller (2006)

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/pfaff.md`](../speakers/pfaff.md)
- [`topics/diversification.md`](../topics/diversification.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

