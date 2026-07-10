---
type: Talk
title: Predicting Cryptocurrencies Time-Series
description: "The talk presents a method for predicting cryptocurrency time series using the eDMA R package, comparing models like DMA and DMS to improve forecasting accuracy."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Leopoldo Catania
speaker_slug: leopoldo_catania
talk_type: Talk
time_slot: "09:55 - 10:15"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/LeopoldoCantania.pdf"
file_local: "./_cache/files/2018/2018__leopoldo_catania.pdf"
slug: 2018__leopoldo_catania
status: archived
tags: [osqf, 2018, leopoldo_catania]
---

# Predicting Cryptocurrencies Time-Series

_2018 · Leopoldo Catania (Aarhus BSS and CREATES)_

**Headline:** The talk presents a method for predicting cryptocurrency time series using the eDMA R package, comparing models like DMA and DMS to improve forecasting accuracy.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/LeopoldoCantania.pdf>
- Local: `./_cache/files/2018/2018__leopoldo_catania.pdf`
- Talk type: Talk
- Time slot: 09:55 - 10:15

## Topics
- cryptocurrency forecasting
- dynamic model averaging
- econometric modeling
- R package applications

## Methods
- Dynamic Linear Models (DLM)
- Dynamic Model Averaging (DMA)
- Dynamic Model Selection (DMS)
- Kalman Filter
- parallel computing with OpenMP

## Datasets used
- BTC (Bitcoin)
- ETH (Ethereum)
- XRP (Ripple)
- LTC (Litecoin)
- CDS 5y (Europe credit default swap index)
- ES 600 (Stoxx Europe 600)
- GLD (Gold Bullion)
- NK 225 (Nikkei 225)
- SP 500 (S&P 500)
- SV (Silver)
- BD 1m (US Treasury 1-Month)
- BD 10y (US Treasury 10-Year)
- VIX (Volatility Index)

## Code & tools
- eDMA (R package)
- `Rcpp`
- `RcppArmadillo`
- `OpenMP`
- Armadillo (C++ library)

## Key findings
- Combining univariate models via DMA improves point forecasting accuracy for cryptocurrencies.  
  > We find statistical significant improvements in point forecasting when using combinations of univariate models.
- The eDMA package achieves significant computational speedups over existing implementations.  
  > Table: Ratio of computation time between the dma() function... eDMA package using different values of T and n.
- Posterior inclusion probabilities reveal time-varying predictor relevance in cryptocurrency forecasting.  
  > Figure: Posterior inclusion probabilities of the predictors using simulated data.

## Applications
- asset allocation
- risk management
- derivative pricing

## References cited
- Catania, Grassi, and Ravazzolo (2018)
- Catania and Nonejad (2018)
- Raftery et al. (2010)
- Dangl and Halling (2012)
- West and Harrison (1999)
- Stock and Watson (1999)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/leopoldo_catania.md`](../speakers/leopoldo_catania.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

