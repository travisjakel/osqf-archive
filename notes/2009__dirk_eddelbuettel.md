---
type: Talk
title: High Performance Computing with R
description: "This talk introduces high-performance computing techniques in R, focusing on profiling, vectorization, compilation, and tools like Rcpp and BLAS/GPUs."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://dirk.eddelbuettel.com/papers/rFinanceHPC.pdf"
file_local: "./_cache/files/2009/2009__dirk_eddelbuettel.pdf"
slug: 2009__dirk_eddelbuettel
status: archived
tags: [osqf, 2009, dirk_eddelbuettel]
---

# High Performance Computing with R

_2009 · Dirk Eddelbuettel_

**Headline:** This talk introduces high-performance computing techniques in R, focusing on profiling, vectorization, compilation, and tools like Rcpp and BLAS/GPUs.

## Source
- File format: `pdf`
- URL: <https://dirk.eddelbuettel.com/papers/rFinanceHPC.pdf>
- Local: `./_cache/files/2009/2009__dirk_eddelbuettel.pdf`

## Topics
- profiling
- vectorization
- just-in-time compilation
- BLAS/GPUs
- compiled code
- performance optimization

## Methods
- RProf
- RProfmem
- vectorization
- Rcpp
- Inline
- RInside
- JIT compilation
- profiling compiled code with -pg option

## Datasets used
- longley data set

## Code & tools
- `RProf`
- `RProfmem`
- `profr`
- `proftools`
- `Rcpp`
- `Inline`
- `RInside`
- `BLAS`
- `GPUs`
- Perl scripts
- graphviz (dot)

## Key findings
- lm.fit() is about fourteen times faster than lm() for linear models due to fewer function calls.  
  > lm.fit() is about fourteen times faster as it makes fewer calls to other functions.
- Profiling tools like RProf and RProfmem help identify performance bottlenecks in R code.  
  > Measuring—using profiling tools—is critical... Rprof function for profiling R code.
- Vectorization and compiled code (e.g., Rcpp) significantly improve computational efficiency.  
  > Vectorisation... Compiled Code... Rcpp... RInside

## Applications
- statistical computing
- data analysis optimization
- Monte Carlo simulations

## References cited
- R Extensions manual (profiling section)
- Simon Urbanek's benchmarks page (http://r.research.att.com/benchmarks/)

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3)*

