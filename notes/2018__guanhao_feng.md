---
type: Talk
title: Deep Learning Alpha
description: "The talk explores using deep learning to generate tradable factors for alpha generation in U.S. equities, combining neural networks with traditional factor models like Fama-French."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Guanhao Feng
speaker_slug: guanhao_feng
talk_type: Talk
time_slot: "10:35 - 10:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/GuanhaoFeng.pdf"
file_local: "./_cache/files/2018/2018__guanhao_feng.pdf"
slug: 2018__guanhao_feng
status: archived
tags: [osqf, 2018, guanhao_feng, factor_investing]
---

# Deep Learning Alpha

_2018 · Guanhao Feng (City University of Hong Kong / Chicago Booth)_

**Headline:** The talk explores using deep learning to generate tradable factors for alpha generation in U.S. equities, combining neural networks with traditional factor models like Fama-French.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/GuanhaoFeng.pdf>
- Local: `./_cache/files/2018/2018__guanhao_feng.pdf`
- Talk type: Talk
- Time slot: 10:35 - 10:55

## Topics
- factor investing
- machine learning in finance
- deep learning for alpha generation
- empirical validation of financial models

## Methods
- augmented linear factor model
- security sorting
- neural networks
- TensorFlow implementation

## Datasets used
- monthly U.S. equity data 1975-2017 (62 characteristics + 11 industry specs)

## Code & tools
- `TensorFlow`
- `Keras`

## Key findings
- Deep learning improves cross-sectional return predictions over Fama-French models (e.g., FF3+DL6 reduces RMSE-CS by 56% vs. FF3)  
  > FF3+DL6 0.274% 5.11% 0.504% 3.38%
- TensorFlow enables joint estimation of neural networks and factor models  
  > TensorFlow is extremely power to let us provide a joint estimation from latent factor generation to minimizing the mis-pricings.
- Adding more characteristics doesn't always improve model fit  
  > adding characteristics does not necessarily improve the goodness-of-fit

## Applications
- factor investing
- algorithmic trading
- risk premium analysis

## References cited
- Harvey, Liu, and Zhu (2016)
- Feng, Giglio, and Xiu (2017)
- Kelly, Pruitt, and Su (2018)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/guanhao_feng.md`](../speakers/guanhao_feng.md)
- [`topics/factor_investing.md`](../topics/factor_investing.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

