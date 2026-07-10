---
type: Talk
title: Conditional Autoregressive Value-at-Riskall flavors of CAViaR
description: Evaluation of 13 parametric CAViaR models for Value-at-Risk across 27 stock indices using Bootstrap resampling and MSE analysis
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Pedro Albuquergue
speaker_slug: pedro_albuquergue
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/PedroAlbuquerque.pdf"
file_local: "./_cache/files/2018/2018__pedro_albuquergue.pdf"
slug: 2018__pedro_albuquergue
status: archived
tags: [osqf, 2018, pedro_albuquergue]
---

# Conditional Autoregressive Value-at-Riskall flavors of CAViaR

_2018 · Pedro Albuquergue (University of Brasília)_

**Headline:** Evaluation of 13 parametric CAViaR models for Value-at-Risk across 27 stock indices using Bootstrap resampling and MSE analysis

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/PedroAlbuquerque.pdf>
- Local: `./_cache/files/2018/2018__pedro_albuquergue.pdf`
- Talk type: Lightning

## Topics
- Value-at-Risk modeling
- CAViaR models
- Bootstrap resampling
- Risk management

## Methods
- Bootstrap resampling (Politis and Romano, 1994)
- parametric CAViaR models
- MSE evaluation
- training/validation dataset splitting

## Datasets used
- 27 stock indices (specific tickers not named)

## Code & tools
*(none extracted)*

## Key findings
- Adaptive model showed smallest MSE in 23/27 assets when no prior information is available  
  > Our findings pointed out the Adaptive model should be chosen when no prior information is available, since it presented the smallest MSE in 23 of 27 assets.
- Empirical golden rule provided for CAViaR structure selection  
  > We provided an empirical golden rule for choosing the CAViaR structure: CAViaRt (β) = CAViaRt −1 (β1 )+β1 {[1+exp(G [Yt −1 −CAViaRt −1 (β]
- MSE measure evaluated model consistency in-sample and out-of-sample  
  > The MSE measure is then used to evaluate the model with respect to its consistency in-sample and out-sample.

## Applications
- risk management

## References cited
- Politis and Romano, 1994

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/pedro_albuquergue.md`](../speakers/pedro_albuquergue.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

