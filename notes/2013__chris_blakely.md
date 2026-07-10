---
type: Talk
title: "Realizing the Future with C, Java, and RA Multi-Language High-Frequency Volatility Modeling Environment"
description: "A multi-language environment combining R, C, and Java for high-frequency volatility modeling using HEAVY models and realized measures"
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Chris Blakely
speaker_slug: chris_blakely
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/ChrisBlakely.pdf"
file_local: "./_cache/files/2013/2013__chris_blakely.pdf"
slug: 2013__chris_blakely
status: archived
tags: [osqf, 2013, chris_blakely]
---

# Realizing the Future with C, Java, and RA Multi-Language High-Frequency Volatility Modeling Environment

_2013 · Chris Blakely_

**Headline:** A multi-language environment combining R, C, and Java for high-frequency volatility modeling using HEAVY models and realized measures

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/ChrisBlakely.pdf>
- Local: `./_cache/files/2013/2013__chris_blakely.pdf`
- Talk type: Lightning

## Topics
- high-frequency volatility modeling
- HEAVY models
- multi-language computing environments
- Bayesian estimation
- GUI development for financial models

## Methods
- HEAVY model (Shephard and Sheppard, 2009)
- realized variance calculation (RM_t = ∑(X_tj - X_tj-1)^2)
- Bayesian and quasi-likelihood estimation (GNU C with GSL)
- model-based bootstrapping for forecasting

## Datasets used
*(none extracted)*

## Code & tools
- R (highfrequency package)
- C (GNU C with GSL)
- Java (Java Swing)
- heavyModel package

## Key findings
- The environment combines R, C, and Java for an easy-to-use interface  
  > The environment GUI meshes the strengths of R, C, and Java to create an easy-to-use and fast interface.
- HEAVY model equations include close-to-close variance and open-to-close variation components  
  > Var(r_t | F_HF_t-1) = h_t = ω_1 + α RM_t-1 + β h_t-1 + λ r_t^2; F(RM_t | F_HF_t-1) = μ_t = ω_2 + α_R RM_t-1 + β_R μ_t-1
- Forecasting uses s-step ahead iteration with matrix B = [[β, λ], [0, β_R + α_R]]  
  > Forecasting distributions... done using a model-based bootstrapping method.
- Java Swing provides a non-coding graphical interface for modeling  
  > Java wrapper and GUI using Java Swing by Oracle for purely graphical and 'non-coding' interface for modeling

## Applications
- asset allocation
- risk assessment

## References cited
- Shephard and Sheppard (2009)
- K. Boudt et al. (highfrequency package)

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/chris_blakely.md`](../speakers/chris_blakely.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

