---
type: Talk
title: The scidb packagean R interface to SciDB
description: "The scidb R package provides an interface to SciDB, a distributed array database optimized for parallel sparse/dense linear algebra."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Bryan Lewis
speaker_slug: bryan_lewis
talk_type: Talk
time_slot: "14:00 - 14:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/BryanLewis.pdf"
file_local: "./_cache/files/2013/2013__bryan_lewis.pdf"
slug: 2013__bryan_lewis
status: archived
tags: [osqf, 2013, bryan_lewis]
---

# The scidb packagean R interface to SciDB

_2013 · Bryan Lewis (Paradigm4)_

**Headline:** The scidb R package provides an interface to SciDB, a distributed array database optimized for parallel sparse/dense linear algebra.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/BryanLewis.pdf>
- Local: `./_cache/files/2013/2013__bryan_lewis.pdf`
- Talk type: Talk
- Time slot: 14:00 - 14:20

## Topics
- array databases
- R interfaces
- distributed computing
- linear algebra
- data storage

## Methods
- parallel sparse/dense linear algebra
- array partitioning
- n-dimensional joins/merges
- matrix decompositions (SVD)

## Datasets used
*(none extracted)*

## Code & tools
- `scidb`
- `ff`
- `bigmemory`
- `pbdR`
- `RMySQL`
- Vertica/R
- `Hadoop`
- `rmr`
- `s4vdp4`
- `biclust`
- `s4vd`

## Key findings
- SciDB is a free, open-source array database supporting sparse/dense multi-dimensional arrays with ACID properties.  
  > Free and open-source array database
Sparse/dense, multi-dimensional arrays
Distributed storage, parallel processing
- The scidb R package enables two interaction modes: direct SciDB query language use and an N-dimensional array class.  
  > The package defines two main ways to interact with SciDB:
1. Iterable data frame interface using SciDB query language directly
2. N-dimensional sparse/dense array class for R backed by SciDB arrays
- SciDB excels at distributed linear algebra operations and array aggregation over dimensions.  
  > Linear algebra operations and matrix decompositions are available for matrices and vectors.
Values can be aggregated, along dimensions optionally over windows

## Applications
- genomic data analysis (NCBI 1K Genome Browser)
- scientific computing
- large-scale data processing

## References cited
- NCBI 1K Genome Browser

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/bryan_lewis.md`](../speakers/bryan_lewis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

