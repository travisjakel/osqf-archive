---
type: Talk
title: "Statistics for Financial Engineering: Some Examples"
description: "The talk discusses statistical methods in financial engineering with a focus on nonlinear regression, default probability estimation, and the Box-Cox transformation, using R for implementation."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: David Ruppert
speaker_slug: david_ruppert
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/StatAndFinance.pdf"
file_local: "./_cache/files/2009/2009__david_ruppert.pdf"
slug: 2009__david_ruppert
status: archived
tags: [osqf, 2009, david_ruppert, nonlinear_regression]
---

# Statistics for Financial Engineering: Some Examples

_2009 · David Ruppert (Cornell University)_

**Headline:** The talk discusses statistical methods in financial engineering with a focus on nonlinear regression, default probability estimation, and the Box-Cox transformation, using R for implementation.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/StatAndFinance.pdf>
- Local: `./_cache/files/2009/2009__david_ruppert.pdf`

## Topics
- nonlinear regression
- default probabilities
- data transformations
- dynamic models
- GARCH models
- Bayesian estimation

## Methods
- nonlinear regression
- Box-Cox transformation
- TBS (Transform-both-sides) model
- maximum likelihood estimation

## Datasets used
- default frequency data
- interest rate data

## Code & tools
- R

## Key findings
- TBS model with λ=1/2 outperforms traditional methods in default probability estimation  
  > λ = 1/2 works well for this example
- Textbook method underestimates default probabilities compared to TBS  
  > TEXTBOOK est 100% vs TBS 16%
- Box-Cox transformation family enables variance stabilization  
  > h(y, λ) becomes a stronger concave transformation as λ decreases from 1
- Residual analysis reveals non-normality in nonlinear regression  
  > absolute residual QQ plot shows non-normality

## Applications
- credit risk modeling
- financial data analysis

## References cited
- Carroll and Ruppert (1984, 1988)
- Box and Cox (1964)

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/david_ruppert.md`](../speakers/david_ruppert.md)
- [`topics/nonlinear_regression.md`](../topics/nonlinear_regression.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4)*

