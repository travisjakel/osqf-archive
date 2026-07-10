---
type: Talk
title: Nearest Comoment Estimation with Unobserved Factors and Linear Shrinkage
description: "Estimating higher-order portfolio moments (coskewness, cokurtosis) using linear shrinkage and factor models to improve risk management and portfolio optimization."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Dries Cornilly
speaker_slug: dries_cornilly
talk_type: Talk
time_slot: "14:50 - 15:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DriesCornilly.pdf"
file_local: "./_cache/files/2017/2017__dries_cornilly.pdf"
slug: 2017__dries_cornilly
status: archived
tags: [osqf, 2017, dries_cornilly, higher_order_moments]
---

# Nearest Comoment Estimation with Unobserved Factors and Linear Shrinkage

_2017 · Dries Cornilly (VUB, KU Leuven)_

**Headline:** Estimating higher-order portfolio moments (coskewness, cokurtosis) using linear shrinkage and factor models to improve risk management and portfolio optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DriesCornilly.pdf>
- Local: `./_cache/files/2017/2017__dries_cornilly.pdf`
- Talk type: Talk
- Time slot: 14:50 - 15:10

## Topics
- higher order moments
- portfolio optimization
- risk management
- linear shrinkage
- factor models

## Methods
- sample estimators for coskewness/cokurtosis
- linear shrinkage (Ledoit-Wolf)
- nearest comoment estimation with unobserved factors

## Datasets used
*(none extracted)*

## Code & tools
- `PerformanceAnalytics`
- `RcppArmadillo`

## Key findings
- Sample estimators for coskewness/cokurtosis matrices have large computational and statistical inefficiencies.  
  > Issues: computational, statistical
- Linear shrinkage reduces mean squared error by optimally combining sample and structured estimators.  
  > Improved shrinkage estimation... lower MSE, optimized target matrices
- Nearest comoment estimation extends factor models to unobserved factors via matrix decomposition.  
  > Factors are unobserved: nearest comoment estimation... (2017b)

## Applications
- risk budgets for portfolio optimization
- identifying variance/skewness hotspots
- computational efficiency improvements

## References cited
- Boudt, Cornilly, Verdonck (2017a)
- Boudt, Lu, Peeters (2015)
- Ledoit, Wolf (2003)
- Martellini, Ziemann (2010)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/dries_cornilly.md`](../speakers/dries_cornilly.md)
- [`topics/higher_order_moments.md`](../topics/higher_order_moments.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

