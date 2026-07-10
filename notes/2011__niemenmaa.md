---
type: Talk
title: Benchmarking Parallel Loops Without Data Dependency in R
description: Benchmarking parallel loops in R and predicting index returns using technical indicators
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Niemenmaa
speaker_slug: niemenmaa
talk_type: Talk
time_slot: "10:50 - 11:10"
file_format: ppt
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/MikoNiemenmaa.ppt"
file_local: "./_cache/files/2011/2011__niemenmaa.ppt"
slug: 2011__niemenmaa
status: archived
tags: [osqf, 2011, niemenmaa, parallel_computing_r]
---

# Benchmarking Parallel Loops Without Data Dependency in R

_2011 · Niemenmaa (Aalto University School of Economics (Formerly known as Helsinki School of Economics))_

**Headline:** Benchmarking parallel loops in R and predicting index returns using technical indicators

## Source
- File format: `ppt`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/MikoNiemenmaa.ppt>
- Local: `./_cache/files/2011/2011__niemenmaa.ppt`
- Talk type: Talk
- Time slot: 10:50 - 11:10

## Topics
- parallel computing in R
- benchmarking
- technical analysis for financial forecasting
- R package performance

## Methods
- parallelization of independent analyses
- boosting regressions for classification
- technical indicator application

## Datasets used
*(none extracted)*

## Code & tools
- R
- `rparallel`
- `Matlab`

## Key findings
- Parallel processing of independent tasks in R is significantly faster than sequential processing  
  > Doing naively parallel tasks in parallel is significantly faster
- The rparallel package enables simple parallel implementation in R  
  > Parallelizing is easy to implement in most cases
- Technical analysis indicators improve index return prediction accuracy by ~1-8% in backtests  
  > Using TA 52.51 %... % Increase 7.84 %
- Parallel computing reduces analysis time without requiring expensive hardware  
  > And you can get performance gains without breaking the budget

## Applications
- financial forecasting
- algorithmic trading backtesting

## References cited
- Niemenmaa, 2011, 'Benchmarking parallel loops without data dependency in R, and predicting index returns with technical indicators'
- Creamer and Freund, 2010, 'Automated Trading With Boosting And Expert Weighting'
- Rossi and Timmermann, 2010, 'What is the Shape of the Risk-Return Relation?'

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/niemenmaa.md`](../speakers/niemenmaa.md)
- [`topics/parallel_computing_r.md`](../topics/parallel_computing_r.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

