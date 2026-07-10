---
type: Talk
title: Investment Analytics with R and PostgreSQL via the PL/R extension
description: "Using R and PostgreSQL with PL/R extension for investment analytics, including tail estimation, sales prediction, and GARCH modeling."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Dirk Hugen
speaker_slug: dirk_hugen
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DirkHugen.pdf"
file_local: "./_cache/files/2018/2018__dirk_hugen.pdf"
slug: 2018__dirk_hugen
status: archived
tags: [osqf, 2018, dirk_hugen]
---

# Investment Analytics with R and PostgreSQL via the PL/R extension

_2018 · Dirk Hugen_

**Headline:** Using R and PostgreSQL with PL/R extension for investment analytics, including tail estimation, sales prediction, and GARCH modeling.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DirkHugen.pdf>
- Local: `./_cache/files/2018/2018__dirk_hugen.pdf`
- Talk type: Lightning

## Topics
- tail estimation
- sales prediction with ARIMA
- GARCH models
- statistical testing (Shapiro-Wilk, skewness, kurtosis)
- PL/R integration
- industry analysis

## Methods
- Weibull distribution fitting
- ARIMA modeling
- GARCH(1,1) estimation
- ANOVA
- SQL aggregate functions for statistical calculations

## Datasets used
- funda.csv
- res.csv
- google (TSA package dataset)

## Code & tools
- `ggplot2`
- `MASS`
- `TSA`
- `tseries`
- `moments`
- `RPostgreSQL`
- PL/R
- PostgreSQL aggregate functions

## Key findings
- Weibull distribution fits tail data with shape parameter estimation via PL/R SQL functions.  
  > > fitdistr(na.omit(res$psr),densfun=dweibull,start=list(scale=2,shape=5))$estimate[2]
- PL/R enables SQL aggregate functions for Shapiro-Wilk tests and moments calculations on S&P 500 prediction errors.  
  > > CREATE OR REPLACE FUNCTION r_shapiro(float8[]) RETURNS float8 AS'...
- GARCH(1,1) models capture volatility clustering in financial time series with significant α and β coefficients.  
  > a1 1.397e-01   2.335e-02   5.984 2.17e-09 ***
    b1 7.698e-01   3.722e-02  20.682 < 2e-16 ***
- Sales prediction errors show significant skewness and kurtosis across industries.  
  > summary(aov(skew~sic,data=res))
                 Df Sum Sq Mean Sq F value Pr(>F)

## Applications
- investment analytics
- risk management via tail estimation
- sales forecasting for S&P 500 companies

## References cited
- TSA package (google dataset)
- tseries package (garch function)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/dirk_hugen.md`](../speakers/dirk_hugen.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

