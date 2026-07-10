---
type: Talk
title: Non-Myopic Equity Risk Premium
description: Proposed a non-myopic approach for predicting equity risk premium using reinforcement learning and equilibrium views
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Cheng Lu
speaker_slug: cheng_lu
talk_type: Talk
time_slot: "16:30 - 16:50"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/ChengLu.pdf"
file_local: "./_cache/files/2023/2023__cheng_lu.pdf"
slug: 2023__cheng_lu
status: archived
tags: [osqf, 2023, cheng_lu]
---

# Non-Myopic Equity Risk Premium

_2023 · Cheng Lu (Stevens Institute of Technology)_

**Headline:** Proposed a non-myopic approach for predicting equity risk premium using reinforcement learning and equilibrium views

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/ChengLu.pdf>
- Local: `./_cache/files/2023/2023__cheng_lu.pdf`
- Talk type: Talk
- Time slot: 16:30 - 16:50

## Topics
- equity premium prediction
- reinforcement learning
- portfolio optimization
- forecast combinations

## Methods
- Proximal Policy Optimization (PPO)
- mean-variance optimization
- exponential utility function
- PCA
- Markov Switching models (MSwM)

## Datasets used
- 15 macro finance & economic state variables (1945-2021) from Amit Goyal website

## Code & tools
- `Python`
- Gym (OpenAI)
- Stable Baselines 3
- R
- ReinforcementLearning (R package)
- MSwM (R package)

## Key findings
- Non-myopic RL-based forecasts outperform traditional methods in OOS R² and utility gain  
  > The OOS performance of non-myopic prediction beats most individual and combined forecast
- Reinforcement learning captures forward-looking equilibrium views  
  > Our method is forward-looking by the nature of reinforcement learning based portfolio
- Implied expected returns from MV-efficient portfolios improve forecast accuracy  
  > A linear relationship between µ and Σw is derived from the Eq13. (Ardia and Boudt, 2015)

## Applications
- portfolio management
- risk premium prediction

## References cited
- Black and Litterman (1992)
- Welch and Goyal (2008)
- Rapach et al. (2010)
- Sutton and Barto (2018)
- Ardia and Boudt (2015)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/cheng_lu.md`](../speakers/cheng_lu.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

