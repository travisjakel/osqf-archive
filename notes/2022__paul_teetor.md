---
type: Talk
title: Taming of Portfolio of Spreads
description: This talk explains how to standardize historical volatility and use median drawdowns with exponential models to manage risk budgets in spread portfolios.
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Paul Teetor
speaker_slug: paul_teetor
talk_type: Talk
time_slot: "11:35 - 11:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/PaulTeetor.pdf"
file_local: "./_cache/files/2022/2022__paul_teetor.pdf"
slug: 2022__paul_teetor
status: archived
tags: [osqf, 2022, paul_teetor, risk_management]
---

# Taming of Portfolio of Spreads

_2022 · Paul Teetor_

**Headline:** This talk explains how to standardize historical volatility and use median drawdowns with exponential models to manage risk budgets in spread portfolios.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/PaulTeetor.pdf>
- Local: `./_cache/files/2022/2022__paul_teetor.pdf`
- Talk type: Talk
- Time slot: 11:35 - 11:55

## Topics
- risk management
- portfolio of spreads
- volatility scaling
- statistical risk modeling

## Methods
- rescaling historical data to prevailing volatility
- median drawdown estimation
- exponential distribution extrapolation
- right-censoring analysis

## Datasets used
*(none extracted)*

## Code & tools
- R
- pexp() function

## Key findings
- Median drawdown provides more robust risk estimates than other quantiles  
  > Why median instead of, say, Q95?
- Exponential distribution models show 95th quantile = 4.3 * median  
  > 95th quantile = 4.3 * median
- Risk budget survival probabilities calculated using pexp() function  
  > prSurv <- pexp(40, rate = 1 / meanDD)

## Applications
- risk budget management
- portfolio optimization

## References cited
*(none extracted)*

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/paul_teetor.md`](../speakers/paul_teetor.md)
- [`topics/risk_management.md`](../topics/risk_management.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

