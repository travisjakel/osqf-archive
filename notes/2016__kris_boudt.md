---
type: Talk
title: Block rearranging elements within matrix columns to minimize the variability of the row sums
description: Solving the partitioning problem by rearranging matrix columns to minimize row sum variability
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/KrisBoudt.pdf"
file_local: "./_cache/files/2016/2016__kris_boudt.pdf"
slug: 2016__kris_boudt
status: archived
tags: [osqf, 2016, kris_boudt]
---

# Block rearranging elements within matrix columns to minimize the variability of the row sums

_2016 · Kris Boudt (Vrije Universiteit Brussel, Amsterdam)_

**Headline:** Solving the partitioning problem by rearranging matrix columns to minimize row sum variability

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/KrisBoudt.pdf>
- Local: `./_cache/files/2016/2016__kris_boudt.pdf`
- Talk type: Lightning

## Topics
- partitioning problem
- matrix rearrangement
- greedy algorithms
- variance optimization
- risk management applications

## Methods
- greedy algorithm
- block rearrangement
- variance-based block selection
- simulation studies

## Datasets used
*(none extracted)*

## Code & tools
- R-forge (https://rforge.r-project.org/R/?group_id=2041)

## Key findings
- Block rearrangement (BRA) outperforms greedy algorithms in minimizing row sum differences  
  > Delta= 0
- BRAVE methods achieve near-optimal solutions with small deltas  
  > BRAVE(greedy)* | 0.2
- Variance-based block selection improves solution quality  
  > var(X+Y) = 0 if var(X)=var(Y)

## Applications
- assembly line scheduling
- value-at-risk model risk assessment

## References cited
- http://ssrn.com/abstract=2634669

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

