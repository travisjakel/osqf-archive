---
type: Talk
title: "Efficient 'Kitchen-Sink' Forecasts for Exchange Rates"
description: "The talk presents methods for forecasting exchange rates using economic fundamentals, combining models, and applying shrinkage estimation to improve forecast accuracy."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Jiahan Li
speaker_slug: jiahan_li
talk_type: Talk
time_slot: "10:40 - 11:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/JiahanLi.pdf"
file_local: "./_cache/files/2013/2013__jiahan_li.pdf"
slug: 2013__jiahan_li
status: archived
tags: [osqf, 2013, jiahan_li, principal_component_analysis_pca]
---

# Efficient 'Kitchen-Sink' Forecasts for Exchange Rates

_2013 · Jiahan Li (University of Notre Dame)_

**Headline:** The talk presents methods for forecasting exchange rates using economic fundamentals, combining models, and applying shrinkage estimation to improve forecast accuracy.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/JiahanLi.pdf>
- Local: `./_cache/files/2013/2013__jiahan_li.pdf`
- Talk type: Talk
- Time slot: 10:40 - 11:00

## Topics
- exchange rate forecasting
- economic fundamentals
- model combination
- shrinkage estimation

## Methods
- Principal Component Analysis (PCA)
- Vector Autoregression (VAR)
- Discounted Mean Squared Error (DMSE) weighting
- constraint least squares with shrinkage

## Datasets used
- Monthly FX data (G10 currencies) 1976-2012

## Code & tools
- `lars`
- `elasticnet`
- `glmnet`
- `grpreg`

## Key findings
- Efficient 'kitchen-sink' model achieved highest out-of-sample R² (1.502 for AUD) vs. -0.068 for combined DMSE(0.9).  
  > Efficient ''Kitchen sink''
1.502 1.409 0.329 1.028 1.441 0.056 1.503 1.336 1.829
- Efficient model's Sharpe ratio (0.867) outperformed all alternatives including random walk (0.494).  
  > Efficient "Kitchen sink"
15.527
12.455
0.867
- Traditional 'kitchen-sink' regression had inflated coefficients requiring shrinkage estimation.  
  > β 1, … , β 4 are inflated. This motivates shrinkage estimation.

## Applications
- portfolio returns optimization
- foreign exchange rate prediction

## References cited
- Mönch, E. (2008). Forecasting the yield curve...
- Rapach, D. E., Strauss, J. K., & Zhou, G. (2010). Out-ofsample equity premium prediction...
- Campbell and Thompson, RFS, 2007

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/jiahan_li.md`](../speakers/jiahan_li.md)
- [`methods/principal_component_analysis_pca.md`](../methods/principal_component_analysis_pca.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

