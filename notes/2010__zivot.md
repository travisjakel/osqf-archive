---
type: Talk
title: Simulation-based Estimation of Continuous Time Models
description: Estimating continuous time diffusion models using indirect inference and simulation-based methods in R
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Zivot
speaker_slug: zivot
talk_type: Talk
time_slot: "15:30 - 16:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/EricZivot.pdf"
file_local: "./_cache/files/2010/2010__zivot.pdf"
slug: 2010__zivot
status: archived
tags: [osqf, 2010, zivot]
---

# Simulation-based Estimation of Continuous Time Models

_2010 · Zivot (University of Washington)_

**Headline:** Estimating continuous time diffusion models using indirect inference and simulation-based methods in R

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/EricZivot.pdf>
- Local: `./_cache/files/2010/2010__zivot.pdf`
- Talk type: Talk
- Time slot: 15:30 - 16:00

## Topics
- continuous time models
- estimation techniques
- financial econometrics
- simulation-based methods

## Methods
- Indirect Inference (II)
- Efficient Method of Moments (EMM)
- Maximum Likelihood Estimation (MLE)
- Quasi-Maximum Likelihood Estimation (QMLE)
- GMM

## Datasets used
*(none extracted)*

## Code & tools
- R
- sde package
- optim() function
- EULERloglik() function

## Key findings
- Indirect Inference corrects bias in QMLE for continuous time models  
  > Indirect Inference - Corrects bias in QMLE - focus of talk
- EMM shows smaller bias and MSE in MA models compared to QMLE  
  > Smaller bias and MSE in MA models (Ghysels, Khalaf and Vodounou, 2003)
- Simulation-based II estimators (IL, IM, IA) outperform QMLE in finite samples  
  > Rejection frequencies... EN1 EL1 EA1... 0.767 0.760 0.728

## Applications
- term structure estimation
- financial time series modeling

## References cited
- Duffee and Stanton (2008)
- Gallant and Tauchen (1996)
- Gourieroux and Monfort (1996)
- Lo (1988)
- Phillips and Yu (2009)

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/zivot.md`](../speakers/zivot.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

