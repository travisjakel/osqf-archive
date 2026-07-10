---
type: Talk
title: Parsing arbitrary FIX messages in Scala
description: Parsing arbitrary FIX messages in Scala using the type system for efficient data extraction
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Thomas Harte
speaker_slug: thomas_harte
talk_type: Talk
time_slot: "14:10 - 14:30"
file_format: html
file_url: "https://www.osqf.org/archive/2025/ThomasHarte.html"
file_local: "./_cache/files/2025/2025__thomas_harte.html"
slug: 2025__thomas_harte
status: archived
tags: [osqf, 2025, thomas_harte]
---

# Parsing arbitrary FIX messages in Scala

_2025 · Thomas Harte_

**Headline:** Parsing arbitrary FIX messages in Scala using the type system for efficient data extraction

## Source
- File format: `html`
- URL: <https://www.osqf.org/archive/2025/ThomasHarte.html>
- Local: `./_cache/files/2025/2025__thomas_harte.html`
- Talk type: Talk
- Time slot: 14:10 - 14:30

## Topics
- FIX protocol parsing
- functional programming in Scala
- data processing
- type system utilization

## Methods
- Scala XML parsing
- tag-value pair extraction
- enumerated value mapping

## Datasets used
*(none extracted)*

## Code & tools
- `Scala`
- `Spark`
- `quickfix`
- XML parsing in Scala

## Key findings
- Scala's native XML support enables direct FIXML parsing with literal XML copies  
  > Scala supports native XML: you can do a literal copy of any XML in Scala
- For comprehensions are idiomatic for Scala data-pipelining  
  > idiomatic Scala: for comprehension (widespread in Scala for data-pipelining)
- FIX message parsing requires mapping tags to field definitions via XML specs  
  > we need to know which tags to look for we need to know what each tag means

## Applications
- financial data processing
- message parsing in trading systems
- scalable data analytics

## References cited
- FIX Antenna .NET Programmer's Guide
- quickfix/spec/FIX50SP2.xml

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/thomas_harte.md`](../speakers/thomas_harte.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

