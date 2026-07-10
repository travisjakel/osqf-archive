---
type: Talk
title: Refactoring Factor Analytics
description: The FactorAnalytics R package refactors fundamental factor models with improved standardization and scalability.
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Mido Shammaa
speaker_slug: mido_shammaa
talk_type: Lightning
time_slot: "15:50 - 15:56"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/MidoShammaa.pdf"
file_local: "./_cache/files/2019/2019__mido_shammaa.pdf"
slug: 2019__mido_shammaa
status: archived
tags: [osqf, 2019, mido_shammaa]
---

# Refactoring Factor Analytics

_2019 · Mido Shammaa (Charles Schwab & Co.)_

**Headline:** The FactorAnalytics R package refactors fundamental factor models with improved standardization and scalability.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/MidoShammaa.pdf>
- Local: `./_cache/files/2019/2019__mido_shammaa.pdf`
- Talk type: Lightning
- Time slot: 15:50 - 15:56

## Topics
- factor model refactoring
- return standardization
- exposure standardization
- factor model comparison

## Methods
- data.table
- rolling
- parallelization
- Ding-Martin 2017 model

## Datasets used
- 300 US stocks 1994-2015

## Code & tools
- `FactorAnalytics`
- `PerformanceAnalytics`
- `data.table`
- R

## Key findings
- New FFM uses data.table for faster implementation and unbalanced panels  
  > • Code for FFM refactored to use data.table for the purposes of: ₋ faster and cleaner implementation... unbalanced panels
- D&M 2017 model standardizes returns and exposures to unit variance  
  > rit  rit /  rit... 𝑟𝑖,𝑡 ~ 𝑁(0,1)
- New model shows higher IR_sim for BP and EBITDAEV factors  
  > BP New 300 0.018 0.127 0.31 0.14 0.13 0.86
- D&M model links IC to risk-adjusted returns via σrit scaling  
  > 𝛼𝑖,𝑡 = 𝑓𝑡 𝑧𝑖,𝑡−1 multiplied by 𝜎𝑟𝑖𝑡

## Applications
- factor model analysis
- risk management

## References cited
- Ding, Zhuanxin & Martin, R. Douglas, 2017. "The fundamental law of active management: Redux," Journal of Empirical Finance

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/mido_shammaa.md`](../speakers/mido_shammaa.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

