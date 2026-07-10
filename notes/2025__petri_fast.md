---
type: Talk
title: Build a Better Elastic Net Forecast With Custom Penalties
description: Enhancing elastic net forecasts using contribution limits to prevent over-reliance on individual features in financial prediction models
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Petri Fast
speaker_slug: petri_fast
talk_type: Talk
time_slot: "13:50 - 14:10"
file_format: pptx
file_url: "https://www.osqf.org/archive/2025/PetriFast.pptx"
file_local: "./_cache/files/2025/2025__petri_fast.pptx"
slug: 2025__petri_fast
status: archived
tags: [osqf, 2025, petri_fast]
---

# Build a Better Elastic Net Forecast With Custom Penalties

_2025 · Petri Fast (Hull Tactical Funds)_

**Headline:** Enhancing elastic net forecasts using contribution limits to prevent over-reliance on individual features in financial prediction models

## Source
- File format: `pptx`
- URL: <https://www.osqf.org/archive/2025/PetriFast.pptx>
- Local: `./_cache/files/2025/2025__petri_fast.pptx`
- Talk type: Talk
- Time slot: 13:50 - 14:10

## Topics
- Elastic Net Regression
- Contribution Constraints in Machine Learning
- Custom Penalties in Forecasting
- Financial Time Series Prediction

## Methods
- Elastic Net (L1 + L2 regularization)
- Contribution Constraint Formulation
- Gradient Descent Optimization

## Datasets used
- SPY ETF 2019-2024 (fundamental variables, VIX transforms, sentiment, price dynamics)

## Code & tools
- SSRN (paper repository)

## Key findings
- Contribution limits prevent overexposure to individual features through soft constraints  
  > scale · |βiXi(t)| ≤ L for all i,t.
- Soft constraints balance regularization and contribution limits via dual parameters  
  > Parameters: : Controls overall regularization strength; : Controls enforcement strength of concentration limits
- Capped models show improved risk-adjusted returns vs uncapped elastic net  
  > 2019 - 2024 performance of capped vs uncapped model?
- Custom penalties enable diversification while maintaining predictive power  
  > Can we limit contribution per feature? Why? Diversification

## Applications
- Financial forecasting (excess equity risk premium prediction)
- Portfolio diversification strategies

## References cited
- Zou, Hui; Hastie, Trevor (2005). "Regularization and Variable Selection via the Elastic Net".
- James, Paulson, and Rusmevichientong (2019), 'Penalized and Constrained Optimization'
- Gaines, Kim, and Hua Zhou (2018), 'Algorithms for Fitting the Constrained Lasso'

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/petri_fast.md`](../speakers/petri_fast.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

