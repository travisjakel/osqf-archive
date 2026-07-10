---
type: Talk
title: "Portfolio Performance Attribution: A Machine Learning Based Approach"
description: Using machine learning to automate portfolio performance attribution by optimizing factor selection and categorical variable cutoffs.
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Ryan Brown
speaker_slug: ryan_brown
talk_type: Talk
time_slot: "14:57 - 15:17"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/RyanBrown.pptx"
file_local: "./_cache/files/2022/2022__ryan_brown.pptx"
slug: 2022__ryan_brown
status: archived
tags: [osqf, 2022, ryan_brown]
---

# Portfolio Performance Attribution: A Machine Learning Based Approach

_2022 · Ryan Brown (US Portfolio Manager, Quantitative Equity, Allspring Global Investments)_

**Headline:** Using machine learning to automate portfolio performance attribution by optimizing factor selection and categorical variable cutoffs.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/RyanBrown.pptx>
- Local: `./_cache/files/2022/2022__ryan_brown.pptx`
- Talk type: Talk
- Time slot: 14:57 - 15:17

## Topics
- portfolio performance attribution
- machine learning in finance
- Brinson model
- factor selection
- quantitative portfolio management

## Methods
- tree-based machine learning
- Classification and Regression Tree (CART) approach
- Brinson decomposition
- linear algebra optimization

## Datasets used
- Russell 1000 universe (2010-2019)
- MSCI Minimum Volatility USA Index
- Fama-French composite factor

## Code & tools
- R functions: Equity.brinsonDecomp, Equity.brinsonTreeresult, Equity.brinsonWideRanked, Equity.brinsonBruteforceHelper, Equity.brinsonBruteforce
- MASS::ginv

## Key findings
- ML-based attribution explains 99% of active return variability for multivariate cases vs. 82.7% for traditional Brinson.  
  > Multivariate ML attribution consistently explains more portfolio performance than univariate ML. Table 1: Allocation Effect as Percent of Active Risk for Equally Weighted Russell 1000... Multivariate 99.0%
- Market cap is the most important variable for equal-weighted portfolios, while B/M dominates value indices.  
  > As expected, market capitalization is the most important variable in multivariate incarnations of ML attribution for the Equal-Weighted Russell 1000, on average.
- ML approach outperforms standard Brinson even for complex strategies like MSCI Min Vol.  
  > This methodology explains significantly more return performance than standard Brinson, and has merit even when applied to complex non-linear investment strategies such as MSCI Min Vol.

## Applications
- portfolio performance analysis
- quantitative investment strategy evaluation
- factor-based asset allocation

## References cited
- Machine Learning for Asset Management: New Developments and Financial Applications (book chapter)

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/ryan_brown.md`](../speakers/ryan_brown.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

