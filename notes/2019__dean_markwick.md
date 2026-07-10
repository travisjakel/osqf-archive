---
type: Talk
title: Hierarchical nonparametric Hawkes processes with applications to finance
description: Application of hierarchical nonparametric Hawkes processes to predict FX trade patterns and model financial events like flash crashes and macroeconomic impacts
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Dean Markwick
speaker_slug: dean_markwick
talk_type: Lightning
time_slot: "09:05 - 09:11"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/DeanMarkwick.pdf"
file_local: "./_cache/files/2019/2019__dean_markwick.pdf"
slug: 2019__dean_markwick
status: archived
tags: [osqf, 2019, dean_markwick, hawkes_processes]
---

# Hierarchical nonparametric Hawkes processes with applications to finance

_2019 · Dean Markwick_

**Headline:** Application of hierarchical nonparametric Hawkes processes to predict FX trade patterns and model financial events like flash crashes and macroeconomic impacts

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/DeanMarkwick.pdf>
- Local: `./_cache/files/2019/2019__dean_markwick.pdf`
- Talk type: Lightning
- Time slot: 09:05 - 09:11

## Topics
- Hawkes processes
- FX trade prediction
- hierarchical Dirichlet processes
- financial event modeling
- high-frequency trading

## Methods
- Hierarchical Dirichlet Process
- Hawkes Processes
- R package dirichletprocess

## Datasets used
*(none extracted)*

## Code & tools
- dirichletprocess R package
- GitHub repository
- `CRAN`
- BestX Trade Cost Analysis software

## Key findings
- FX trade patterns exhibit distinct temporal clustering across global trading centers  
  > Patterns in FX Data\n                3e−05\n\n                2e−05\n      Density\n\n                1e−05\n\n                0e+00\n\n                        00:00   06:00   12:00   18:00   00:00
- Each trade has a 30% chance of triggering subsequent trades within 20 seconds  
  > • Each trade on average has a 30% chance of causing another\n  trade.\n\n• This impact lasts for about 20 seconds.
- Hierarchical Dirichlet Process enables sharing of statistical strength across trading days  
  > Hierarchical Dirichlet Process\n\n j = Monday   j = Tuesday   j = Wednesday

## Applications
- Flash crash prediction
- High-frequency Value at Risk
- Macroeconomic news impact analysis
- FX trade cost optimization

## References cited
- Filimonov and Sornette (2012)
- Chavez-Demoulin and McGill (2012)
- Rambaldi et al (2015)

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/dean_markwick.md`](../speakers/dean_markwick.md)
- [`topics/hawkes_processes.md`](../topics/hawkes_processes.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

