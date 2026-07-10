---
type: Talk
title: The Arborist a High-Performance Random Forest Implementation
description: The Arborist is a high-performance random forest implementation optimized for various hardware and data types.
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Mark Seligman
speaker_slug: mark_seligman
talk_type: Talk
time_slot: "10:35 - 10:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MarkSeligman.pdf"
file_local: "./_cache/files/2015/2015__mark_seligman.pdf"
slug: 2015__mark_seligman
status: archived
tags: [osqf, 2015, mark_seligman]
---

# The Arborist a High-Performance Random Forest Implementation

_2015 · Mark Seligman (Suiji)_

**Headline:** The Arborist is a high-performance random forest implementation optimized for various hardware and data types.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MarkSeligman.pdf>
- Local: `./_cache/files/2015/2015__mark_seligman.pdf`
- Talk type: Talk
- Time slot: 10:35 - 10:55

## Topics
- machine learning algorithms
- high-performance computing
- random forests
- GPU acceleration
- software design
- data locality

## Methods
- restaging
- SIMD hardware utilization
- parallel processing
- predictor-level parallelization
- stable partitioning

## Datasets used
- German credit-scoring data set (UCI ML Repository)
- GWAS data (University of Washington)

## Code & tools
- R
- `Python`
- `Rcpp`
- `Rborist`
- Curborist (planned)

## Key findings
- Arborist achieves 2-3× speedups over randomForest on medium-sized datasets.  
  > Performance of Rborist generally 2-3 ×, in this regime.
- GPU version shows potential for highly regular datasets.  
  > Results illustrate potential - for highly regular data sets.
- Large-cardinality sampling caused scalability issues in early versions.  
  > Appears to have been a problem with large-cardinality sampling scheme.
- Restaging improves data locality and enables SIMD parallelism.  
  > Restaging: maintain separately-sorted state vectors for each predictor, by node.

## Applications
*(none extracted)*

## References cited
- Lichman, M. (2013). UCI Machine Learning Repository
- 'Benchmarking Random Forest Implementations', Szilard Pafka, DataScience.LA, May 19, 2015

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/mark_seligman.md`](../speakers/mark_seligman.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

