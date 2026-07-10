---
type: Talk
title: Design and Analysis of (Backtest) Experiments
description: Applying Design of Experiments (DoE) methodology to optimize quantitative trading strategies by systematically testing parameter interactions and reducing overfitting risks.
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Brian Peterson
speaker_slug: brian_peterson
talk_type: Talk
time_slot: "09:40 - 10:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/BrianPeterson.pdf"
file_local: "./_cache/files/2023/2023__brian_peterson.pdf"
slug: 2023__brian_peterson
status: archived
tags: [osqf, 2023, brian_peterson]
---

# Design and Analysis of (Backtest) Experiments

_2023 · Brian Peterson_

**Headline:** Applying Design of Experiments (DoE) methodology to optimize quantitative trading strategies by systematically testing parameter interactions and reducing overfitting risks.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/BrianPeterson.pdf>
- Local: `./_cache/files/2023/2023__brian_peterson.pdf`
- Talk type: Talk
- Time slot: 09:40 - 10:00

## Topics
- backtest experiments
- Design of Experiments
- parameter optimization
- statistical methods in quantitative finance

## Methods
- screening designs
- full factorial designs
- fractional factorial designs
- Fedorov algorithm
- linear regression analysis
- Bonferroni correction
- Holm-Bonferroni method

## Datasets used
- ParamStats
- ParamStats.fap

## Code & tools
- lm (R)
- expand.grid (R)
- AlgDesign (R)
- quantstrat (R)
- apply.paramset() (R)

## Key findings
- Fedorov fractional factorial design reduced 110,000 parameter combinations to 80 valid sets while retaining 99.5% of degrees of freedom.  
  > Degrees of freedom report for strategy: constrained.Fedorov Total market observations: 52029 Degrees of freedom consumed by strategy: 257 Total degrees of freedom remaining: 51772 Pct. Degrees of Freedom: 99.51%
- Parameter interactions in Bollinger Band strategies showed mostly insignificant effects despite significant individual parameter impacts.  
  > we can also see that the parameter interactions are generally not significant
- Constrained Fedorov designs produced parameter combinations nearly as effective as brute-force methods but with 99.9% fewer trials.  
  > the 'optimal' parameter combinations from the Federov design are very close to the brute force design
- Linear regression on ParamStats showed standard deviation parameter had largest impact on net trading profit (coefficient -1,545.106)  
  > -1,545.106*** -9,629.542** -0.235*** -0.561

## Applications
- quantitative strategy optimization
- backtesting efficiency improvements
- overfitting mitigation

## References cited
- Harvey and Liu 2015
- Bailey and López de Prado 2014
- Viana 2016
- Overstall, Woods, and Adamou 2017

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/brian_peterson.md`](../speakers/brian_peterson.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

