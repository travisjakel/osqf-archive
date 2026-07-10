---
type: Talk
title: Building Simple Redis Data Caches
description: "This talk demonstrates how to use Redis with Rcpp for efficient data caching, emphasizing speed and the rredis package."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2014/2014__dirk_eddelbuettel_2.pdf"
slug: 2014__dirk_eddelbuettel_2
status: archived
tags: [osqf, 2014, dirk_eddelbuettel]
---

# Building Simple Redis Data Caches

_2014 · Dirk Eddelbuettel_

**Headline:** This talk demonstrates how to use Redis with Rcpp for efficient data caching, emphasizing speed and the rredis package.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2014/2014__dirk_eddelbuettel_2.pdf`
- Talk type: Lightning

## Topics
- Redis data structures
- Rcpp integration
- Performance optimization
- Time series storage
- R package development
- Real-time data processing

## Methods
- Rcpp integration with Redis
- Binary protocol for data serialization
- Time series storage using Redis ZADD commands
- RApiSerialize for C++ level serialization

## Datasets used
*(none extracted)*

## Code & tools
- `rredis`
- `RApiSerialize`
- `RcppRedis`
- `xts`
- `Redis`
- `hiredis`

## Key findings
- Binary serialization via Rcpp is significantly faster than ASCII-based methods  
  > setAsBinary(dat) 1 0.127 1.000
- RApiSerialize enables C++-level serialization without R API calls  
  > It does just one thing: give us serialization and deserialization from the R API at the C(++) level.
- Redis ZADD commands handle time series data efficiently  
  > redisZAdd("ex:ascii:series", dat[i,1], dat[i,])

## Applications
- Real-time data processing
- Trading applications

## References cited
- hiredis (GitHub repository)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

