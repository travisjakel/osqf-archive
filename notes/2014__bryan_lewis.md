---
type: Talk
title: "New Ideas for Large Network Analysis, Implemented in R"
description: "Presentation on large network analysis techniques implemented in R, focusing on matrix functions and IRL methods for centrality measures."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Bryan Lewis
speaker_slug: bryan_lewis
talk_type: Talk
time_slot: "09:49 - 10:09"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/BryanLewis.pdf"
file_local: "./_cache/files/2014/2014__bryan_lewis.pdf"
slug: 2014__bryan_lewis
status: archived
tags: [osqf, 2014, bryan_lewis, network_analysis]
---

# New Ideas for Large Network Analysis, Implemented in R

_2014 · Bryan Lewis_

**Headline:** Presentation on large network analysis techniques implemented in R, focusing on matrix functions and IRL methods for centrality measures.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/BryanLewis.pdf>
- Local: `./_cache/files/2014/2014__bryan_lewis.pdf`
- Talk type: Talk
- Time slot: 09:49 - 10:09

## Topics
- network analysis
- centrality measures
- matrix functions
- computational methods for large graphs

## Methods
- IRLBA (truncated SVD)
- IRBLB (windowed truncated SVD)
- IRBLeigs (symmetric variant)
- topm (network bounds)
- matrix exponentials (expm)
- orthogonal polynomials from quadrature rules

## Datasets used
- Bitcoin transaction network (directed graph with 16.3M nodes)

## Code & tools
- R's Matrix package (expm)
- IRLBA package
- IRL GitHub repository (https://github.com/bwewis/IRL)

## Key findings
- topm algorithm computes top hub centralities 200x faster than expm on Bitcoin data  
  > > proc.time() - t1
user system elapsed
0.555 0.010 0.565
- Matrix exponentials (exp(A)) provide network centrality measures through f-subgraph centrality  
  > f-subgraph centrality [f(A)]i,i
- IRL methods project into subspaces containing most important nodes for efficiency  
  > IRL methods project into a subspace guaranteed to contain the most important nodes

## Applications
- network centrality computation
- large-scale graph analysis

## References cited
- Benzi and Boito (orthogonal polynomials)
- Golub (quadrature rules)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/bryan_lewis.md`](../speakers/bryan_lewis.md)
- [`topics/network_analysis.md`](../topics/network_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

