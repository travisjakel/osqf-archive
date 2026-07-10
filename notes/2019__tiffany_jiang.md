---
type: Talk
title: Using Statistical Learning to Analyze Merger Activity
description: Using statistical learning on SEC filings to analyze merger activity and predict firm mergers
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Tiffany Jiang
speaker_slug: tiffany_jiang
talk_type: Talk
time_slot: "13:15 - 13:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/TiffanyJiang.pdf"
file_local: "./_cache/files/2019/2019__tiffany_jiang.pdf"
slug: 2019__tiffany_jiang
status: archived
tags: [osqf, 2019, tiffany_jiang, lasso]
---

# Using Statistical Learning to Analyze Merger Activity

_2019 · Tiffany Jiang (University of California, Davis)_

**Headline:** Using statistical learning on SEC filings to analyze merger activity and predict firm mergers

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/TiffanyJiang.pdf>
- Local: `./_cache/files/2019/2019__tiffany_jiang.pdf`
- Talk type: Talk
- Time slot: 13:15 - 13:35

## Topics
- merger activity analysis
- text analysis in economics
- statistical learning methods
- empirical verification of merger predictions

## Methods
- Lasso
- Ridge
- Elastic Net
- Logistic Regression
- tf-idf
- Bag-of-Words

## Datasets used
- Thomson Reuters’ SDC Platinum Database
- SEC 10-K filings

## Code & tools
- glm-net (R package)

## Key findings
- Test accuracy reached ~85% using text analysis of 10-K filings  
  > Although hypothesis testing breaks down, the accuracy rate is roughly 85 percent !
- Lasso identified words like 'disclosure' and 'security' as significant predictors  
  > Table – Words Picked by the Lasso

       iii               reasonable                director              security       but         chief
-263.634                   -21.447                  -9.736               -7.983        -4.556        1.599
 indicate                  controls               disclosures          procedures    registered   disclosure
  39.172                    44.864                 146.363              192.412       390.211     1, 648.075
- Model uses high-dimensional text features with regularization  
  > This is a regression problem like any other, except that the high-dimensionality of c_i makes OLS and other standard techniques infeasible. I used the "glm-net" package in R.

## Applications
- merger prediction
- text analysis in economics

## References cited
- Gentzkow and Shapiro (2010)
- Hoberg and Phillips (2010)
- Routledge, Sacchetto, and Smith (2017)

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/tiffany_jiang.md`](../speakers/tiffany_jiang.md)
- [`methods/lasso.md`](../methods/lasso.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

