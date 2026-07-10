---
type: Talk
title: Information Ratio Maximizing Fundamental Factor Models
description: "This talk presents a revised Fundamental Law of Active Management that improves IR estimation by accounting for IC variability, validated across eight factors and 2000+ stocks."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Doug Martin
speaker_slug: doug_martin
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/DougMartin.pdf"
file_local: "./_cache/files/2016/2016__doug_martin.pdf"
slug: 2016__doug_martin
status: archived
tags: [osqf, 2016, doug_martin]
---

# Information Ratio Maximizing Fundamental Factor Models

_2016 · Doug Martin (University of Washington)_

**Headline:** This talk presents a revised Fundamental Law of Active Management that improves IR estimation by accounting for IC variability, validated across eight factors and 2000+ stocks.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/DougMartin.pdf>
- Local: `./_cache/files/2016/2016__doug_martin.pdf`
- Talk type: Lightning

## Topics
- Information Ratio Maximization
- Fundamental Factor Models
- Active Portfolio Management
- Empirical Validation of Financial Models

## Methods
- Quadratic utility analytic solution with active weights constraint
- Residual returns as input for portfolio optimization

## Datasets used
- Russell 3000 (1979-01 to 2010-06)
- B/P (Book to price ratio 1979-01 to 2010-06)
- C/P (Cash flow to price ratio 1990-02 to 2010-06)
- D/P (Dividend yield 1979-01 to 2010-06)
- E/P (Earnings-to-price ratio 1979-01 to 2010-06)
- FE/P (Forward earnings-to-price ratio 1979-01 to 2010-06)
- S/P (Sales-to-price ratio 1979-01 to 2010-06)
- MOM (Cumulative 11-month return 1979-01 to 2010-06)
- SHORT (Short as a percent of total shares floating 1988-01 to 2010-06)

## Code & tools
*(none extracted)*

## Key findings
- The revised Fundamental Law accounts for IC variability with IR = √(1 - μ²_IC - σ²_IC)/N + σ²_IC  
  > IR = √(1 - μ 2 IC - σ 2 IC ) / N + σ 2 IC → μ IC σ IC (large N)
- NEW model shows 37-55% higher IR than ISM model for all factors  
  > B/P NEW IR ∞ 0.394 vs ISM 0.193; SHORT NEW IR ∞ 0.555 vs ISM 0.480
- Empirical study confirms NEW model's IR estimates are 2-3x closer to simulated values than G&K formula  
  > IR sim for B/P NEW 0.395 vs ISM 0.162; FE/P NEW 0.430 vs ISM 0.188

## Applications
- Active portfolio management
- Factor model optimization

## References cited
- Grinold (1989, 2000)
- Ding and Martin (2015) ssrn.com/abstract=2730434

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/doug_martin.md`](../speakers/doug_martin.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

