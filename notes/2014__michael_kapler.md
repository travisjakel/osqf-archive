---
type: Talk
title: Average Correlation and Adaptive Shrinkage Estimators
description: Presentation on using average correlation and adaptive shrinkage estimators for portfolio optimization and risk management
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Michael Kapler
speaker_slug: michael_kapler
talk_type: Lightning
time_slot: "15:45 - 15:51"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MichaelKapler.pdf"
file_local: "./_cache/files/2014/2014__michael_kapler.pdf"
slug: 2014__michael_kapler
status: archived
tags: [osqf, 2014, michael_kapler]
---

# Average Correlation and Adaptive Shrinkage Estimators

_2014 · Michael Kapler (Systematic Investor Blog)_

**Headline:** Presentation on using average correlation and adaptive shrinkage estimators for portfolio optimization and risk management

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MichaelKapler.pdf>
- Local: `./_cache/files/2014/2014__michael_kapler.pdf`
- Talk type: Lightning
- Time slot: 15:45 - 15:51

## Topics
- correlation estimation
- shrinkage methods
- portfolio optimization
- financial risk management

## Methods
- adaptive shrinkage
- sample covariance matrix shrinkage
- average correlation shrinkage
- equally weighted aggregation of estimators

## Datasets used
- Futures, Forex, Stocks, ETFs

## Code & tools
- R

## Key findings
- Average correlation matrix produces more stable estimates than sample correlation matrices  
  > Average Correlation Matrix iyr | 0.43 | 0.413 | 0.42 | 0.135
- Equal weighting of shrinkage estimators outperforms single estimator selection  
  > Distribute weights equally across given estimators produced better metrics
- Optimal shrinkage recipe combines sample, sample anchored, and average correlation methods  
  > Our Shrinkage Recipe: Equally Weight Sample, Sample Anchored, and Average Correlation

## Applications
- portfolio optimization
- risk management
- financial modeling

## References cited
- Honey, I Shrunk the Sample Covariance Matrix (Ledoit, Wolf, 2004)
- Shrinkage the Covariance Matrix -Simpler is Better (Disatnik, Benninga, 2007)
- Adaptive Shrinkage (Varadi, Kapler, 2013)
- Average Correlation Shrinkage (Varadi, Kapler, 2013)
- Shrinkage: A Simple Composite Model Performs the Best (Varadi, Kapler, 2013)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/michael_kapler.md`](../speakers/michael_kapler.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

