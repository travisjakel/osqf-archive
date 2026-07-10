---
type: Talk
title: Integrating Forecasting and Machine Learning in the mlr Framework
description: The talk demonstrates integrating forecasting and machine learning in the mlr framework using Apple stock data.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Stephen Bronder
speaker_slug: stephen_bronder
talk_type: Lightning
time_slot: "09:05 - 09:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/StephenBronder.pdf"
file_local: "./_cache/files/2017/2017__stephen_bronder.pdf"
slug: 2017__stephen_bronder
status: archived
tags: [osqf, 2017, stephen_bronder, forecasting]
---

# Integrating Forecasting and Machine Learning in the mlr Framework

_2017 · Stephen Bronder_

**Headline:** The talk demonstrates integrating forecasting and machine learning in the mlr framework using Apple stock data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/StephenBronder.pdf>
- Local: `./_cache/files/2017/2017__stephen_bronder.pdf`
- Talk type: Lightning
- Time slot: 09:05 - 09:35

## Topics
- forecasting
- machine learning
- model tuning
- mlr framework

## Methods
- GARCH model
- AR(p,d) pre-processing
- growing window cross-validation
- parameter tuning
- parallel processing

## Datasets used
- Weekly Percent Change in Apple Closing Price (Training: 1980-12-19 to 2017-03-29, Holdout: 2017-03-30 to 2017-04-20)

## Code & tools
- `mlr`
- `parallelMap`
- `mlrMBO`
- R
- `ranger`

## Key findings
- Tuned GARCH model achieved MASE 0.0999 and RMSE 0.0094 on Apple stock forecasts  
  > mase
rmse
0.099914625  0.009431966
- mlr framework unifies forecasting and machine learning workflows  
  > We have a unified framework for forecasting and machine learning
- Parameter tuning improved forecast accuracy over untuned models  
  > Tuned Vs. Untuned
Prediction Vs. Truth

## Applications
*(none extracted)*

## References cited
*(none extracted)*

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/stephen_bronder.md`](../speakers/stephen_bronder.md)
- [`topics/forecasting.md`](../topics/forecasting.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

