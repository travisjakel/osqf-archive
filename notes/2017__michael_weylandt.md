---
type: Talk
title: Convex Optimization for High-Dimensional Portfolio Construction
description: "This talk explains how convex optimization techniques, particularly Lasso and its variants, can be applied to high-dimensional portfolio construction problems with constraints like sparsity and diversification."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Michael Weylandt
speaker_slug: michael_weylandt
talk_type: Lightning
time_slot: "11:05 - 11:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MichaelWeylandt.pdf"
file_local: "./_cache/files/2017/2017__michael_weylandt.pdf"
slug: 2017__michael_weylandt
status: archived
tags: [osqf, 2017, michael_weylandt, portfolio_optimization]
---

# Convex Optimization for High-Dimensional Portfolio Construction

_2017 · Michael Weylandt (Rice University)_

**Headline:** This talk explains how convex optimization techniques, particularly Lasso and its variants, can be applied to high-dimensional portfolio construction problems with constraints like sparsity and diversification.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MichaelWeylandt.pdf>
- Local: `./_cache/files/2017/2017__michael_weylandt.pdf`
- Talk type: Lightning
- Time slot: 11:05 - 11:35

## Topics
- portfolio optimization
- convex optimization
- sparsity
- statistical learning
- constrained optimization

## Methods
- Markowitz problem
- Ordinary Least Squares (OLS)
- Lasso
- Group Lasso
- Exclusive Lasso

## Datasets used
*(none extracted)*

## Code & tools
- `glmnet`

## Key findings
- The Markowitz portfolio optimization problem can be reformulated as an OLS regression problem.  
  > arg min ||(1 n λ/2) - R w||2 2 ⇔ arg min ||y - X β||2 2
- Constrained portfolio optimization (e.g., limiting to K assets) is NP-hard but can be approximated using Lasso techniques.  
  > NP-HARD... arg min w ∈ R P : || w || 0 ≤ K || (1 n λ / 2) - R w || 2 2
- Lasso promotes sparsity through 'sharp corners' in the optimization landscape.  
  > 'Sharp corners' give sparsity [CRPW12]

## Applications
- portfolio construction
- risk management

## References cited
- [BDM+09]
- [BKM16]
- [CA15]
- [Cha13]
- [CRPW12]
- [FHT10]
- [GR04]
- [HTF09]
- [HTW15]
- [JOV09]
- [JWHT13]
- [Tib96]
- [Tib15]
- [YL06]
- [ZHT07]
- [ZJH10]

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/michael_weylandt.md`](../speakers/michael_weylandt.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

