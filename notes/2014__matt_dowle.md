---
type: Talk
title: Introduction to data.table
description: data.table is an R package that reduces programming and compute time through efficient data manipulation and fast file reading.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Matt Dowle
speaker_slug: matt_dowle
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/workshop/MatthewDowle.pdf"
file_local: "./_cache/files/2014/2014__matt_dowle.pdf"
slug: 2014__matt_dowle
status: archived
tags: [osqf, 2014, matt_dowle, data_manipulation_r]
---

# Introduction to data.table

_2014 · Matt Dowle_

**Headline:** data.table is an R package that reduces programming and compute time through efficient data manipulation and fast file reading.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/workshop/MatthewDowle.pdf>
- Local: `./_cache/files/2014/2014__matt_dowle.pdf`
- Talk type: Tutorial

## Topics
- data manipulation in R
- performance optimization
- efficient data processing
- file I/O
- financial data analysis
- genomics data handling

## Methods
- aggregation
- update by reference
- radix sort
- split-apply-combine

## Datasets used
*(none extracted)*

## Code & tools
- `data.table`
- `fread`
- R
- `CRAN`
- `setkey`
- :=
- `lapply`
- `dcast`
- `melt`

## Key findings
- data.table's aggregation is 25x faster than data.frame for 1M rows  
  > DT [.( "R",123)] # 0.008s
- fread reads 50MB CSV 10x faster than read.csv  
  > fread("test.csv") # 3s
- data.table's by-group operations avoid variable name repetition  
  > DT[, sum(v),by=x] # 0.83s
- setkey enables fast binary joins  
  > X[Y] is just binary search to X's key
- data.table's melt/cast is 60x faster than reshape2  
  > melt(DT, id="d", measure=1:2) 3 sec

## Applications
- financial data analysis
- genomics research

## References cited
- http://datatable.r-forge.r-project.org/
- http://stackoverflow.com/questions/tagged/data.table

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/matt_dowle.md`](../speakers/matt_dowle.md)
- [`topics/data_manipulation_r.md`](../topics/data_manipulation_r.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

