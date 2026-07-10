---
type: Talk
title: Better Hedge Ratios
description: This talk explains how to calculate symmetric hedge ratios using total least squares (TLS) instead of ordinary least squares (OLS) in R.
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Teetor
speaker_slug: teetor
talk_type: Lightning
time_slot: "13:30 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/PaulTeetor.pdf"
file_local: "./_cache/files/2011/2011__teetor.pdf"
slug: 2011__teetor
status: archived
tags: [osqf, 2011, teetor, ordinary_least_squares_ols]
---

# Better Hedge Ratios

_2011 · Teetor_

**Headline:** This talk explains how to calculate symmetric hedge ratios using total least squares (TLS) instead of ordinary least squares (OLS) in R.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/PaulTeetor.pdf>
- Local: `./_cache/files/2011/2011__teetor.pdf`
- Talk type: Lightning
- Time slot: 13:30 - 14:00

## Topics
- hedge ratios
- regression methods
- financial spreads

## Methods
- ordinary least squares (OLS)
- total least squares (TLS)
- principal components analysis (PCA)

## Datasets used
*(none extracted)*

## Code & tools
- R
- lm()
- princomp()

## Key findings
- OLS hedge ratios are asymmetric when switching X and Y  
  > OLS is asymmetric: switching role of X, Y gives inconsistent H.R.
- TLS provides symmetric hedge ratios  
  > TLS calculates a hedge ratio which is symmetric.
- TLS can be computed via PCA in R  
  > TLS for 2-asset spread: r <- princomp( ~ x + y)

## Applications
*(none extracted)*

## References cited
- The Total Least Squares Problem, Van Huffel and Vandewalle (SIAM, 1991)

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/teetor.md`](../speakers/teetor.md)
- [`methods/ordinary_least_squares_ols.md`](../methods/ordinary_least_squares_ols.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

