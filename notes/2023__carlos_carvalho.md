---
type: Talk
title: Bayesian Time Series
description: "Predicting the cross section of firm returns using characteristics and Bayesian machine learning methods like BART, with a focus on variable selection and interpreting nonlinearities."
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Carlos Carvalho
speaker_slug: carlos_carvalho
talk_type: Keynote
time_slot: "11:00 - 11:50"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/CarlosCarvalho.pdf"
file_local: "./_cache/files/2023/2023__carlos_carvalho.pdf"
slug: 2023__carlos_carvalho
status: archived
tags: [osqf, 2023, carlos_carvalho, predictive_modeling, bayesian_additive_regression_trees_bart]
---

# Bayesian Time Series

_2023 · Carlos Carvalho (Texas, ASU, Dartmouth, Stanford)_

**Headline:** Predicting the cross section of firm returns using characteristics and Bayesian machine learning methods like BART, with a focus on variable selection and interpreting nonlinearities.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/CarlosCarvalho.pdf>
- Local: `./_cache/files/2023/2023__carlos_carvalho.pdf`
- Talk type: Keynote
- Time slot: 11:00 - 11:50

## Topics
- predictive modeling
- variable selection
- nonlinear interactions
- Bayesian machine learning
- financial returns forecasting

## Methods
- Bayesian Additive Regression Trees (BART)
- Random Forests
- linear regression
- GAM (Generalized Additive Models)
- forward/backward variable selection

## Datasets used
- Monthly firm returns and characteristics (1963-2020)

## Code & tools
- `BART`
- Random Forests
- linear models
- `GAM`

## Key findings
- BART achieves predictive accuracy comparable to neural networks while enabling interpretability through variable selection.  
  > Our results achieve a very similar accuracy level
- Top predictors include market equity, momentum, idiosyncratic volatility, and seasonality.  
  > Our variable selection results will lead us to focus on these 10.
- Nonlinearities exist in 'dusty corners' of predictor space, e.g., high returns linked to low prior returns + high volatility.  
  > they both have ln_turn ≥ .82 and big ‡vol !!
- Linear models underpredict low returns more than high returns.  
  > Note the asymmetry: Linear misses the low more than the high.

## Applications
- asset pricing
- portfolio management
- financial risk modeling

## References cited
- JASA (2015)
- JCGS (2021)
- 2022 BART paper

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/carlos_carvalho.md`](../speakers/carlos_carvalho.md)
- [`topics/predictive_modeling.md`](../topics/predictive_modeling.md)
- [`methods/bayesian_additive_regression_trees_bart.md`](../methods/bayesian_additive_regression_trees_bart.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

