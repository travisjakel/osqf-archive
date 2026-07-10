---
type: Talk
title: Scenario Analysis of Risk Parity using RcppParallel
description: "The 'roll' package with RcppParallel enables fast rolling statistics for scenario analysis in risk parity portfolios."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Jason Foster
speaker_slug: jason_foster
talk_type: Talk
time_slot: "10:45 - 11:05"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/JasonFoster.pdf"
file_local: "./_cache/files/2017/2017__jason_foster.pdf"
slug: 2017__jason_foster
status: archived
tags: [osqf, 2017, jason_foster, risk_parity]
---

# Scenario Analysis of Risk Parity using RcppParallel

_2017 · Jason Foster (CRAN - Package 'roll')_

**Headline:** The 'roll' package with RcppParallel enables fast rolling statistics for scenario analysis in risk parity portfolios.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/JasonFoster.pdf>
- Local: `./_cache/files/2017/2017__jason_foster.pdf`
- Talk type: Talk
- Time slot: 10:45 - 11:05

## Topics
- risk parity
- scenario analysis
- parallel computing
- portfolio management

## Methods
- RcppParallel
- RcppArmadillo
- rollapplyr
- rolling statistics

## Datasets used
- S&P 500 index (via quantmod)

## Code & tools
- `roll`
- `RcppParallel`
- `RcppArmadillo`
- `quantmod`
- `rollapplyr`

## Key findings
- Parallel computing reduces computation time by 25x-93x compared to R versions for rolling statistics.  
  > Speed gains from parallel computing help decrease the trade-off between number of observations and window size: Less than 1-minute!
- RcppParallel's roll_lm function matches RcppArmadillo's performance with equal coefficients.  
  > all.equal(arma_lm_coef, roll_lm_coef) ## [1] TRUE
- Risk parity strategies using rolling statistics show sensitivity to volatility and correlation scenarios.  
  > Scenario 1: Average volatility/correlation; Scenario 2: Low volatility/correlation; Scenario 3: High volatility/correlation

## Applications
- risk parity portfolio optimization
- scenario analysis for asset allocation

## References cited
- Sharpe, William F. 1988. 'Determining a Fund's Effective Asset Mix.' Investment Management Review.

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/jason_foster.md`](../speakers/jason_foster.md)
- [`topics/risk_parity.md`](../topics/risk_parity.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

