---
type: Talk
title: Economic Time Series FilteringAn Alternative Approach
description: Presents an alternative to the Hodrick-Prescott filter for economic time series using a regression-based approach implemented in the neverhpfilter R package
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Justin Shea
speaker_slug: justin_shea
talk_type: Lightning
time_slot: "15:49 - 16:13"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/JustinShea.pdf"
file_local: "./_cache/files/2018/2018__justin_shea.pdf"
slug: 2018__justin_shea
status: archived
tags: [osqf, 2018, justin_shea]
---

# Economic Time Series FilteringAn Alternative Approach

_2018 · Justin Shea_

**Headline:** Presents an alternative to the Hodrick-Prescott filter for economic time series using a regression-based approach implemented in the neverhpfilter R package

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/JustinShea.pdf>
- Local: `./_cache/files/2018/2018__justin_shea.pdf`
- Talk type: Lightning
- Time slot: 15:49 - 16:13

## Topics
- Economic time series filtering
- Alternative to HP filter
- R package implementation
- Detrending methods

## Methods
- Regression of y_{t+h} on recent values (y_t, y_{t-1}, ..., y_{t-p}) for detrending
- Generalized linear model (GLM) estimation

## Datasets used
- GDPC1 (real GDP index from FRED)

## Code & tools
- `neverhpfilter`
- `xts`
- `zoo`
- `glm`

## Key findings
- The HP filter's drawbacks include sensitivity to endpoint choices and arbitrary smoothing parameter selection  
  > WHY YOU SHOULD NEVER USE THE HODRICK-PRESCOTT FILTER (2017)
- Regression of y_{t+8} on four prior values provides robust detrending without HP filter drawbacks  
  > y t+8 = β 0 + β 1 y t + β 2 y t -1 + β 3 y t -2 + β 4 y t -3 + v t+8
- neverhpfilter package implements this approach with xts/zoo support for periodic time series  
  > library(neverhpfilter)
gdp_model <- yth_glm(100*log(GDPC1), h = 8, p = 4)

## Applications
- Macroeconomic detrending
- Business cycle analysis
- Time series decomposition

## References cited
- Hamilton (2017): WHY YOU SHOULD NEVER USE THE HODRICK-PRESCOTT FILTER

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/justin_shea.md`](../speakers/justin_shea.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

