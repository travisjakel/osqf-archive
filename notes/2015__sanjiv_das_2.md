---
type: Talk
title: Matrix MetricsNetwork-Based Systemic Risk Scoring
description: Analyzing network-based systemic risk scoring using graph theory and co-lending data from financial institutions
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Sanjiv Das
speaker_slug: sanjiv_das
talk_type: Talk
time_slot: "16:00 - 16:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/SanjivDas-2.pdf"
file_local: "./_cache/files/2015/2015__sanjiv_das_2.pdf"
slug: 2015__sanjiv_das_2
status: archived
tags: [osqf, 2015, sanjiv_das]
---

# Matrix MetricsNetwork-Based Systemic Risk Scoring

_2015 · Sanjiv Das (Santa Clara University)_

**Headline:** Analyzing network-based systemic risk scoring using graph theory and co-lending data from financial institutions

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/SanjivDas-2.pdf>
- Local: `./_cache/files/2015/2015__sanjiv_das_2.pdf`
- Talk type: Talk
- Time slot: 16:00 - 16:20

## Topics
- network metrics
- systemic risk analysis
- co-lending networks
- information extraction

## Methods
- centrality calculation (Bonacich 1987)
- fragility metric R = E(d²)/E(d)
- entity resolution
- Hadoop architecture

## Datasets used
- SEC filings
- OS Thrift Financial Records
- Hoovers
- D&B
- FINRA
- private Wall Street Journal

## Code & tools
- `Hadoop`
- information extraction (IE)
- entity resolution
- mapping and fusion

## Key findings
- Centrality scores for nodes in a network can be calculated as the eigenvector corresponding to the largest eigenvalue of the adjacency matrix  
  > Centrality is the eigenvector x corresponding to the largest eigenvalue.
- A network is considered fragile if its fragility metric R exceeds 2  
  > Fragile if R > 2.
- The Midas Project integrates unstructured text data from multiple financial sources to analyze systemic risk  
  > Extract information from unstructured text (filings).

## Applications
- systemic risk metrics
- governance

## References cited
- 'Extracting, Linking and Integrating Data from Public Sources: A Financial Case Study,' (2011) IEEE Data Engineering Bulletin
- WWW2010 proceedings

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/sanjiv_das.md`](../speakers/sanjiv_das.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

