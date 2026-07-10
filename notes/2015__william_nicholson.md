---
type: Talk
title: Structured Regularization for Large Vector Autoregression
description: Applying structured regularization techniques to improve forecasting in large vector autoregressions with exogenous variables
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: William Nicholson
speaker_slug: william_nicholson
talk_type: Talk
time_slot: "14:23 - 14:43"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/WillNicholson.pdf"
file_local: "./_cache/files/2015/2015__william_nicholson.pdf"
slug: 2015__william_nicholson
status: archived
tags: [osqf, 2015, william_nicholson, group_lasso]
---

# Structured Regularization for Large Vector Autoregression

_2015 · William Nicholson (Cornell University)_

**Headline:** Applying structured regularization techniques to improve forecasting in large vector autoregressions with exogenous variables

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/WillNicholson.pdf>
- Local: `./_cache/files/2015/2015__william_nicholson.pdf`
- Talk type: Talk
- Time slot: 14:23 - 14:43

## Topics
- vector autoregression (VAR)
- structured regularization
- dimension reduction in time series
- macroeconomic forecasting

## Methods
- Group Lasso
- Sparse Group Lasso
- Lasso
- Hierarchical VAR penalties

## Datasets used
- Koop (2011) US macroeconomic indicators
- Canadian macroeconomic series (1960-2007)

## Code & tools
- BigVAR (R package)
- C++
- `Rcpp`

## Key findings
- Sparse Lag Group Lasso achieved lowest MSFE (2.959) in VARX forecasts  
  > Sparse Lag Group Lasso             2.959
- Hierarchical VAR penalties outperformed traditional methods in large-scale models  
  > Own-other                 93.004
- Endogenous-first penalty structure showed comparable performance to other methods  
  > Endogenous-First VARX              3.033

## Applications
- macroeconomic forecasting

## References cited
- arXiv:1412.5250
- Nicholsonetal2015

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/william_nicholson.md`](../speakers/william_nicholson.md)
- [`methods/group_lasso.md`](../methods/group_lasso.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

