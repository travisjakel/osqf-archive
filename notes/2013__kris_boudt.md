---
type: Talk
title: Regime Switches in Volatility and Correlation of Financial Institutions
description: The talk presents regime-switching models for volatility and correlation in financial institutions using score-based dynamics and macro-financial variables.
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Talk
time_slot: "16:05 - 16:25"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/KrisBoudt.pdf"
file_local: "./_cache/files/2013/2013__kris_boudt.pdf"
slug: 2013__kris_boudt
status: archived
tags: [osqf, 2013, kris_boudt, regime_switching_models]
---

# Regime Switches in Volatility and Correlation of Financial Institutions

_2013 · Kris Boudt_

**Headline:** The talk presents regime-switching models for volatility and correlation in financial institutions using score-based dynamics and macro-financial variables.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/KrisBoudt.pdf>
- Local: `./_cache/files/2013/2013__kris_boudt.pdf`
- Talk type: Talk
- Time slot: 16:05 - 16:25

## Topics
- regime-switching models
- volatility forecasting
- correlation dynamics
- financial stability
- GAS/DySco models

## Methods
- GAS/DySco models
- Student t distribution
- Markov process for regime transitions
- score-based parameter updates
- equicorrelation assumption

## Datasets used
- 15 largest U.S. deposit banks (1994–2011)

## Code & tools
- `fGarch`
- `rugarch`
- R

## Key findings
- Standard GARCH models fail during regime transitions due to reliance on squared returns alone.  
  > X   Powerful technique, but using the squared demeaned return as the unique driver... has several drawbacks.
- Fat-tailed distributions downweight extreme returns' impact on volatility.  
  > X   ...fat-tailed distribution and hence avoids the overstatement of volatility after a once-off extreme return.
- Regime transition probabilities are linked to macro-financial variables like VIX and TED spread.  
  > X   Specify them as a function of macro-financial variables: VIX, TED spread...

## Applications
- financial stability analysis
- risk management
- regulatory modeling

## References cited
- Engle (1982)
- Bollerslev (1986)
- Haas et al (2004)
- Creal, Koopman, Lucas (2012)
- Harvey and Chakravarty (2008)
- Danielsson and Shin (2003)

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)
- [`topics/regime_switching_models.md`](../topics/regime_switching_models.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

