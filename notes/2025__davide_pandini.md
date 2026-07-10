---
type: Talk
title: "From Regression to Neural Networks: Evaluating AI Models for Real-World Financial Trading Strategies"
description: "The talk evaluates AI models for real-world financial trading strategies, comparing regression and neural networks."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Davide Pandini
speaker_slug: davide_pandini
talk_type: Talk
time_slot: "11:10 - 11:30"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/DavidePandini.pdf"
file_local: "./_cache/files/2025/2025__davide_pandini.pdf"
slug: 2025__davide_pandini
status: archived
tags: [osqf, 2025, davide_pandini]
---

# From Regression to Neural Networks: Evaluating AI Models for Real-World Financial Trading Strategies

_2025 · Davide Pandini_

**Headline:** The talk evaluates AI models for real-world financial trading strategies, comparing regression and neural networks.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/DavidePandini.pdf>
- Local: `./_cache/files/2025/2025__davide_pandini.pdf`
- Talk type: Talk
- Time slot: 11:10 - 11:30

## Topics
- AI models in trading
- regression vs neural networks
- backtesting
- feature selection
- model performance
- practical trading strategies

## Methods
- Selection by Filtering (SBF)
- Recursive Feature Elimination (RFE)
- LASSO Regression
- Principal Component Analysis (PCA)
- Multiple Linear Regression (MLR)
- XGBoost
- Support Vector Machine (SVM)
- Artificial Neural Network (ANN)
- Deep Neural Network (DNN)

## Datasets used
- S&P 500 (SPY) historical data from Jan 1997 to Aug 2024
- Backtesting training range: 1997-2017
- Backtesting testing range: 2018-2020

## Code & tools
- `caret`
- `corrplot`
- `forecast`
- `kernlab`
- `neuralnet`
- `PerformanceAnalytics`
- `quantmod`
- `tseries`
- `xgboost`
- `writexl`
- `car`
- `ggplot2`

## Key findings
- MLR achieved comparable forecasting accuracy to advanced AI models with significantly lower runtime.  
  > The traditional Multiple Linear Regression (MLR) model achieved comparable levels of forecasting accuracy to the more advanced AI-driven models, but with a much lower runtime
- SBF outperformed PCA in forecasting accuracy when multicollinearity was low.  
  > Selection by Filtering (SBF) yields better or comparable forecasting accuracy than Principal Component Analysis (PCA) in the training range
- MLR's trading performance matched deep learning models in returns and Sharpe ratio while minimizing risk.  
  > MLR, being stable, might not overfit, thus giving consistent signals, whereas more complex models could occasionally predict spurious reversals

## Applications
- backtesting trading strategies
- evaluating AI models for financial trading

## References cited
- Jarque-Bera test
- Box-Jenkins methods
- Robert F. Engle (ARCH models)

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/davide_pandini.md`](../speakers/davide_pandini.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

