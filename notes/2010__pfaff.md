---
type: Talk
title: Risk Modeling with R
description: "Presentation on financial risk modeling techniques including fat tails, volatility clustering, copulae, and R-based implementations."
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Pfaff
speaker_slug: pfaff
talk_type: Keynote
time_slot: "11:00 - 12:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/BernhardPfaff.pdf"
file_local: "./_cache/files/2010/2010__pfaff.pdf"
slug: 2010__pfaff
status: archived
tags: [osqf, 2010, pfaff]
---

# Risk Modeling with R

_2010 · Pfaff (Invesco Asset Management Deutschland GmbH)_

**Headline:** Presentation on financial risk modeling techniques including fat tails, volatility clustering, copulae, and R-based implementations.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/BernhardPfaff.pdf>
- Local: `./_cache/files/2010/2010__pfaff.pdf`
- Talk type: Keynote
- Time slot: 11:00 - 12:00

## Topics
- Market Risk
- Risk Measures
- Extreme Value Theory
- Volatility Modeling
- Dependence Modeling
- Copula-GARCH

## Methods
- Block-Maxima
- Peaks-over-Threshold
- Generalized Extreme Value Distribution
- Generalized Pareto Distribution
- Poisson-Point-Process

## Datasets used
*(none extracted)*

## Code & tools
- `timeSeries`
- `xts`
- `zoo`
- `fBasics`
- `fSeries`
- `actuar`
- `fPortfolio`
- `PerformanceAnalytics`
- `QRMlib`
- `VaR`

## Key findings
- Daily returns exhibit volatility clustering and fat tails.  
  > Volatility does not remain constant over time. Absolute or squared returns are strongly autocorrelated. Density of a return process is leptokurtic (i.e. fat tails).
- Extreme returns show clustering across multiple assets.  
  > Extreme values in a return series often correspond to extreme values in other time series.
- Cross-correlations between asset returns vary over time.  
  > Correlations of concurrent returns vary over time.

## Applications
- Risk Management

## References cited
*(none extracted)*

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/pfaff.md`](../speakers/pfaff.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

