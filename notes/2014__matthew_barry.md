---
type: Talk
title: Package pboProbability of Backtest Overfitting
description: Introduces R package pbo to compute probability of backtest overfitting and assess out-of-sample performance degradation
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Matthew Barry
speaker_slug: matthew_barry
talk_type: Talk
time_slot: "14:10 - 14:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MatthewBarry.pdf"
file_local: "./_cache/files/2014/2014__matthew_barry.pdf"
slug: 2014__matthew_barry
status: archived
tags: [osqf, 2014, matthew_barry]
---

# Package pboProbability of Backtest Overfitting

_2014 · Matthew Barry (Slipstream Advisors LLC)_

**Headline:** Introduces R package pbo to compute probability of backtest overfitting and assess out-of-sample performance degradation

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MatthewBarry.pdf>
- Local: `./_cache/files/2014/2014__matthew_barry.pdf`
- Talk type: Talk
- Time slot: 14:10 - 14:30

## Topics
- backtest overfitting
- overfitting prevention
- stochastic dominance
- R package development

## Methods
- probability of backtest overfitting (PBO) calculation
- performance degradation analysis
- stochastic dominance testing
- cross-sectional shrinkage (CSCV) algorithm

## Datasets used
*(none extracted)*

## Code & tools
- R
- `foreach`
- `doParallel`
- `lattice`
- `PerformanceAnalytics`
- `xts`
- `zoo`
- `devtools`
- `mapply`
- `combn`
- `rank`

## Key findings
- PBO is defined as Prob[Rn* < Me[R]] where Rn* is optimal in-sample strategy performance  
  > PBO ≡ Prob [Rn* < Me[R] ]
- CSCV algorithm uses cross-sectional shrinkage to estimate overfitting  
  > CSCV ALGORITHM
- Parallel computation reduces runtime by 6.85x compared to sequential  
  > elapsed relative 1 2091.530 6.85 2 305.342 1.00

## Applications
*(none extracted)*

## References cited
- BAILEY ET AL., "PSEUDO-MATHEMATICS AND FINANCIAL CHARLATANISM: THE EFFECTS OF BACKTEST OVERFITTING ON OUT-OF-SAMPLE PERFORMANCE"
- BAILEY AND LÓPEZ DE PRADO, "HOW TO SPOT BACKTEST OVERFITTING"
- BAILEY ET AL., "THE PROBABILITY OF BACKTEST OVERFITTING"

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/matthew_barry.md`](../speakers/matthew_barry.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

