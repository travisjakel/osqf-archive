---
type: Talk
title: Inference on the asset with maximal Sharpe ratio
description: "Statistical inference on the asset with the highest Sharpe ratio, addressing multiple hypothesis testing and conditional estimation challenges."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Steven Pav
speaker_slug: steven_pav
talk_type: Lightning
time_slot: "17:40 - 17:46"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/StevenPav.pdf"
file_local: "./_cache/files/2019/2019__steven_pav.pdf"
slug: 2019__steven_pav
status: archived
tags: [osqf, 2019, steven_pav, bonferroni_correction]
---

# Inference on the asset with maximal Sharpe ratio

_2019 · Steven Pav_

**Headline:** Statistical inference on the asset with the highest Sharpe ratio, addressing multiple hypothesis testing and conditional estimation challenges.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/StevenPav.pdf>
- Local: `./_cache/files/2019/2019__steven_pav.pdf`
- Talk type: Lightning
- Time slot: 17:40 - 17:46

## Topics
- Sharpe ratio inference
- multiple hypothesis testing
- conditional estimation
- financial statistics
- simulation studies

## Methods
- Bonferroni correction
- beta correction
- conditional inference with Lee et al.'s approach
- Monte Carlo simulations

## Datasets used
*(none extracted)*

## Code & tools
- R
- `SharpeR`
- `mvtnorm`

## Key findings
- Backtesting 1000 strategies and selecting the highest Sharpe ratio asset leads to overfitting.  
  > A cariacature of quant work: 1 Backtest 1000 strategies. 2 Trade the strategy with maximal Sharpe ratio.
- Conditional inference using Lee et al.'s method improves power by considering return correlations.  
  > Use results of Lee et al. [1], to perform conditional inference on η ⊥ y, with y ∼ N (μ, Σ) conditional on Ay ≤ b.
- Simulations show theoretical estimation outperforms MHT corrections in power.  
  > Simvals <- replicate(2500, { X <- mvtnorm::rmvnorm(...) max(colMeans(X)/apply(X, 2, sd)) })

## Applications
*(none extracted)*

## References cited
- Lee et al. (2013)
- López de Prado & Bailey (2018)
- Pav (2017)

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/steven_pav.md`](../speakers/steven_pav.md)
- [`methods/bonferroni_correction.md`](../methods/bonferroni_correction.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

