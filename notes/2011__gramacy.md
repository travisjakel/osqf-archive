---
type: Talk
title: Shrinkage Regression for Multivariate Inference with missing data
description: "The talk presents shrinkage regression methods for multivariate inference with missing data, applied to portfolio balancing."
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Gramacy
speaker_slug: gramacy
talk_type: Talk
time_slot: "09:50 - 10:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/RobertGramacy.pdf"
file_local: "./_cache/files/2011/2011__gramacy.pdf"
slug: 2011__gramacy
status: archived
tags: [osqf, 2011, gramacy]
---

# Shrinkage Regression for Multivariate Inference with missing data

_2011 · Gramacy (Booth School of Business, The University of Chicago)_

**Headline:** The talk presents shrinkage regression methods for multivariate inference with missing data, applied to portfolio balancing.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/RobertGramacy.pdf>
- Local: `./_cache/files/2011/2011__gramacy.pdf`
- Talk type: Talk
- Time slot: 09:50 - 10:10

## Topics
- shrinkage regression
- multivariate inference
- missing data
- portfolio balancing

## Methods
- OLS regressions
- Bayesian approach with non-informative priors
- posterior predictive distribution
- ridge regression
- lasso
- NG (normal-gamma) shrinkage

## Datasets used
- NYSE & AMEX data from 1968–1997
- cement data (Little & Rubin, 2002)

## Code & tools
- R
- `monomvn`
- `lars`
- `pls`

## Key findings
- MLE under MVN assumption can be obtained via OLS regressions  
  > Easy to get MLE under MVN assumption (Andersen 1957) MLEs of θj = (µj , Σ1:j,j ), j = 2, . . . , m may be obtained via OLS regressions
- Bayesian approach uses non-informative prior for µ, Σ  
  > E.g., the popular non–informative prior p(µ, Σ) ∝ |Σ|−( m+1 2 ) ⇒ p(βj , σj ) ∝ (σj ) 2 −( m+1 −m+j ) 2
- Methods fail when rank(Yj ) = j ≥ nj (big p small n problem)  
  > rank(Yj ) = j ≥ nj , precluding (Yj> Yj )−1 called a “big p small n” problem
- Shrinkage methods improve Sharpe ratios vs OLS  
  > Bayesian method E{Σ|Y} Σ(t+1) Ridge 0.549 0.554 Ridge + Factor 0.562 0.571
- monomvn R package implements the methods  
  > monomvn is made available as an R package Within R do: R> install.packages(c("monomvn","lars","pls"))

## Applications
- portfolio balancing
- risk management

## References cited
- Andersen 1957
- Little & Rubin, 2002
- Polson & Tew, 2000
- Stambaugh, 1997
- Zellner & Chetty, 1965
- Klein & Bawa, 1976

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/gramacy.md`](../speakers/gramacy.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

