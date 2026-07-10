---
type: Talk
title: Technology Option Forecasting Ensemble Strategy
description: "The paper proposes an ensemble ML approach to forecast option prices using stock and volatility predictions, showing profitability even with transaction costs."
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Cyril De Lavergne
speaker_slug: cyril_de_lavergne
talk_type: Lightning
time_slot: "15:52 - 15:59"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/CyrilDeLavergne.pdf"
file_local: "./_cache/files/2023/2023__cyril_de_lavergne.pdf"
slug: 2023__cyril_de_lavergne
status: archived
tags: [osqf, 2023, cyril_de_lavergne]
---

# Technology Option Forecasting Ensemble Strategy

_2023 · Cyril De Lavergne (The Hong Kong University of Science and Technology)_

**Headline:** The paper proposes an ensemble ML approach to forecast option prices using stock and volatility predictions, showing profitability even with transaction costs.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/CyrilDeLavergne.pdf>
- Local: `./_cache/files/2023/2023__cyril_de_lavergne.pdf`
- Talk type: Lightning
- Time slot: 15:52 - 15:59

## Topics
- option forecasting
- ensemble machine learning
- volatility prediction
- technology stocks
- option pricing models
- trading strategies with transaction costs

## Methods
- Temporal Fusion Transformers (TFT)
- AutoGluon
- FLAML
- stacking models (linear, ridge, lasso)
- Black-Scholes model
- Barone-Adesi Whaley pricing engine
- kernel smoothing
- AutoML

## Datasets used
- WRDS OptionMetrics
- Bryan Kelly’s database
- FED Treasury rates

## Code & tools
- `RQuantLib`
- `Automunge`
- `FactorAnalytics`
- `AutoGluon`
- `FLAML`

## Key findings
- The strategy achieves 81% directional accuracy for 1-day forecasts using TFT volatility predictions.  
  > multi-step at-the-money volatility forecasting can almost reach 81% directional accuracy for a δt of 1
- Ensemble models outperform individual algorithms with 64% directional accuracy in stock returns.  
  > Monthly stock log returns forecast can also reach almost 64% directional accuracy with ensemble techniques
- The strategy generates 500% annualized returns with $10k capital using 6-day horizons.  
  > we obtain almost 500% per year with an initial capital of $10000 if we target an investment horizon 6 days
- TFT shows best performance for short-term forecasts (δt=1) with MSE=0.001.  
  > δt    MSE      Accuracy
1     0.001      80.67

## Applications
- options trading with slippage and liquidity risk mitigation

## References cited
- RQuantLib
- OptionMetrics
- Goyal and Saretto (2009)
- Jensen, Kelly, Pedersen (2021)
- Gatheral and Jaisson (2014)
- Ruf (2020)
- AutoGluon-Tabular
- Lima et al. (2020)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/cyril_de_lavergne.md`](../speakers/cyril_de_lavergne.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4)*

