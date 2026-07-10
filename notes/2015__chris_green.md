---
type: Talk
title: Detecting Multivariate Financial Data Outliers using Calibrated Robust Mahalanobis Distances
description: Detecting multivariate outliers in financial data using calibrated robust Mahalanobis distances to improve factor model reliability
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Chris Green
speaker_slug: chris_green
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/ChrisGreen.pdf"
file_local: "./_cache/files/2015/2015__chris_green.pdf"
slug: 2015__chris_green
status: archived
tags: [osqf, 2015, chris_green]
---

# Detecting Multivariate Financial Data Outliers using Calibrated Robust Mahalanobis Distances

_2015 · Chris Green (University of Washington)_

**Headline:** Detecting multivariate outliers in financial data using calibrated robust Mahalanobis distances to improve factor model reliability

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/ChrisGreen.pdf>
- Local: `./_cache/files/2015/2015__chris_green.pdf`
- Talk type: Lightning

## Topics
- multivariate outlier detection
- robust statistics
- financial data analysis
- factor models

## Methods
- Mahalanobis distance
- Minimum Covariance Determinant (MCD)
- Iterated Reweighted MCD (IRMCD)
- Bonferroni correction

## Datasets used
- CRSP database via WRDS
- Compustat via WRDS (book-to-market, size, earnings-to-price, momentum)

## Code & tools
- CerioliOutlierDetection R package

## Key findings
- Classical MDs miss multivariate outliers while robust MDs detect significant departures from normality during financial crises  
  > Robust MDs (blue) suggest significant departures... 2008 financial crisis
- Univariate trimming/Winsorization fails to address many multivariate outliers  
  > Many multivariate outliers are inside... would not have been touched by univariate trimming
- IRMCD calibration achieves correct Type I error rates for robust MD outlier tests  
  > Cerioli (2010) developed a calibration... correct Type I error behavior

## Applications
- fundamental factor model construction
- financial risk modeling

## References cited
- Cerioli (2010) JASA
- Cerioli et al. (2009) Statistical Computing
- Hardin and Rocke (2005) JCGS

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/chris_green.md`](../speakers/chris_green.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

