---
type: Talk
title: Risk Parity Under Parameter Uncertainty
description: "Analysis of risk-based portfolio strategies' out-of-sample performance under parameter uncertainty using bootstrap methods."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Lukas Elmiger
speaker_slug: lukas_elmiger
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/LukasElmiger.pdf"
file_local: "./_cache/files/2017/2017__lukas_elmiger.pdf"
slug: 2017__lukas_elmiger
status: archived
tags: [osqf, 2017, lukas_elmiger, risk_parity]
---

# Risk Parity Under Parameter Uncertainty

_2017 · Lukas Elmiger_

**Headline:** Analysis of risk-based portfolio strategies' out-of-sample performance under parameter uncertainty using bootstrap methods.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/LukasElmiger.pdf>
- Local: `./_cache/files/2017/2017__lukas_elmiger.pdf`
- Talk type: Lightning

## Topics
- risk parity
- parameter uncertainty
- portfolio optimization
- bootstrap methods
- Sharpe ratio analysis

## Methods
- block-bootstrap with monthlong blocks
- portfolio recalibration on overlapping bootstrap samples

## Datasets used
- S&P 500 Stocks (daily CRSP data 1990-2016)
- Global Futures (tickdata.com intra-day data 1999-2016)

## Code & tools
- `PortfolioAnalytics`
- `FRAPO`

## Key findings
- Maximum Diversified portfolios achieved highest Sharpe ratios in single US stocks and global futures.  
  > Maximum Diversified portfolio reaches highest sharpe ratio in single US stocks / second highest sharpe ratio in global futures over study period.
- Bootstrap reveals elevated sensitivity to parameter estimation for all strategies.  
  > High dispersion of out-of-sample performance... indicates elevated sensitivity to parameter estimation.
- Complex strategies like Maximum Diversified have higher parameter sensitivity.  
  > It pays out to use a more complex portfolio strategy... higher sensitivity to parameter estimation.

## Applications
- portfolio optimization
- risk management

## References cited
- Arida et al. (2015) - Covariance Misspecification in Risk-Based Portfolios
- Choueifaty & Coignard (2008) - Maximum Diversification
- Harvey & Liu (2015) - Lucky Factors
- Maillard et al. (2010) - Equal Risk Contribution Portfolios

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/lukas_elmiger.md`](../speakers/lukas_elmiger.md)
- [`topics/risk_parity.md`](../topics/risk_parity.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

