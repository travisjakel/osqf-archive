---
type: Talk
title: Machine Learning for Multi-Market Factor Timing
description: "Machine learning helps predict multi-market factor timing by combining characteristics/anomalies ('factors') and using principal components (PCs) for dimension reduction."
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Paul Laux
speaker_slug: paul_laux
talk_type: Talk
time_slot: "15:05 - 15:25"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/PaulLaux-OlamideAyodele.pdf"
file_local: "./_cache/files/2023/2023__paul_laux.pdf"
slug: 2023__paul_laux
status: archived
tags: [osqf, 2023, paul_laux, random_forest]
---

# Machine Learning for Multi-Market Factor Timing

_2023 · Paul Laux (University of Delaware, Department of Finance and Institute for Financial Services Analytics)_

**Headline:** Machine learning helps predict multi-market factor timing by combining characteristics/anomalies ('factors') and using principal components (PCs) for dimension reduction.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/PaulLaux-OlamideAyodele.pdf>
- Local: `./_cache/files/2023/2023__paul_laux.pdf`
- Talk type: Talk
- Time slot: 15:05 - 15:25

## Topics
- factor timing
- machine learning
- market pricing
- principal components
- hedging

## Methods
- random forest
- deep learning (FFN/LSTM)
- principal component analysis (PCA)
- predictive regressions

## Datasets used
- US equity anomalies (50 characteristic-based long-short anomaly portfolios 1974-2017 from Haddad Kozak Santosh RFS 2020)
- Global styles (28 style-based long-short portfolios 1926-2022 from Ilmanen Israel Lee Moskowitz Thapor J of Investment Management 2021)

## Code & tools
- random forest
- feedforward neural networks (FFN)
- long short-term memory (LSTM)

## Key findings
- Pricing of factors combines to drive market pricing  
  > Pricing of styles/characteristics/anomalies ('factors') combine to drive market pricing
- Machine learning improves factor prediction over linear models  
  > Random forest improves predictability, in-sample and out-of-sample, mostly
- PC1 (profit/quality) and PC4 (value) are most predictable  
  > For PC1, profit and quality characteristics dominate (QMJ-type); for PC4, value characteristics dominate (HML-type)
- ML predictions enable market timing strategies  
  > Trading rule based on forecast hedges downturns (PC1) and recovers from downturns (PC4)

## Applications
- market-level hedging
- timing strategies

## References cited
- Vuolteenaho (2002)
- Haddad, Kozak & Santosh (RFS, 2020)
- Ilmanen Israel Lee Moskowitz Thapor (J of Investment Management, 2021)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/paul_laux.md`](../speakers/paul_laux.md)
- [`methods/random_forest.md`](../methods/random_forest.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

