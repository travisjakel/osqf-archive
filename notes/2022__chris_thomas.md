---
type: Talk
title: "Pricing Copper Better Than Bloomberg: Better than KOSPI Levels?"
description: "Chris Thomas presents a refined copper pricing model using commodity indices and macroeconomic factors, outperforming Bloomberg's KOSPI-based approach."
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Chris Thomas
speaker_slug: chris_thomas
talk_type: Talk
time_slot: "13:50 - 14:10"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/ChrisThomas.pptx"
file_local: "./_cache/files/2022/2022__chris_thomas.pptx"
slug: 2022__chris_thomas
status: archived
tags: [osqf, 2022, chris_thomas, linear_regression]
---

# Pricing Copper Better Than Bloomberg: Better than KOSPI Levels?

_2022 · Chris Thomas_

**Headline:** Chris Thomas presents a refined copper pricing model using commodity indices and macroeconomic factors, outperforming Bloomberg's KOSPI-based approach.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/ChrisThomas.pptx>
- Local: `./_cache/files/2022/2022__chris_thomas.pptx`
- Talk type: Talk
- Time slot: 13:50 - 14:10

## Topics
- commodity pricing models
- regression analysis
- macroeconomic factors in pricing
- model refinement techniques

## Methods
- linear regression
- index creation
- AR(1) process
- Ornstein-Uhlenbeck model
- macroeconomic variable integration

## Datasets used
- smallModel.xts (2009-04-01 to 2022-05-25)
- Bloomberg copper pricing data

## Code & tools
- R (linear models, xts package)
- R/Finance conference

## Key findings
- Bloomberg's copper pricing model lacks theoretical foundation, relying on KOSPI and EMCFPROX indices without justification.  
  > No real theory behind this... Grasping at straws: KOSPI has lots of industry/electronics
- A refined model using Aluminium, Rebar, and macroeconomic variables shows strong statistical significance (p<0.001) for key predictors.  
  > Estimate Std. Error t value Pr(>|t|)... 38.918 <2e-16 ***
- Residual analysis confirms model stationarity with no autocorrelation (p=0.440 for lagged residuals).  
  > No autocorrelations in the residuals - we have stationarity.
- Out-of-sample forecasts (2021-12-07 to 2022-05-25) demonstrate superior accuracy compared to Bloomberg's model.  
  > Our model is a far more accurate estimator... than the BBG model.

## Applications
- commodity price forecasting
- financial modeling
- risk management

## References cited
*(none extracted)*

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/chris_thomas.md`](../speakers/chris_thomas.md)
- [`methods/linear_regression.md`](../methods/linear_regression.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4), source=ocr(paddle)*

