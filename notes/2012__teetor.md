---
type: Talk
title: Fast(er) R Code
description: "Talk discusses optimizing R code performance by avoiding for loops, using vectorized operations, and apply family functions."
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Teetor
speaker_slug: teetor
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/PaulTeetor.pdf"
file_local: "./_cache/files/2012/2012__teetor.pdf"
slug: 2012__teetor
status: archived
tags: [osqf, 2012, teetor, r_programming]
---

# Fast(er) R Code

_2012 · Teetor_

**Headline:** Talk discusses optimizing R code performance by avoiding for loops, using vectorized operations, and apply family functions.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/PaulTeetor.pdf>
- Local: `./_cache/files/2012/2012__teetor.pdf`
- Talk type: Lightning

## Topics
- R programming
- performance optimization
- vectorized operations
- functional programming

## Methods
- vectorized operations
- lapply
- apply family functions
- Reduce
- replicate
- functional programming (Filter, Reduce)

## Datasets used
*(none extracted)*

## Code & tools
- R

## Key findings
- For loops and data copying in R are slow.  
  > In R, “for” loops and data copying are slow.
- Vectorized operations replace element-by-element loops.  
  > A <- B + C • Works for many operators and functions
- lapply applies a function to list elements without converting to vectors.  
  > lapply(lst, sqrt) [[1]] [1] 1
- Reduce implements iterative operations like cumulative sum/product.  
  > s <- Reduce(f, x) • Cumulative product: prods <- Reduce(f, x, accumulate=TRUE)

## Applications
- performance optimization in R
- efficient data processing

## References cited
*(none extracted)*

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/teetor.md`](../speakers/teetor.md)
- [`topics/r_programming.md`](../topics/r_programming.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

