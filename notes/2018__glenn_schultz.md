---
type: Talk
title: Fixed Income Analytics at ScaleUsing R and Bond Lab to Improve the UST Securities Market
description: Bond Lab is an R package for fixed-income analytics that connects to AWS UST and Agency MBS security databases to improve UST securities market analysis.
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Glenn Schultz
speaker_slug: glenn_schultz
talk_type: Lightning
time_slot: ~
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/GlennSchultz.pptx"
file_local: "./_cache/files/2018/2018__glenn_schultz.pptx"
slug: 2018__glenn_schultz
status: archived
tags: [osqf, 2018, glenn_schultz]
---

# Fixed Income Analytics at ScaleUsing R and Bond Lab to Improve the UST Securities Market

_2018 · Glenn Schultz_

**Headline:** Bond Lab is an R package for fixed-income analytics that connects to AWS UST and Agency MBS security databases to improve UST securities market analysis.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/GlennSchultz.pptx>
- Local: `./_cache/files/2018/2018__glenn_schultz.pptx`
- Talk type: Lightning

## Topics
- fixed-income analytics
- R package development
- financial data infrastructure

## Methods
- Hull White interest rate simulation model
- Termstruc package implementation

## Datasets used
- AWS UST security database
- AWS Agency MBS security database

## Code & tools
- Bond Lab
- `Termstruc`
- AWS Lambda
- `httr`
- `simplify2array`

## Key findings
- Bond Lab connects to AWS UST and Agency MBS databases  
  > our goal, a package that connects to our AWS UST and Agency MBS security database
- Hull White model is implemented in Bond Lab  
  > Interest rate simulation model (Hull White)
- API returns 14 bond statistics including duration and convexity  
  > List of 14 $ cusip $ blPrice $ wal ... $ convexity

## Applications
- UST securities market analysis
- bond pricing analytics

## References cited
*(none extracted)*

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/glenn_schultz.md`](../speakers/glenn_schultz.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

