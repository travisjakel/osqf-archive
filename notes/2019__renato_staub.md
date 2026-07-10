---
type: Talk
title: Collinearity Visualized
description: Collinearity Visualized explains how geometric representations can clarify instability in multiple regression models when independent variables are highly correlated.
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Renato Staub
speaker_slug: renato_staub
talk_type: Talk
time_slot: "14:05 - 14:25"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/RenatoStaub.pptx"
file_local: "./_cache/files/2019/2019__renato_staub.pptx"
slug: 2019__renato_staub
status: archived
tags: [osqf, 2019, renato_staub]
---

# Collinearity Visualized

_2019 · Renato Staub (William Blair & Company, LLC)_

**Headline:** Collinearity Visualized explains how geometric representations can clarify instability in multiple regression models when independent variables are highly correlated.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/RenatoStaub.pptx>
- Local: `./_cache/files/2019/2019__renato_staub.pptx`
- Talk type: Talk
- Time slot: 14:05 - 14:25

## Topics
- multiple regression
- collinearity
- geometric visualization of risk
- instability of regression coefficients

## Methods
- multiple regression
- cosine rule
- covariance formula
- vector addition

## Datasets used
- Bloomberg daily data between 2000.1 and 2019.1

## Code & tools
- R (cor(), solve(), edit())

## Key findings
- Small changes to correlation matrices can cause massive swings in multiple regression beta estimates.  
  > The biggest positive and negative changes equal 0.003 and -0.005... resulting Beta estimates have changed massively
- Highly correlated variables lead to unstable and non-intuitive regression coefficients.  
  > the resulting MB have changed massively... stability issues in the given context
- Geometric visualization shows that correlation equals the angle between risk vectors.  
  > the correlation between two random variables is represented by an angle whose cosine equals their correlation

## Applications
- risk management
- portfolio analysis

## References cited
- Grinold and Kahn (1999) Active Portfolio Management
- Staub (2006) Multilayer modeling of a covariance matrix
- Staub (2018) Collinearity Visualized

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/renato_staub.md`](../speakers/renato_staub.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

