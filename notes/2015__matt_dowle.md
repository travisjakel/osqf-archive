---
type: Talk
title: Fast automatic indexing with data.table
description: "data.table offers fast indexing and operations, outperforming dplyr in speed and efficiency for large datasets"
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Matt Dowle
speaker_slug: matt_dowle
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MattDowle.pdf"
file_local: "./_cache/files/2015/2015__matt_dowle.pdf"
slug: 2015__matt_dowle
status: archived
tags: [osqf, 2015, matt_dowle, fast_aggregation]
---

# Fast automatic indexing with data.table

_2015 · Matt Dowle (H2O.ai Machine Intelligence)_

**Headline:** data.table offers fast indexing and operations, outperforming dplyr in speed and efficiency for large datasets

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MattDowle.pdf>
- Local: `./_cache/files/2015/2015__matt_dowle.pdf`
- Talk type: Lightning

## Topics
- data.table performance
- automatic indexing
- comparison with dplyr
- large data processing

## Methods
- fast aggregation
- ordered joins
- rolling joins
- fread file reader
- automatic indexing

## Datasets used
- 1.5GB sample dataset
- 4GB order() benchmark data
- 23GB .csv (500 million rows)

## Code & tools
- `data.table`
- `dplyr`
- `H2O`
- `fread`
- R

## Key findings
- data.table's automatic indexing reduces query time from 1.99s to 0.001s on subsequent runs  
  > > DT[id=="FOO",] creating new index 'id' forder took 1.991 sec bmerge took 0.001 sec > DT[id=="BAR",] using existing index 'id' bmerge took 0.001 sec
- dplyr's filter() is 10x slower than data.table's equivalent for large datasets  
  > > DF %>% filter(id=="FOO") user system elapsed 1.952 0.020 1.970 > DT %>% filter(id=="FOO") user system elapsed 0.000 0.000 0.001
- H2O's importFile processes 23GB CSV in 50s with compression and profiling  
  > h2o.importFile also • compresses the data in RAM • profiles the data while reading; e.g. stores min and max per column, for later efficiency gains • included in 50 seconds

## Applications
- large-scale data processing
- high-speed data analysis
- machine learning with H2O

## References cited
- Terdiman, 2000
- Herf, 2001
- Arun Srinivasan implemented forder() in data.table entirely in C

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/matt_dowle.md`](../speakers/matt_dowle.md)
- [`methods/fast_aggregation.md`](../methods/fast_aggregation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

