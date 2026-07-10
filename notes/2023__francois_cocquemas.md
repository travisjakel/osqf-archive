---
type: Talk
title: Deep Implied Volatility Surfaces
description: Using deep learning with torch for R to construct implied volatility surfaces from high-speed option data
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Francois Cocquemas
speaker_slug: francois_cocquemas
talk_type: Talk
time_slot: "10:00 - 10:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/FrancoisCocquemas.pdf"
file_local: "./_cache/files/2023/2023__francois_cocquemas.pdf"
slug: 2023__francois_cocquemas
status: archived
tags: [osqf, 2023, francois_cocquemas]
---

# Deep Implied Volatility Surfaces

_2023 · Francois Cocquemas_

**Headline:** Using deep learning with torch for R to construct implied volatility surfaces from high-speed option data

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/FrancoisCocquemas.pdf>
- Local: `./_cache/files/2023/2023__francois_cocquemas.pdf`
- Talk type: Talk
- Time slot: 10:00 - 10:20

## Topics
- implied volatility surfaces
- deep learning
- torch for R
- no-arbitrage conditions
- neural network optimization

## Methods
- feedforward neural network with ReLU activation
- Adam optimizer
- learning rate scheduler (step decay)
- Lipschitz continuity regularization
- batch normalization

## Datasets used
- intraday SPX options data (3.8m observations, 20 dates, 5-minute intervals)

## Code & tools
- torch for R
- `data.table`
- CUDA 11.7
- torchvision (heatmap approach)

## Key findings
- Neural network achieved 0.01195 training RMSE and 0.01207 testing RMSE for IV prediction  
  > Training RMSE: 0.01195; Testing RMSE: 0.01207
- Simple feedforward network with 3 hidden layers (dim=36) achieved good performance  
  > Feedforward net with three fully-connected layers with ReLU activation. Dimensions...
- Convexity constraints require curve-level training rather than point-wise approaches  
  > Treat each curve as an object... impose penalties for convexity

## Applications
*(none extracted)*

## References cited
- Carr and Madan (2005)
- Fengler (2008)
- Roper (2010)
- Gouk et al. (2021)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/francois_cocquemas.md`](../speakers/francois_cocquemas.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

