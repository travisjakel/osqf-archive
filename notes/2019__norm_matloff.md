---
type: Talk
title: Extension of the Tower Method for Missing Values to Time Series
description: "Introduces toweranNA, a prediction-oriented R package for missing values using the Tower Method, which avoids imputation by leveraging complete cases and k-nearest neighbors."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Norm Matloff
speaker_slug: norm_matloff
talk_type: Talk
time_slot: "13:15 - 13:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/NormMatloff.pdf"
file_local: "./_cache/files/2019/2019__norm_matloff.pdf"
slug: 2019__norm_matloff
status: archived
tags: [osqf, 2019, norm_matloff]
---

# Extension of the Tower Method for Missing Values to Time Series

_2019 · Norm Matloff (University of California, Davis)_

**Headline:** Introduces toweranNA, a prediction-oriented R package for missing values using the Tower Method, which avoids imputation by leveraging complete cases and k-nearest neighbors.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/NormMatloff.pdf>
- Local: `./_cache/files/2019/2019__norm_matloff.pdf`
- Talk type: Talk
- Time slot: 13:15 - 13:35

## Topics
- missing values
- prediction-oriented methods
- Tower Method
- time series

## Methods
- Tower Method
- k-nearest neighbors
- regression models (linear, logit, nonparametric)

## Datasets used
- Census data (prgeng)
- WordBank
- UCI Bank
- World Values Study
- NH4 data (imputeTS)

## Code & tools
- R
- lm()
- glm()
- random forests
- neural nets
- `toweranNA`
- `imputeTS`

## Key findings
- Traditional MV methods focus on estimation via imputation, requiring strong assumptions like multivariate normality.  
  > • Almost all (all?) of the MV literature is on estimation, e.g. estimation of treatment effects.
- The Tower Method predicts E(Y|U) by averaging predictions from the full model over complete cases with similar U values.  
  > Eb(Y | U = s) = avg. Eb(Y | U = s, V ) over all complete cases with U = s
- Tower outperformed mice/Amelia in MAPE on WordBank (96.2 vs 102.7) and World Values Study (1.76 vs 1.83) with faster execution.  
  > Mean Absolute Prediction Errors: Amelia 102.7, Tower 96.2... Tower 1.7603, Mice 1.8270
- Time series adaptation (towerTS) achieved 1.37 MAPE vs 1.51 for na.ma on NH4 data.  
  > Mean Absolute Prediction Error: na.ma ... 1.51, towerTS ... 1.37

## Applications
- census data prediction
- vocabulary growth trajectory analysis
- financial data imputation

## References cited
- Matloff, Biometrika, 1981
- U. Müller, Annals of Stat., 2009
- Seaman, Stat. Sci., 2013

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/norm_matloff.md`](../speakers/norm_matloff.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/4)*

