---
type: Talk
title: R and proto
description: "Exploration of prototype programming in R, comparing it with conventional object-oriented approaches and demonstrating practical applications."
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Kates
speaker_slug: kates
talk_type: Keynote
time_slot: "15:00 - 15:50"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/LouisKates.pptx"
file_local: "./_cache/files/2011/2011__kates.pptx"
slug: 2011__kates
status: archived
tags: [osqf, 2011, kates]
---

# R and proto

_2011 · Kates (GKX Associates Inc.)_

**Headline:** Exploration of prototype programming in R, comparing it with conventional object-oriented approaches and demonstrating practical applications.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/LouisKates.pptx>
- Local: `./_cache/files/2011/2011__kates.pptx`
- Talk type: Keynote
- Time slot: 15:00 - 15:50

## Topics
- prototype programming
- object-oriented programming
- R language
- GUI development
- text processing

## Methods
- prototype-based programming
- environment manipulation
- delegation
- currying

## Datasets used
*(none extracted)*

## Code & tools
- `proto`
- `gWidgets`
- `gsubfn`
- R
- `S3`
- `S4`
- `R.oo`
- `futile.paradigm`

## Key findings
- Prototype programming simplifies OO by eliminating classes as a primitive notion.  
  > Prototype-based programming is a type of object oriented programming in which classes are not a primitive notion though its sufficiently powerful to encompass them.
- Environments in R allow separation of identity and contents, enabling prototype inheritance.  
  > Environment: contents ≠ identity
- Proto package enables creating objects with methods and properties using delegation.  
  > ch <- p$proto(x = 0, y = 0)

## Applications
- user interfaces
- graphics
- reporting
- logging
- text processing

## References cited
- SELF manual
- Agesen et al. '92

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/kates.md`](../speakers/kates.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

