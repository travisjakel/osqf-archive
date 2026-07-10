---
type: Talk
title: "The Future of Fast Databases: Lessons from a Decade of QuestDB"
description: "QuestDB's evolution as a high-performance time-series database, focusing on modern data architectures and financial applications."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Steven Sklar
speaker_slug: steven_sklar
talk_type: Talk
time_slot: "16:42 - 17:02"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/StevenSklar.pdf"
file_local: "./_cache/files/2025/2025__steven_sklar.pdf"
slug: 2025__steven_sklar
status: archived
tags: [osqf, 2025, steven_sklar, time_series_databases]
---

# The Future of Fast Databases: Lessons from a Decade of QuestDB

_2025 · Steven Sklar (QuestDB)_

**Headline:** QuestDB's evolution as a high-performance time-series database, focusing on modern data architectures and financial applications.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/StevenSklar.pdf>
- Local: `./_cache/files/2025/2025__steven_sklar.pdf`
- Talk type: Talk
- Time slot: 16:42 - 17:02

## Topics
- time-series databases
- database architecture
- financial data infrastructure
- open source software
- cloud storage integration

## Methods
- vectorized SQL execution
- JIT compilation
- Parquet file optimization
- distributed storage querying

## Datasets used
*(none extracted)*

## Code & tools
- `QuestDB`
- `SQL`
- `Parquet`
- `S3`
- `GCS`
- Azure Blob
- Apache Arrow
- `Pandas`
- `Polars`
- `DuckDB`

## Key findings
- QuestDB ranks 6th in time-series databases with 3.12 score (April 2025)  
  > 6.
6.
↑9.
QuestDB
Time Series, Multi-model
3.12
+0.03
+0.64
- Database supports direct Parquet partition access on object stores  
  > Direct access to Parquet partitions on object store
- Finance-specific features include OHLC materialized views and ASOF joins  
  > Optimised data re-sampling for charts, and mat views... ASOF joins optimised for data troubleshooting
- QuestDB handles 1M+ record ingestion with low-latency queries  
  > Designed for performant frequent million record ingestion and performant frequent queries over multi billion record datasets

## Applications
- financial analysis
- real-time analytics
- sensor data processing
- market data infrastructure

## References cited
- Apache-2.0 license
- DBMS rankings (2025)

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/steven_sklar.md`](../speakers/steven_sklar.md)
- [`topics/time_series_databases.md`](../topics/time_series_databases.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

