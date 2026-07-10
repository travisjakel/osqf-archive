---
type: Talk
title: "DELPHI-BR: Data-driven Early-warning Learning-based system Prognosticating High-Impact Banking Risks"
description: Comparing logistic regression and machine learning models for predicting bank failures using diverse financial data
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Andrew Nguyen
speaker_slug: andrew_nguyen
talk_type: Talk
time_slot: "14:10 - 14:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/AndrewNguyen.pdf"
file_local: "./_cache/files/2019/2019__andrew_nguyen.pdf"
slug: 2019__andrew_nguyen
status: archived
tags: [osqf, 2019, andrew_nguyen, logistic_regression]
---

# DELPHI-BR: Data-driven Early-warning Learning-based system Prognosticating High-Impact Banking Risks

_2019 · Andrew Nguyen (Federal Reserve Board of Governors, Federal Reserve Bank of Chicago)_

**Headline:** Comparing logistic regression and machine learning models for predicting bank failures using diverse financial data

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/AndrewNguyen.pdf>
- Local: `./_cache/files/2019/2019__andrew_nguyen.pdf`
- Talk type: Talk
- Time slot: 14:10 - 14:30

## Topics
- bank failure forecasting
- machine learning model comparison
- model interpretability techniques

## Methods
- logistic regression
- random forests (RF)
- gradient boosting (GB)
- support vector machines (SVM)
- deep learning (DEEP)
- permutation importance
- partial dependence plots
- LIME

## Datasets used
*(none extracted)*

## Code & tools
- `parsnip`
- `keras`
- `lime`

## Key findings
- Logistic regression coefficients directly explain variable impacts, unlike non-linear models  
  > Really easy to explain - we always know β1 explains a one unit change in x1
- Random forests outperformed logistic regression in out-of-sample predictions  
  > We compare logistic regression vs machine learning models
- dms_lossprov_to_asset was the most important predictor (65 importance score)  
  > dms_lossprov_to_asset | 65
- LIME provides local explanations for neural network predictions  
  > Local Interpretable Model-Agnostic Explanations (LIME)

## Applications
- bank failure forecasting
- risk management

## References cited
*(none extracted)*

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/andrew_nguyen.md`](../speakers/andrew_nguyen.md)
- [`methods/logistic_regression.md`](../methods/logistic_regression.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

