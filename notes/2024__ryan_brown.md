---
type: Talk
title: Estimating Betas
description: The talk discusses the limitations of beta in equity markets and presents faster methods for estimating betas with low volatility portfolios.
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Ryan Brown
speaker_slug: ryan_brown
talk_type: Talk
time_slot: "13:40 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/RyanBrown.pdf"
file_local: "./_cache/files/2024/2024__ryan_brown.pdf"
slug: 2024__ryan_brown
status: archived
tags: [osqf, 2024, ryan_brown]
---

# Estimating Betas

_2024 · Ryan Brown_

**Headline:** The talk discusses the limitations of beta in equity markets and presents faster methods for estimating betas with low volatility portfolios.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/RyanBrown.pdf>
- Local: `./_cache/files/2024/2024__ryan_brown.pdf`
- Talk type: Talk
- Time slot: 13:40 - 14:00

## Topics
- low volatility investing
- beta estimation
- weighted least squares (WLS)
- rolling regression techniques

## Methods
- rollRegres::roll_regres.fit
- WLS estimates
- QR decomposition with rank-one updates
- expanding window calculations

## Datasets used
- Russell1000 / Since 1997 / Daily returns

## Code & tools
- `rollRegres`
- `dplyr`
- `future_lapply`
- QR decomposition

## Key findings
- Low beta securities keep pace with high beta securities  
  > Key finding: Low beta securities keep pace with high beta securities
- Low volatility portfolios have about three-quarters the realized risk of the general market  
  > Key finding: Low volatility portfolios have about three-quarters the realized risk...
- Rolling regression techniques are >= 2 orders of magnitude faster than slice+compute  
  > Estimation technique can be applied to any generic time-series... >= 2 orders of magnitude faster than slice+compute

## Applications
- low volatility portfolio construction
- risk management
- equity market analysis

## References cited
- 'The Capital Asset Pricing Model: Some Empirical Tests' (1972)
- 'The Cross-Section of Expected Stock Returns' (Fama and French, 1992)
- 'Minimum-Variance Portfolios in the U.S. Equity Market' (Clarke, de Silva and Thorley, 2006)

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/ryan_brown.md`](../speakers/ryan_brown.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

