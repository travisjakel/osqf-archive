---
type: Talk
title: "Twinkle, twinkle little STARSmooth Transition AR Models in R"
description: The twinkle package implements Smooth Transition ARMAX models in R for econometric analysis of regime-switching time series.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Alexios Ghalanos
speaker_slug: alexios_ghalanos
talk_type: Keynote
time_slot: "14:30 - 15:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/AlexiosGhalanos.pdf"
file_local: "./_cache/files/2014/2014__alexios_ghalanos.pdf"
slug: 2014__alexios_ghalanos
status: archived
tags: [osqf, 2014, alexios_ghalanos]
---

# Twinkle, twinkle little STARSmooth Transition AR Models in R

_2014 · Alexios Ghalanos_

**Headline:** The twinkle package implements Smooth Transition ARMAX models in R for econometric analysis of regime-switching time series.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/AlexiosGhalanos.pdf>
- Local: `./_cache/files/2014/2014__alexios_ghalanos.pdf`
- Talk type: Keynote
- Time slot: 14:30 - 15:20

## Topics
- Smooth Transition AR models
- twinkle package implementation
- regime-switching time series analysis
- STAR model applications

## Methods
- Smooth Transition ARMAX (STARMAX)
- Threshold Autoregressive (TAR)
- Gaussian Mixture extensions
- Maximum Likelihood estimation

## Datasets used
- forex data (quantmod)
- Dutch Gilder example

## Code & tools
- `twinkle`
- `rugarch`
- `quantmod`
- `xts`

## Key findings
- The twinkle package supports STAR models with AR, MA, and GARCH extensions  
  > D)(ST)(AR)(MA)(X) with static, mixture or GARCH variance
- STAR models use logistic/exponential transition functions  
  > F (zt−d ; γ, α, c) = 1 + exp −γ α0 zt−d − c
- Package includes specification, estimation, and forecasting methods  
  > Specification, Estimation, Filtering, Forecasting and Simulation
- Application to Dutch Gilder data shows state-dependent volatility  
  > s1.beta -0.22237, sigma 1.53464

## Applications
- Econometric modeling of regime-switching processes
- Financial time series analysis

## References cited
- Franses and van Dijk (2000)
- van Dijk and Franses (1999)
- Tong and Lim (1980)
- Kauppi and Saikkonen (2008)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/alexios_ghalanos.md`](../speakers/alexios_ghalanos.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

