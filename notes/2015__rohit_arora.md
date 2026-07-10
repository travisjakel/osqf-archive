---
type: Talk
title: Inefficiency of Modified VaR and ES
description: "Analysis of the inefficiency of modified VaR and ES compared to standard parametric models, highlighting higher variance due to non-MLE estimation"
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Rohit Arora
speaker_slug: rohit_arora
talk_type: Lightning
time_slot: "14:40 - 15:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/RohitArora.pdf"
file_local: "./_cache/files/2015/2015__rohit_arora.pdf"
slug: 2015__rohit_arora
status: archived
tags: [osqf, 2015, rohit_arora, risk_management]
---

# Inefficiency of Modified VaR and ES

_2015 · Rohit Arora_

**Headline:** Analysis of the inefficiency of modified VaR and ES compared to standard parametric models, highlighting higher variance due to non-MLE estimation

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/RohitArora.pdf>
- Local: `./_cache/files/2015/2015__rohit_arora.pdf`
- Talk type: Lightning
- Time slot: 14:40 - 15:10

## Topics
- risk management
- statistical risk estimation
- modified VaR/ES inefficiency

## Methods
- Multivariate-Delta method
- asymptotic variance calculation
- Symbolic Toolbox in Matlab

## Datasets used
*(none extracted)*

## Code & tools
- Symbolic Toolbox in Matlab
- github.com/arorar/VarInModRisk

## Key findings
- Modified VaR/ES have higher variance than MLE estimators due to non-MLE formulation  
  > mVaR, mES are not MLE so their variance will be larger than the variance of MLE estimator
- Asymptotic variance depends on higher moments (skewness, kurtosis) and distribution parameters  
  > var [θ^−θ] = x^TΣ_θx, x=[1 C0 C1 C2 −C3]^T
- Normal distribution shows bias in modified risk measures but lower inefficiency than Student-t  
  > mVaR bias and efficiency for Normal distribution

## Applications
- portfolio risk assessment
- financial modeling

## References cited
- Boudt, Peterson, and Croux (2008)
- Serfling (1980)
- Zangari (1996)

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/rohit_arora.md`](../speakers/rohit_arora.md)
- [`topics/risk_management.md`](../topics/risk_management.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

