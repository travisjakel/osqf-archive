---
type: Talk
title: Package backpack for Fast Backtest Simulations of Trading Strategies
description: "The talk presents the 'backpack' R package for fast backtest simulations of trading strategies using C++ via RcppArmadillo, with applications to portfolio optimization and rolling aggregations."
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Jerzy Pawlowski
speaker_slug: jerzy_pawlowski
talk_type: Talk
time_slot: "14:37 - 14:57"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/JerzyPawlowski.pdf"
file_local: "./_cache/files/2022/2022__jerzy_pawlowski.pdf"
slug: 2022__jerzy_pawlowski
status: archived
tags: [osqf, 2022, jerzy_pawlowski, portfolio_optimization]
---

# Package backpack for Fast Backtest Simulations of Trading Strategies

_2022 · Jerzy Pawlowski (NYU Tandon School of Engineering)_

**Headline:** The talk presents the 'backpack' R package for fast backtest simulations of trading strategies using C++ via RcppArmadillo, with applications to portfolio optimization and rolling aggregations.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/JerzyPawlowski.pdf>
- Local: `./_cache/files/2022/2022__jerzy_pawlowski.pdf`
- Talk type: Talk
- Time slot: 14:37 - 14:57

## Topics
- portfolio optimization
- backtest simulations
- rolling aggregations
- C++ optimization
- Markowitz portfolio
- dimension reduction

## Methods
- Markowitz portfolio
- minimum variance portfolio
- elastic net regularization
- dimension reduction
- return shrinkage
- RcppArmadillo matrix algebra
- rolling window calculations

## Datasets used
- sp500_returns.RData

## Code & tools
- `RcppArmadillo`
- `RcppParallel`
- `roll`
- `RcppRoll`
- `matrixStats`
- `quantmod`
- `zoo`
- `xts`
- `dygraphs`
- `microbenchmark`
- `MASS`
- `HighFreq`

## Key findings
- RcppArmadillo functions can be 100x faster than R's apply() loops for rolling calculations  
  > The roll functions can be 100 times faster than apply() loops!
- Markowitz portfolios are prone to overfitting due to singular covariance matrices  
  > The Markowitz formula is a noise amplification scheme
- Dimension reduction improves out-of-sample performance by regularizing covariance matrix inversion  
  > The out-of-sample performance... greatly improved by dimension reduction
- Return shrinkage (α=0.81) significantly improves portfolio stability  
  > The best return shrinkage parameter... α = 0.81

## Applications
- portfolio optimization
- backtest simulations
- risk management

## References cited
- MarkowitzR package discussion
- Victor DeMiguel et al. research on regularization

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/jerzy_pawlowski.md`](../speakers/jerzy_pawlowski.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

