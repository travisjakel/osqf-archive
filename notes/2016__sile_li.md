---
type: Talk
title: Constructing US Employment Google Search Index by Applying Principal Component Analysis
description: This talk demonstrates how Principal Component Analysis is applied to construct a US employment Google search index using alternative data.
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Sile Li
speaker_slug: sile_li
talk_type: Lightning
time_slot: "16:00 - 16:18"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/SileLi.pdf"
file_local: "./_cache/files/2016/2016__sile_li.pdf"
slug: 2016__sile_li
status: archived
tags: [osqf, 2016, sile_li, principal_component_analysis, principal_component_analysis_pca]
---

# Constructing US Employment Google Search Index by Applying Principal Component Analysis

_2016 · Sile Li (Eagle Alpha)_

**Headline:** This talk demonstrates how Principal Component Analysis is applied to construct a US employment Google search index using alternative data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/SileLi.pdf>
- Local: `./_cache/files/2016/2016__sile_li.pdf`
- Talk type: Lightning
- Time slot: 16:00 - 16:18

## Topics
- Principal Component Analysis
- Google search indices
- alternative data
- economic indicators
- employment data

## Methods
- Principal Component Analysis (PCA)
- Bayesian variable selection (BMA, BSTS packages)
- data processing (gtrendsR, zoo, robustHD, seas packages)

## Datasets used
- Google Trends
- Google Correlate

## Code & tools
- `BMA`
- `BSTS`
- `gtrendsR`
- `zoo`
- `robustHD`
- `seas`
- `prcomp`

## Key findings
- PCA is used to create a composite index from multiple search terms  
  > Create index from top principal component(s)
- Bayesian methods are applied for term selection and filtering  
  > Filtering via correlation, Bayesian variable selection, term loading in PCA analysis
- Time series processing includes seasonal adjustment and outlier removal  
  > Convert time frequency, remove outliners, winsorize, and seasonal adjustment

## Applications
- economic indicator construction
- alternative data analysis
- financial forecasting

## References cited
- Choi & Varian (2012)
- Da et al. (2011)
- Dong & Bollen (2015)
- Ettredge et al. (2005)
- Hakkio & Keeton (2009)
- McLaren & Shanbhogue (2011)
- Nardo et al. (2008)
- Scott & Varian (2014)
- Vosen & Schmidt (2009)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/sile_li.md`](../speakers/sile_li.md)
- [`topics/principal_component_analysis.md`](../topics/principal_component_analysis.md)
- [`methods/principal_component_analysis_pca.md`](../methods/principal_component_analysis_pca.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

