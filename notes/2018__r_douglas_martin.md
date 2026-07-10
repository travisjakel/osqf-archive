---
type: Talk
title: Tutorial on Robust Statistics in Quantitative Finance
description: "Tutorial on robust statistical methods for quantitative finance, focusing on M-estimators, MM-estimators, and applications in regression, multivariate analysis, and portfolio management."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: R. Douglas Martin
speaker_slug: r_douglas_martin
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DouglasMartin.pdf"
file_local: "./_cache/files/2018/2018__r_douglas_martin.pdf"
slug: 2018__r_douglas_martin
status: archived
tags: [osqf, 2018, r_douglas_martin, robust_statistics, m_estimators]
---

# Tutorial on Robust Statistics in Quantitative Finance

_2018 · R. Douglas Martin (University of Washington)_

**Headline:** Tutorial on robust statistical methods for quantitative finance, focusing on M-estimators, MM-estimators, and applications in regression, multivariate analysis, and portfolio management.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DouglasMartin.pdf>
- Local: `./_cache/files/2018/2018__r_douglas_martin.pdf`
- Talk type: Tutorial

## Topics
- robust statistics
- regression analysis
- multivariate analysis
- portfolio management
- outlier detection
- financial econometrics

## Methods
- M-estimators
- MM-estimators
- DCML estimators
- Tukey-Huber model
- robust covariance matrix estimation
- iterative weighted least squares

## Datasets used
*(none extracted)*

## Code & tools
- `RobStatTM`
- R
- `devtools`
- `lmrobdetMM`
- `lmrobdetDCML`
- `MultiRobu`
- `fit.models`

## Key findings
- Robust regression (e.g., MM-estimators) outperforms classical LS in fitting bulk data and handling outliers, as shown in the INVENSYS EPS example.  
  > The ROBUST line fits bulk of data well by down-weighting the 2-D outliers, and provides a good predictor of EPS
- The RobStatTM R package implements advanced robust estimators like lmrobdetMM and lmrobdetDCML with 99% normal efficiency.  
  > RobStatTM uses a very reliable iterated weighted least squares (iterated weighted average) algorithm
- Trimmed means fail for skewed distributions, while redescending psi functions in M-estimators handle outliers effectively in asset pricing.  
  > robust location estimators with redescending psi have little problem with that
- DCML estimators achieve asymptotic full efficiency while constraining distance from initial robust estimates.  
  > DCML estimator was shown by Maronna & Yohai (2014) to be asymptotically fully efficient
- Robust methods reversed conclusions in Fama-French 1992, showing positive size-return relationship and significant beta.  
  > Reversed several conclusions of Fama-French 1992 (FF92), including equity returns positively related to firm size

## Applications
- asset pricing research
- portfolio outlier detection
- risk management
- empirical finance
- factor models

## References cited
- Robust Statistics: Theory and Methods (2018) by Maronna et al.
- Green and Martin (2017) 'Fama-French Redux with Robust Regression'

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/r_douglas_martin.md`](../speakers/r_douglas_martin.md)
- [`topics/robust_statistics.md`](../topics/robust_statistics.md)
- [`methods/m_estimators.md`](../methods/m_estimators.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

