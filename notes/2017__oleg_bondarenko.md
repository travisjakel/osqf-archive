---
type: Talk
title: Rearrangement Algorithm and Maximum Entropy
description: "The talk presents the Block Rearrangement Algorithm (BRA) for inferring dependence among variables given marginal distributions and the distribution of their sum, showing its stability and connection to maximum entropy principles."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Oleg Bondarenko
speaker_slug: oleg_bondarenko
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/OlegBondarenko.pdf"
file_local: "./_cache/files/2017/2017__oleg_bondarenko.pdf"
slug: 2017__oleg_bondarenko
status: archived
tags: [osqf, 2017, oleg_bondarenko]
---

# Rearrangement Algorithm and Maximum Entropy

_2017 · Oleg Bondarenko (University of Illinois at Chicago)_

**Headline:** The talk presents the Block Rearrangement Algorithm (BRA) for inferring dependence among variables given marginal distributions and the distribution of their sum, showing its stability and connection to maximum entropy principles.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/OlegBondarenko.pdf>
- Local: `./_cache/files/2017/2017__oleg_bondarenko.pdf`
- Talk type: Lightning

## Topics
- dependence inference
- maximum entropy
- rearrangement algorithms
- multivariate options pricing
- risk management

## Methods
- Block Rearrangement Algorithm (BRA)
- standard Rearrangement Algorithm (RA)
- maximum determinant optimization
- simulation exercises with Gaussian margins

## Datasets used
*(none extracted)*

## Code & tools
*(none extracted)*

## Key findings
- BRA solutions exhibit maximum entropy and are stable across different initial conditions.  
  > BRA yields solutions that are close to each other and exhibit maximum entropy.
- BRA converges to maximum entropy solutions even when starting from noisy initial conditions.  
  > K = 500 runs of BRA converge to the maximal correlation matrix RM.
- BRA outperforms standard RA in stability and accuracy for non-Gaussian distributions.  
  > Robust to non-Gaussian distributions (e.g., Multivariate Skewed-t). Does not hold for the standard RA.
- BRA's inferred correlations closely match maximum entropy solutions in simulations.  
  > For each k the inferred dependence is close to the one with the maximum entropy

## Applications
- Pricing multivariate options (basket, exchange, spread)
- Forward-looking indicators of implied dependence
- Tail risk measures
- Down and Up implied correlation
- Optimal portfolios

## References cited
- Breeden and Litzenberger (1978)
- Puccetti and Rüschendorf (2012)
- Embrechts, Puccetti, and Rüschendorf (2013)
- Bernard and McLeish (2014)
- Bernard, Rüschendorf, and Vanduffel (2014)
- Shannon (1948)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/oleg_bondarenko.md`](../speakers/oleg_bondarenko.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4)*

