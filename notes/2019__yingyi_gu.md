---
type: Talk
title: Multilinear Principal Component Analysis on Implied Volatility Surface
description: Application of multilinear PCA to analyze implied volatility surfaces using tensor decomposition methods.
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Yingyi Gu
speaker_slug: yingyi_gu
talk_type: Lightning
time_slot: "10:31 - 10:37"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/YingyiGu.pdf"
file_local: "./_cache/files/2019/2019__yingyi_gu.pdf"
slug: 2019__yingyi_gu
status: archived
tags: [osqf, 2019, yingyi_gu]
---

# Multilinear Principal Component Analysis on Implied Volatility Surface

_2019 · Yingyi Gu (Bloomberg L.P.)_

**Headline:** Application of multilinear PCA to analyze implied volatility surfaces using tensor decomposition methods.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/YingyiGu.pdf>
- Local: `./_cache/files/2019/2019__yingyi_gu.pdf`
- Talk type: Lightning
- Time slot: 10:31 - 10:37

## Topics
- multilinear PCA
- volatility surface analysis
- tensor decomposition
- dimensionality reduction

## Methods
- Tucker decomposition
- Multilinear Principal Component Analysis (MPCA)

## Datasets used
*(none extracted)*

## Code & tools
- R

## Key findings
- MPCA preserves tensor structure better than vectorized PCA, reducing reconstruction error for volatility surfaces.  
  > MPCA vs PCA on images – reconstruction error (Slide 12)
- Tucker decomposition enables truncated tensor analysis analogous to truncated SVD.  
  > Analogy to truncated SVD (Slide 9)
- MPCA captures delta-maturity and delta-strike dimensions separately in volatility surfaces.  
  > First 2*2 eigen-surfaces from MPCA (Slide 15)

## Applications
- volatility surface across names and time
- interest rate volatility cube

## References cited
- H. Lu et al., "MPCA: Multilinear Principal Component Analysis of Tensor Objects", IEEE Transactions on Neural Networks 2008
- H. Hung et al., "On Multilinear Principal Component Analysis of Order-Two Tensors", Biometrika 2012

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/yingyi_gu.md`](../speakers/yingyi_gu.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3)*

