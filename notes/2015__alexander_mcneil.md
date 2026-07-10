---
type: Talk
title: R Tools for Understanding Credit Risk Modelling
description: "Presentation on using R tools for credit risk modeling, covering Markov chains, Merton's model, distance-to-default calculations, and portfolio loss distributions with FFT."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Alexander McNeil
speaker_slug: alexander_mcneil
talk_type: Keynote
time_slot: "15:10 - 16:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/AlexanderMcNeil.pdf"
file_local: "./_cache/files/2015/2015__alexander_mcneil.pdf"
slug: 2015__alexander_mcneil
status: archived
tags: [osqf, 2015, alexander_mcneil, credit_risk_modeling]
---

# R Tools for Understanding Credit Risk Modelling

_2015 · Alexander McNeil (Heriot-Watt University, Edinburgh)_

**Headline:** Presentation on using R tools for credit risk modeling, covering Markov chains, Merton's model, distance-to-default calculations, and portfolio loss distributions with FFT.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/AlexanderMcNeil.pdf>
- Local: `./_cache/files/2015/2015__alexander_mcneil.pdf`
- Talk type: Keynote
- Time slot: 15:10 - 16:00

## Topics
- credit risk modeling
- Markov chains for rating migrations
- Merton's model
- distance-to-default calculations
- portfolio loss distributions
- statistical estimation of credit risk models

## Methods
- matrix exponential for transition probability estimation
- Black-Scholes formula for equity/debt pricing
- FFT-based portfolio loss distribution computation
- generalized linear mixed models (GLMM) for default data calibration

## Datasets used
- RatingEvents (20-year rating migration data)

## Code & tools
- R
- Matrix package
- sde package
- glmer (lme4)

## Key findings
- Markov chain generator matrix estimation uses maximum likelihood with transition counts and time-at-risk denominators  
  > The denominator represents the total time spent in state j by all the companies in the dataset. This is in fact the maximum likelihood estimator.
- Merton model simulations show equity value as a call option on asset value  
  > The value of equity at T equals the pay-off of a European call option on V_T with exercise price equal to B.
- Portfolio loss distributions via FFT enable efficient computation of aggregate default probabilities  
  > The Laplace-Stieltjes transform is useful for: sampling losses from model with importance sampling; approximating probability mass function using Fourier transform.
- GLMM calibration of credit models reveals rating-specific default parameters  
  > Fixed Effects: ratingA ratingBBB ratingBB ratingB ratingCCC -3.4318 -2.9185 -2.4039 -1.6895 -0.8378

## Applications
- credit risk modeling
- portfolio loss estimation
- default probability calibration

## References cited
- McNeil, Frey, Embrechts (2005) QRM book
- Lando and Skodeberg (2002) rating transitions paper
- Crosbie and Bohn (2002) default risk modeling
- Sun et al (2012) EDF methodology

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/alexander_mcneil.md`](../speakers/alexander_mcneil.md)
- [`topics/credit_risk_modeling.md`](../topics/credit_risk_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

