---
type: Talk
title: Evaluating Hedge Funds with Machine Learning-Based Benchmarks
description: This paper evaluates hedge funds using machine learning-based benchmarks to address limitations of traditional linear models in capturing nonlinear strategy payoffs and fund-specific risk exposures.
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Tengjia Shu
speaker_slug: tengjia_shu
talk_type: Talk
time_slot: "14:00 - 14:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/TengjiaShu.pdf"
file_local: "./_cache/files/2024/2024__tengjia_shu.pdf"
slug: 2024__tengjia_shu
status: archived
tags: [osqf, 2024, tengjia_shu]
---

# Evaluating Hedge Funds with Machine Learning-Based Benchmarks

_2024 · Tengjia Shu (University of Illinois Chicago; University of Iowa)_

**Headline:** This paper evaluates hedge funds using machine learning-based benchmarks to address limitations of traditional linear models in capturing nonlinear strategy payoffs and fund-specific risk exposures.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/TengjiaShu.pdf>
- Local: `./_cache/files/2024/2024__tengjia_shu.pdf`
- Talk type: Talk
- Time slot: 14:00 - 14:20

## Topics
- hedge fund evaluation
- machine learning benchmarks
- performance attribution
- risk modeling

## Methods
- Elastic Net (ENet) regression
- Elastic Net with nonlinear factors (ENet*)
- Random Forest (RF)
- Bayesian Additive Regression Trees (BART)
- penalized linear regression
- proxy model for beta estimation

## Datasets used
- Lipper TASS Hedge Fund Database (4,202 funds, 1994-2021)
- 7 factors from Fung-Hsieh (2004) model: MKT, SMB, D10YR, DSPRD, PTFSBD, PTFSFX, PTFSCOM
- 12 tradable liquid futures: SP 500, SP 400, U S10Y, FTSE100, NK225, USDIndex, British Pound, Swiss Franc, Japanese Yen, Gold, Corn, WTI

## Code & tools
- Elastic Net
- Random Forest
- `BART`
- OLS regression

## Key findings
- ML benchmarks (ENet*, BART) achieve significantly higher R² than Fung-Hsieh (2004) model for both zero-R² and nonzero-R² funds.  
  > Panel A – R2: Zero R2 Funds: FH 0.165 vs Enet* 0.416; Nonzero R2 Funds: FH 0.378 vs BART 0.544
- ML models improve Sharpe ratios and downside risk measures for real hedge funds.  
  > Real hedge funds: higher Sharpe ratios; improved downside risk measures
- BART and ENet* outperform traditional models in predicting fund failures using proportional hazards models.  
  > Superior fund failure prediction (based on a proportional hazards model)

## Applications
- hedge fund performance evaluation
- risk management
- fund selection strategies
- failure prediction

## References cited
- Fung-Hsieh (2004)
- Bollen (2013)
- Carhart model

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/tengjia_shu.md`](../speakers/tengjia_shu.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

