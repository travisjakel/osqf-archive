---
type: Talk
title: SyberiaA development framework for R
description: Syberia is a framework for organizing complex R projects through modular engines and resource-based architecture.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Robert Krzyzanowski
speaker_slug: robert_krzyzanowski
talk_type: Talk
time_slot: "16:20 - 16:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/RobertKrzyzanowski.pdf"
file_local: "./_cache/files/2017/2017__robert_krzyzanowski.pdf"
slug: 2017__robert_krzyzanowski
status: archived
tags: [osqf, 2017, robert_krzyzanowski]
---

# SyberiaA development framework for R

_2017 · Robert Krzyzanowski (Avant)_

**Headline:** Syberia is a framework for organizing complex R projects through modular engines and resource-based architecture.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/RobertKrzyzanowski.pdf>
- Local: `./_cache/files/2017/2017__robert_krzyzanowski.pdf`
- Talk type: Talk
- Time slot: 16:20 - 16:40

## Topics
- R workflow organization
- modular framework design
- test-driven development in R
- machine learning deployment
- dependency management

## Methods
- test-driven development
- modular design
- resource-based architecture

## Datasets used
*(none extracted)*

## Code & tools
- `s3mpi`
- `tundra`
- `director`
- `mungebits2`
- `GitHub`
- `CRAN`

## Key findings
- R workflows are typically loosely organized collections of scripts  
  > R workflows are typically loosely organized collections of scripts
- Packages are not ideal for large multi-user projects in specific domains  
  > Packages work well for recording abstract solutions to problems, but not for large projects maintained by multiple users
- Syberia's modular unit is an engine  
  > The modular design unit is an engine.
- Modeling engine supports production ML in R  
  > Today we are releasing the modeling engine for building and deploying production-ready machine learning products in R.
- Everything in Syberia is a resource  
  > Everything is a resource
- Adapters abstract storage backends  
  > Defining 'adapters' abstracted away the storage backend from the underlying implementation
- Dependency management uses lockfile.yml  
  > # lockfile.yml
packages:
- name: devtools
version: 1.12.0

## Applications
- machine learning deployment
- HFT automation

## References cited
- Machine Learning: The High Interest Credit Card of Technical Debt (2014) NIPS 2014 Workshop proceedings D. Sculley, Gary Holt, Daniel Golovin, et al

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/robert_krzyzanowski.md`](../speakers/robert_krzyzanowski.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (7/7), source=ocr(paddle)*

