---
type: Talk
title: Risk and Performance Estimator Standard Errors for Serially Correlated Returns
description: "This talk introduces a method to compute standard errors for risk/performance estimators when returns are serially correlated, emphasizing their often-ignored importance."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Xin Chen
speaker_slug: xin_chen
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/XinChen.pdf"
file_local: "./_cache/files/2017/2017__xin_chen.pdf"
slug: 2017__xin_chen
status: archived
tags: [osqf, 2017, xin_chen, risk_performance_estimation]
---

# Risk and Performance Estimator Standard Errors for Serially Correlated Returns

_2017 · Xin Chen (University of Washington)_

**Headline:** This talk introduces a method to compute standard errors for risk/performance estimators when returns are serially correlated, emphasizing their often-ignored importance.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/XinChen.pdf>
- Local: `./_cache/files/2017/2017__xin_chen.pdf`
- Talk type: Lightning

## Topics
- risk/performance estimation
- standard errors
- serial correlation
- Monte Carlo methods

## Methods
- Monte Carlo simulation study
- Rcpp implementation

## Datasets used
- hedge fund returns data

## Code & tools
- `Rcpp`
- https://github.com/chenx26/EstimatorStandardError

## Key findings
- Standard errors (SE) for risk measures are often ignored despite being critical for accurate estimation.  
  > SE is important, but often ignored
- The authors propose a new method to compute SE for risk/performance estimators with serially correlated returns.  
  > We have introduced a new method to compute risk/performance estimator standard errors
- The method was implemented efficiently using Rcpp as part of the GSoC 2017 project.  
  > Efficient Implementation with Rcpp in GSoC 2017
- Empirical results on hedge fund returns show significant differences between iid and serially correlated SE estimates.  
  > ##          ES   IFiid   IFcor BOOTiid BOOTcor

## Applications
- risk management
- performance evaluation

## References cited
*(none extracted)*

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/xin_chen.md`](../speakers/xin_chen.md)
- [`topics/risk_performance_estimation.md`](../topics/risk_performance_estimation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4)*

