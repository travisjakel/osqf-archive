---
type: Talk
title: Introduction to data.table
description: "Introduction to data.table: Efficient data manipulation in R with fast aggregation, reference updates, and optimized file reading."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Matthew Dowle
speaker_slug: matthew_dowle
talk_type: Lightning
time_slot: "14:20 - 14:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/MatthewDowle.pdf"
file_local: "./_cache/files/2013/2013__matthew_dowle_2.pdf"
slug: 2013__matthew_dowle_2
status: archived
tags: [osqf, 2013, matthew_dowle, data_manipulation_r, fast_aggregation]
---

# Introduction to data.table

_2013 · Matthew Dowle_

**Headline:** Introduction to data.table: Efficient data manipulation in R with fast aggregation, reference updates, and optimized file reading.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/MatthewDowle.pdf>
- Local: `./_cache/files/2013/2013__matthew_dowle_2.pdf`
- Talk type: Lightning
- Time slot: 14:20 - 14:40

## Topics
- data manipulation in R
- efficient data processing
- R package features
- performance optimization

## Methods
- fast aggregation
- update by reference using :=
- column operations by group
- optimized file reading with fread

## Datasets used
*(none extracted)*

## Code & tools
- `data.table`
- `fread`
- `read.csv`
- R

## Key findings
- data.table reduces programming time with fewer function calls  
  > Reduce programming time: fewer function calls, less variable name repetition
- data.table achieves 10x faster aggregation than data.frame  
  > DT [.( "R",123)] # 0.008s vs DF [DF$x=="R" & DF$y==123,] # 8 s
- fread reads CSV files 10x faster than read.csv  
  > fread("test.csv") # 3s vs read.csv("test.csv") # 30-60s
- update by reference modifies data.tables in-place without copying  
  > DT [, sectorMCAP :=sum(MCAP) , by=Sector] (0.00s even on 20GB table)

## Applications
- financial data analysis
- genomics research
- high-performance data processing

## References cited
- http://datatable.r-forge.r-project.org/

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/matthew_dowle.md`](../speakers/matthew_dowle.md)
- [`topics/data_manipulation_r.md`](../topics/data_manipulation_r.md)
- [`methods/fast_aggregation.md`](../methods/fast_aggregation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/4), source=ocr(paddle)*

