---
type: Talk
title: Implementation of Value Strategies using R
description: "Implementation of value investment strategies using R and PostgreSQL, including Greenblatt's and O'Schaughnessy's approaches."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Mark Bennett
speaker_slug: mark_bennett
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/DirkHugen.pdf"
file_local: "./_cache/files/2016/2016__mark_bennett_2.pdf"
slug: 2016__mark_bennett_2
status: archived
tags: [osqf, 2016, mark_bennett]
---

# Implementation of Value Strategies using R

_2016 · Mark Bennett (University of Iowa, Department of Statistics and Actuarial Science)_

**Headline:** Implementation of value investment strategies using R and PostgreSQL, including Greenblatt's and O'Schaughnessy's approaches.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/DirkHugen.pdf>
- Local: `./_cache/files/2016/2016__mark_bennett_2.pdf`
- Talk type: Lightning

## Topics
- value investing
- R programming
- PostgreSQL
- financial data analysis
- PL/R extension

## Methods
- Greenblatt Value Formula (earnings yield + operating cashflow yield screening)
- O'Schaughnessy PSR strategy (price-to-sales ratio + market cap filtering)
- PROD aggregate function for cumulative returns
- PL/R quantile calculation for percentile-based screening

## Datasets used
- WRDS database (msf, funda tables) with dates 2010-2013

## Code & tools
- R
- `PostgreSQL`
- RPostgreSQL package
- PL/R extension
- quantile() function

## Key findings
- Greenblatt strategy selects stocks with earnings yield ≥10% and operating cashflow yield ≥20%.  
  > SELECT ... WHERE ni/(prcc_f*csho) > .1 AND oancf/(csho*prcc_f) > 0.2
- O'Schaughnessy PSR strategy picks 50 stocks with lowest price-to-sales ratio and market cap ≥$200M.  
  > SELECT ... ORDER BY psr LIMIT 50
- PL/R enables percentile-based screening (e.g., 20th percentile of debt-equity ratio).  
  > CREATE FUNCTION r_quantile(float8[]) ... probs=0.2

## Applications
- value strategy backtesting
- financial data analysis

## References cited
- Bennett & Hugen (2016)
- Greenblatt (2004)
- O'Schaughnessy (1998)
- Conway (PL/R website)
- Eddelbuettel et al. (RPostgreSQL)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/mark_bennett.md`](../speakers/mark_bennett.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

