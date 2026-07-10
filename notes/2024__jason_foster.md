---
type: Talk
title: Time-Series of Implied Shocks Using Principal Component Analysis
description: "The 'roll' R package provides fast computation of rolling statistics using C++ and applies PCA to analyze implied shocks in time-series data."
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Jason Foster
speaker_slug: jason_foster
talk_type: Talk
time_slot: "13:20 - 13:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/JasonFoster.pdf"
file_local: "./_cache/files/2024/2024__jason_foster.pdf"
slug: 2024__jason_foster
status: archived
tags: [osqf, 2024, jason_foster, time_series_analysis, principal_component_analysis_pca]
---

# Time-Series of Implied Shocks Using Principal Component Analysis

_2024 · Jason Foster_

**Headline:** The 'roll' R package provides fast computation of rolling statistics using C++ and applies PCA to analyze implied shocks in time-series data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/JasonFoster.pdf>
- Local: `./_cache/files/2024/2024__jason_foster.pdf`
- Talk type: Talk
- Time slot: 13:20 - 13:40

## Topics
- time-series analysis
- principal component analysis
- rolling statistics
- R package development

## Methods
- principal component analysis (PCA)
- rolling mean
- rolling standard deviation
- eigen decomposition

## Datasets used
*(none extracted)*

## Code & tools
- `roll`
- `data.table`
- `devtools`
- `RcppParallel`
- `rolleigen`
- `GitHub`
- `r-universe`

## Key findings
- The 'roll' package uses C++ via RcppParallel for high-performance parallel computation.  
  > High-performance parallel algorithms in C++ via RcppParallel
- PCA is applied to identify principal components explaining variability in shocks.  
  > Proportion of variance explained by the first n principal component(s) is an indicator
- Cosine similarity adjusts principal component directions across time.  
  > Cosine similarity between two vectors is 1 if the vectors point in the same direction

## Applications
*(none extracted)*

## References cited
*(none extracted)*

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/jason_foster.md`](../speakers/jason_foster.md)
- [`topics/time_series_analysis.md`](../topics/time_series_analysis.md)
- [`methods/principal_component_analysis_pca.md`](../methods/principal_component_analysis_pca.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

