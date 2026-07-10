---
type: Talk
title: "Package 'Intermediate and Long Memory Time Series' (ILMTS)"
description: R package ILMTS for simulating/detecting intermediate/long memory time series processes
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Karl-Kuno Kunze
speaker_slug: karl_kuno_kunze
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KarlKunoKunze.pdf"
file_local: "./_cache/files/2014/2014__karl_kuno_kunze.pdf"
slug: 2014__karl_kuno_kunze
status: archived
tags: [osqf, 2014, karl_kuno_kunze]
---

# Package 'Intermediate and Long Memory Time Series' (ILMTS)

_2014 · Karl-Kuno Kunze_

**Headline:** R package ILMTS for simulating/detecting intermediate/long memory time series processes

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KarlKunoKunze.pdf>
- Local: `./_cache/files/2014/2014__karl_kuno_kunze.pdf`
- Talk type: Lightning

## Topics
- long memory time series
- intermediate memory processes
- fractional Brownian motion
- statistical estimation methods

## Methods
- GPH method
- Cholesky decomposition
- Detrended Fluctuation Analysis
- R/S method
- Fractional Brownian Motion simulation
- FFT-based simulation

## Datasets used
*(none extracted)*

## Code & tools
- R
- Cholesky decomposition
- `FFT`
- `GPH`

## Key findings
- Fractional Brownian motion defined via Cauchy formula with Hurst exponent H  
  > Z t     Z s00 "Z s0          #                                           Z t
- Long memory processes have non-summable autocorrelations (H > 1/2)  
  > Autocorrela+ons are not summable:   ⇢(k) = 1
- Intermediate memory processes have summable autocorrelations (H < 1/2)  
  > Autocorrela+ons are summable:         ⇢(k) < 1
- Range/standard deviation ratio Qk ≈ k^H for memory estimation  
  > Qk = Rk /Sk ⇠ k H
- GPH method estimates H via log-periodogram regression  
  > log f ( ) ⇡ (1                  2H) ⇤ log( ) + . . .

## Applications
- risk management
- funds management
- trading opportunities

## References cited
*(none extracted)*

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/karl_kuno_kunze.md`](../speakers/karl_kuno_kunze.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=40% (2/5)*

