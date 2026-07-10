---
type: Talk
title: Calibrating Parsimonious Models Of Equity-Linked Default Intensity
description: Calibrating models for equity-linked default intensity to improve convertible bond pricing and address limitations in existing libraries like QuantLib.
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Brian Boonstra
speaker_slug: brian_boonstra
talk_type: Talk
time_slot: "11:20 - 11:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/BrianBoonstra.pdf"
file_local: "./_cache/files/2016/2016__brian_boonstra.pdf"
slug: 2016__brian_boonstra
status: archived
tags: [osqf, 2016, brian_boonstra]
---

# Calibrating Parsimonious Models Of Equity-Linked Default Intensity

_2016 · Brian Boonstra_

**Headline:** Calibrating models for equity-linked default intensity to improve convertible bond pricing and address limitations in existing libraries like QuantLib.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/BrianBoonstra.pdf>
- Local: `./_cache/files/2016/2016__brian_boonstra.pdf`
- Talk type: Talk
- Time slot: 11:20 - 11:40

## Topics
- convertible bond pricing
- equity-linked default intensity models
- financial model calibration
- QuantLib limitations

## Methods
- 2D stochastic process with Black-Scholes and bankruptcy jump components
- Feynman-Kac PDE conversion
- implicit finite difference scheme with Neumann conditions
- calibration via implied volatility penalties

## Datasets used
- TSLAMarket (custom dataset with equity options and convertible bond data)

## Code & tools
- R
- `devtools`
- ragtop package
- `QuantLib`

## Key findings
- QuantLib lacks equity-linked default intensity and modern convertible bond models.  
  > No equity-linked default intensity... 1980s era mixed discounting
- A 2D stochastic process links equity levels to default intensity.  
  > dSt = (r(t) + h(St , t) − q(t))dt + (t)dZ − dJ(h(St , t))
- Calibration uses implied volatility penalties for regularization.  
  > Penalties computed on implied volatilities, to regularize
- Tesla's convertible bonds demonstrate model applicability.  
  > March 1, 2019 Bond 88160RAB7... 0.25% Coupon

## Applications
- pricing American/European options with fixed dividends
- correcting volatility skew via default intensity
- extending to new path-independent payoffs
- simultaneous volatility/default intensity calibration

## References cited
*(none extracted)*

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/brian_boonstra.md`](../speakers/brian_boonstra.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4)*

