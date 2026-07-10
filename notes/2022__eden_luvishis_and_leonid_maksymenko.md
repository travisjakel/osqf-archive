---
type: Talk
title: Financial Applications of Linear Risk Management via Non-linear Machine Learning
description: "The talk explores using nonlinear machine learning to enhance linear risk management, addressing limitations of traditional models through explainable AI techniques."
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Eden Luvishis and Leonid Maksymenko
speaker_slug: eden_luvishis_and_leonid_maksymenko
talk_type: Talk
time_slot: "10:55 - 11:15"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/LuvishisMaksymenkoSimaan.pdf"
file_local: "./_cache/files/2022/2022__eden_luvishis_and_leonid_maksymenko.pdf"
slug: 2022__eden_luvishis_and_leonid_maksymenko
status: archived
tags: [osqf, 2022, eden_luvishis_and_leonid_maksymenko, financial_risk_management]
---

# Financial Applications of Linear Risk Management via Non-linear Machine Learning

_2022 · Eden Luvishis and Leonid Maksymenko (Stevens Institute of Technology)_

**Headline:** The talk explores using nonlinear machine learning to enhance linear risk management, addressing limitations of traditional models through explainable AI techniques.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/LuvishisMaksymenkoSimaan.pdf>
- Local: `./_cache/files/2022/2022__eden_luvishis_and_leonid_maksymenko.pdf`
- Talk type: Talk
- Time slot: 10:55 - 11:15

## Topics
- financial risk management
- optimal hedge ratio
- nonlinear machine learning
- explainable AI (XAI)
- model comparison

## Methods
- Accumulated Local Effects (ALE) plots
- partial dependence plots (PDP)
- simulation studies
- cross-validation

## Datasets used
- CRSP daily/weekly/monthly returns (specific timeframes not detailed in the text, but mentioned in the slide as 'rollRegres stock monthly returns on market excess return using 36 months window')

## Code & tools
- ALEPlot (R package)
- R (language)

## Key findings
- Higher-order exposure (coskewness) introduces systematic bias in traditional linear hedge ratios.  
  > The optimal hedge ratio from N ∗ = σs,f / σf2 is biased when higher-order exposure is present
- Nonlinear models outperform linear ones on significantly nonlinear data but underperform with cubic relationships.  
  > Nonlinear hedging excels on significantly nonlinear data... The linear model also outperforms the nonlinear when there is cubic relationship
- Complex models increase hedging variance due to higher degrees of freedom and ALE coefficient extraction errors.  
  > Tradeoff with using more complex models: Larger hedging variance... Extraction of coefficients using ALEPlot could introduce some error
- Linear models are preferable for assets with slight nonlinearity or linearity.  
  > Assets with slightly nonlinear or linear relationships are best hedged with linear model

## Applications
- financial risk management
- hedging strategies

## References cited
- Apley & Zhu (2020)
- Fama & French (1993)
- Ghosh (1993)
- Harvey & Siddique (2000)
- Khashanah, Simaan & Simaan (2021)
- Molnar (2020)

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/eden_luvishis_and_leonid_maksymenko.md`](../speakers/eden_luvishis_and_leonid_maksymenko.md)
- [`topics/financial_risk_management.md`](../topics/financial_risk_management.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4)*

