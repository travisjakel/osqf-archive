---
type: Talk
title: "The R Package sentometrics to Compute, Aggregate and Predict with Textual Sentiment"
description: "The sentometrics R package integrates textual sentiment analysis, aggregation into time series, and econometric prediction models."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Samuel Borms
speaker_slug: samuel_borms
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/SamuelBorns.pdf"
file_local: "./_cache/files/2018/2018__samuel_borms.pdf"
slug: 2018__samuel_borms
status: archived
tags: [osqf, 2018, samuel_borms]
---

# The R Package sentometrics to Compute, Aggregate and Predict with Textual Sentiment

_2018 · Samuel Borms (Université de Neuchâtel/Vrije Universiteit Brussel)_

**Headline:** The sentometrics R package integrates textual sentiment analysis, aggregation into time series, and econometric prediction models.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/SamuelBorns.pdf>
- Local: `./_cache/files/2018/2018__samuel_borms.pdf`
- Talk type: Lightning

## Topics
- textual sentiment analysis
- time series econometrics
- aggregation of sentiment measures
- predictive modeling

## Methods
- elastic net regression (glmnet)
- tf-idf weighting
- proportional aggregation
- almon smoothing

## Datasets used
- usnews (The Wall Street Journal and The Washington Post 1995-2014)
- EPU index (monthly U.S. Economic Policy Uncertainty index)

## Code & tools
- `sentometrics`
- `quanteda`
- `glmnet`

## Key findings
- The package enables workflow from text corpus building to model evaluation with built-in datasets.  
  > The package is a general framework that integrates (i) the qualification of sentiment from texts, (ii) the aggregation into different sentiment measures, and (iii) the optimized prediction based on these measures.
- Elastic net regularization balances LASSO and Ridge regressions for collinear sentiment measures.  
  > We propose to use the elastic net regression (relying on glmnet), which balances between the LASSO and Ridge regressions through an α parameter.
- Sentiment measures are aggregated using tf-idf, proportional, and almon smoothing schemes.  
  > One control function to define all of this. ctrAgg  <- ctr_agg(howWithin = "tf-idf", howDocs = "proportional", howTime = c("equal_weight", "linear", "almon"), ...)
- The model predicts the EPU index with perfect in-sample fit but requires out-of-sample validation.  
  > Date | Realized | Prediction | ... 01-2000 | 100 | 100 | ... 01-2028 | 150 | 150 |

## Applications
- sentiment-based econometric modeling
- time series prediction
- textual data analysis

## References cited
*(none extracted)*

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/samuel_borms.md`](../speakers/samuel_borms.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

