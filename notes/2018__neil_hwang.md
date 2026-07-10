---
type: Talk
title: Dynamic k-Partite Stochastic Block Model
description: Development of dynamic bi-partite stochastic block models for community detection in network data with time-varying structures
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Neil Hwang
speaker_slug: neil_hwang
talk_type: Lightning
time_slot: ~
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/NeilHwang.pptx"
file_local: "./_cache/files/2018/2018__neil_hwang.pptx"
slug: 2018__neil_hwang
status: archived
tags: [osqf, 2018, neil_hwang]
---

# Dynamic k-Partite Stochastic Block Model

_2018 · Neil Hwang_

**Headline:** Development of dynamic bi-partite stochastic block models for community detection in network data with time-varying structures

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/NeilHwang.pptx>
- Local: `./_cache/files/2018/2018__neil_hwang.pptx`
- Talk type: Lightning

## Topics
- community detection
- stochastic block models (SBM)
- bipartite networks
- dynamic models
- algorithmic scalability

## Methods
- spectral clustering
- degree correction
- minimum description length principle
- eigenvector decomposition
- k-means clustering

## Datasets used
*(none extracted)*

## Code & tools
- `dbisbm`
- DSBM (Chatterjee 2017)
- biSBM (Larremore 2014)

## Key findings
- Bipartite SBM formulation reduces dimensionality loss and improves assortativity estimation  
  > 1) Just look for disassortative clusters 2) Time complexity comparison a) SBM: b) biSBM: +
- Dynamic SBM incorporates spectral clustering and degree correction for scalability  
  > Dynamic Stochastic Block Model (DSBM)² • Spectral clustering in dynamic setting • Degree correction for empirical graphs
- Algorithm uses eigenvectors and k-means clustering for community detection  
  > 3) Compute  eigenvectors corresponding to the  largest eigenvalues 4) Until a desired  of accuracy is reached Repeatedly applying k-means clustering algorithm

## Applications
- community detection in corporate networks
- analysis of academic collaboration networks
- banking sector exposure mapping

## References cited
- Chatterjee 2017
- Larremore 2014
- Peixoto 2013

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/neil_hwang.md`](../speakers/neil_hwang.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

