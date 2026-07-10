---
type: Talk
title: Bayesian Inference and Volatility Modeling Using Stan
description: Tutorial on using Stan for Bayesian inference and volatility modeling in finance
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: "M. Weylandt, L. Damiano"
speaker_slug: m_weylandt_and_l_damiano
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/WeylandtDamianoSeminar.pdf"
file_local: "./_cache/files/2019/2019__m_weylandt_and_l_damiano.pdf"
slug: 2019__m_weylandt_and_l_damiano
status: archived
tags: [osqf, 2019, m_weylandt_and_l_damiano, bayesian_inference]
---

# Bayesian Inference and Volatility Modeling Using Stan

_2019 · M. Weylandt, L. Damiano (Iowa State University (Luis Damiano), Rice University (Michael Weylandt))_

**Headline:** Tutorial on using Stan for Bayesian inference and volatility modeling in finance

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/WeylandtDamianoSeminar.pdf>
- Local: `./_cache/files/2019/2019__m_weylandt_and_l_damiano.pdf`
- Talk type: Tutorial

## Topics
- Bayesian inference
- volatility modeling
- GARCH models
- Stan probabilistic programming

## Methods
- Stan language blocks (data/parameters/model/transformed parameters)
- Bayesian workflow
- GARCH(1,1) model implementation
- posterior predictive checks

## Datasets used
- SPY daily log-returns (1993-01-01 to 2019-05-18)

## Code & tools
- `rstan`
- `quantmod`
- `xtsPlots`
- Stan language
- R

## Key findings
- Stan's data block requires explicit array sizing with int<lower=1> T;  
  > data {
    // No automatically sized arrays: must pass sizes as int<lower=1> T;
    vector[T] r;
- Transformed parameters block enables volatility persistence modeling via AR(1) dynamics  
  > transformed parameters {
    vector<lower=0>[T] sigma;
    sigma[1] = sigma1;
- GARCH models use fewer parameters than SV models while maintaining volatility clustering  
  > GARCH type models ... determine a whole series of σ²ᵗ ⇌ use transformed parameters block
- Posterior predictive checks showed 89-97% coverage of true parameters in validation  
  > 95% posterior intervals ... contain the true value in the 89, 97, 93 percent of samples

## Applications
- volatility forecasting
- risk management

## References cited
- Stan manual
- Kastner 2016
- Kim et al. 1998
- Bollerslev 1986
- Engle 1982

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/m_weylandt_and_l_damiano.md`](../speakers/m_weylandt_and_l_damiano.md)
- [`topics/bayesian_inference.md`](../topics/bayesian_inference.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4), source=ocr(paddle)*

