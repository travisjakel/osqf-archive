---
type: Talk
title: Identifying Recessions in Real-Time Using Time-Freq. Functional Models
description: Time-frequency functional models for identifying and predicting economic recessions in real-time using NASDAQ data and macroeconomic indicators
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: David Matteson
speaker_slug: david_matteson
talk_type: Talk
time_slot: "10:09 - 10:29"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/DavidMatteson.pdf"
file_local: "./_cache/files/2014/2014__david_matteson.pdf"
slug: 2014__david_matteson
status: archived
tags: [osqf, 2014, david_matteson]
---

# Identifying Recessions in Real-Time Using Time-Freq. Functional Models

_2014 · David Matteson (Cornell University)_

**Headline:** Time-frequency functional models for identifying and predicting economic recessions in real-time using NASDAQ data and macroeconomic indicators

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/DavidMatteson.pdf>
- Local: `./_cache/files/2014/2014__david_matteson.pdf`
- Talk type: Talk
- Time slot: 10:09 - 10:29

## Topics
- time-frequency analysis
- economic recession prediction
- Bayesian modeling
- dimension reduction
- EOFs/Karhunen-Loeve
- SSVS variable selection

## Methods
- short-time Fourier transform (STFT)
- Karhunen-Loeve expansion (EOFs)
- Stochastic Search Variable Selection (SSVS)
- Bayesian probit model
- mixed data frequency (MIDAS) modeling

## Datasets used
- NASDAQ index daily log returns
- FFR (federal funds rate)
- CPI (consumer price index)
- UNEMP (unemployment rate)
- GDP (gross domestic product)
- GDI (gross domestic income)
- IP (industrial production)
- SPREAD (Treasury yield spread)

## Code & tools
- R (e1071 package)
- R (RSEIS package)

## Key findings
- First 40 EOFs explain 95% of spectrogram variation  
  > first 10 EOFs & 40 EOFs explained 85% & 95% variation
- SSVS identified T-F covariates as recession predictors  
  > Which remaining EOFs are useful in identifying & predicting periods of recession
- Model with T-F covariates achieved 92.66% AUROC for nowcasting  
  > M5: ... AUROC .9266
- Macroeconomic indicators alone had 97.43% AUROC for nowcasting  
  > M1: ... AUROC .9743

## Applications
- recession identification
- economic forecasting
- real-time policy monitoring

## References cited
- Holan et al. (2012)
- George and McCulloch (1993, 1997)
- Albert and Chib (1993)
- Papoulis (1965)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/david_matteson.md`](../speakers/david_matteson.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

