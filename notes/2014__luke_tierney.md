---
type: Talk
title: Some Performance Improvements for the R Engine
description: "This talk discusses performance improvements in R, focusing on byte code compilation, reducing value duplication, large vector support, parallelization, and profiling tools."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Luke Tierney
speaker_slug: luke_tierney
talk_type: Keynote
time_slot: "09:40 - 10:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/LukeTierney.pdf"
file_local: "./_cache/files/2014/2014__luke_tierney.pdf"
slug: 2014__luke_tierney
status: archived
tags: [osqf, 2014, luke_tierney]
---

# Some Performance Improvements for the R Engine

_2014 · Luke Tierney (University of Iowa)_

**Headline:** This talk discusses performance improvements in R, focusing on byte code compilation, reducing value duplication, large vector support, parallelization, and profiling tools.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/LukeTierney.pdf>
- Local: `./_cache/files/2014/2014__luke_tierney.pdf`
- Talk type: Keynote
- Time slot: 09:40 - 10:30

## Topics
- byte code compilation
- value duplication optimization
- large vector support
- parallel computing
- profiling tools

## Methods
- byte code compilation with virtual machine
- shallow duplication for large objects
- parallelization of vector/matrix operations
- sampling-based profiling

## Datasets used
*(none extracted)*

## Code & tools
- R compiler
- virtual machine
- `summaryRprof`
- pnmath0 package
- proftools (planned)

## Key findings
- Byte code compilation provides 3-4x speedups for scalar operations  
  > Timings for some simple benchmarks... Speedup Exper. Speedup 4.0 1.47 21.9
- Shallow duplication reduces memory use in Bioconductor applications  
  > This significantly improves speed... in Bioconductor applications
- Parallelization benefits large datasets (n≈30,000+ for arithmetic)  
  > For basic arithmetic operations n ≈ 30000 may be needed.
- Profiling tools identify 89% of time spent in lm.fit system.time  
  > system.time (lmfit.R:4) 89.32 18.50 0.00 0.00

## Applications
- statistical computing
- data analysis
- package development

## References cited
*(none extracted)*

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/luke_tierney.md`](../speakers/luke_tierney.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

