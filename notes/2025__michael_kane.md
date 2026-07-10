---
type: Talk
title: Julia as a Compiler for R Packages
description: "Julia can compile R packages for performance gains while retaining R's development ergonomics"
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Michael Kane
speaker_slug: michael_kane
talk_type: Lightning
time_slot: "16:35 - 16:42"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/MichaelKane.pdf"
file_local: "./_cache/files/2025/2025__michael_kane.pdf"
slug: 2025__michael_kane
status: archived
tags: [osqf, 2025, michael_kane, r_package_development]
---

# Julia as a Compiler for R Packages

_2025 · Michael Kane (MD Anderson Cancer Center, Telperian Inc.)_

**Headline:** Julia can compile R packages for performance gains while retaining R's development ergonomics

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/MichaelKane.pdf>
- Local: `./_cache/files/2025/2025__michael_kane.pdf`
- Talk type: Lightning
- Time slot: 16:35 - 16:42

## Topics
- R package development
- Julia as a compiler
- performance optimization
- clinical trial simulations
- interoperability between R and Julia
- scaling up computations

## Methods
- CCLLable functions
- Julia's multiple dispatch
- GPU development tools
- Rcpp

## Datasets used
*(none extracted)*

## Code & tools
- `Julia`
- R
- `CCLLable`
- `Rcpp`
- `tibble`
- `Distributions`
- `DataFrames`
- `Survival`
- `juliac`
- `bash`
- `LD_LIBRARY_PATH`

## Key findings
- Julia's compiled code achieved 23.6x speedup over R for 1M patient simulations  
  > Speedup 23.611
- Julia's CCLLable functions enable R package interoperability  
  > Base.@ccllable function add_r(...)
- Julia retains R-like syntax while offering lower-level programming capabilities  
  > Syntax is somewhere between R and Python but supports low(er)-level programming.

## Applications
- clinical trial simulations
- scaling up computations

## References cited
*(none extracted)*

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/michael_kane.md`](../speakers/michael_kane.md)
- [`topics/r_package_development.md`](../topics/r_package_development.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

