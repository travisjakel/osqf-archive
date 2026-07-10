---
type: Talk
title: Deep Partial Least Squares for Factor Modeling
description: Deep Partial Least Squares (DPLS) enhances factor modeling by integrating deep learning with PLS to capture non-linear relationships and outliers in asset returns.
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Matthew Dixon
speaker_slug: matthew_dixon
talk_type: Keynote
time_slot: "11:00 - 11:50"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/MatthewDixon.pdf"
file_local: "./_cache/files/2022/2022__matthew_dixon.pdf"
slug: 2022__matthew_dixon
status: archived
tags: [osqf, 2022, matthew_dixon, factor_modeling]
---

# Deep Partial Least Squares for Factor Modeling

_2022 · Matthew Dixon (R in Finance conference (no explicit institutional affiliation mentioned))_

**Headline:** Deep Partial Least Squares (DPLS) enhances factor modeling by integrating deep learning with PLS to capture non-linear relationships and outliers in asset returns.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/MatthewDixon.pdf>
- Local: `./_cache/files/2022/2022__matthew_dixon.pdf`
- Talk type: Keynote
- Time slot: 11:00 - 11:50

## Topics
- Factor modeling
- Deep learning
- PLS regression
- Non-Gaussian asset returns
- Risk management
- Portfolio optimization

## Methods
- Deep Partial Least Squares (DPLS)
- PLS regression
- Feedforward neural networks
- Shrinkage methods
- State-space models

## Datasets used
- Russell 1000 index
- Bloomberg factor exposures

## Code & tools
- R (code available on request)
- Feedforward neural networks

## Key findings
- DPLS outperforms LASSO and NN in capturing outliers, with L∞ error norms 2x smaller than LASSO.  
  > We observe the ability of the neural networks to capture outliers, with the L ∞ norm of the error in the NN and DPLS being 2x smaller than in the LASSO model.
- DPLS achieves lower average L∞ norms compared to NNs and OLS.  
  > The average L ∞ norms over all periods is shown in parenthesis and is smaller for DPLS than NNs.
- DPLS demonstrates composability under non-linear transformations, enabling universal SDF estimation.  
  > The strongly consistent estimator, ˆBPLS, is invariant under a non-linear function, G(·), s.t. u_j = G(β0j + v^T ∏_j), up to a constant of proportionality when v is Gaussian.

## Applications
- Asset management
- Portfolio optimization
- Risk premia estimation

## References cited
*(none extracted)*

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/matthew_dixon.md`](../speakers/matthew_dixon.md)
- [`topics/factor_modeling.md`](../topics/factor_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

