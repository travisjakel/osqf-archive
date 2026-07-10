---
type: Talk
title: Hierarchical Hidden Markov Models in High-Frequency Stock Markets
description: Application of hierarchical Hidden Markov Models to identify and predict price trends in high-frequency stock markets using feature engineering and statistical modeling.
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Luis Damiano
speaker_slug: luis_damiano
talk_type: Talk
time_slot: "14:20 - 14:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/LuisDamiano.pdf"
file_local: "./_cache/files/2018/2018__luis_damiano.pdf"
slug: 2018__luis_damiano
status: archived
tags: [osqf, 2018, luis_damiano]
---

# Hierarchical Hidden Markov Models in High-Frequency Stock Markets

_2018 · Luis Damiano_

**Headline:** Application of hierarchical Hidden Markov Models to identify and predict price trends in high-frequency stock markets using feature engineering and statistical modeling.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/LuisDamiano.pdf>
- Local: `./_cache/files/2018/2018__luis_damiano.pdf`
- Talk type: Talk
- Time slot: 14:20 - 14:40

## Topics
- Hierarchical Hidden Markov Models
- High-Frequency Trading
- Feature Engineering
- Statistical Modeling
- Market Trend Prediction

## Methods
- Hierarchical Hidden Markov Models (HHMM)
- Technical analysis rules for feature combination
- Clustering with Markovian memory

## Datasets used
- SPY 2018-01-04 tick-by-tick data
- Toronto Stock Exchange (TSX) stocks: BBDb, BCE, CTCa, ECA, G, K, MGa, NXY, SJRb, SU, TCKb, TLM
- L1 data for EFA, GLD, SPY, XLB, XLE, XLF, XLI, XLK, XLP, XLU, XLV, XLY (15 trading days each)

## Code & tools
- R/Finance (conference)
- Technical analysis rules (custom)

## Key findings
- HHMM outperforms buy-and-hold strategy in 12 stocks with returns uncorrelated to B&H  
  > • For most stocks, HHMM outperforms buy & hold (B&H). • Returns virtually uncorrelated with B&H.
- Model generalizes to 55M observations across multiple asset classes  
  > A total of 55 million observations... different assets in more competitive and liquid markets.
- Latent states may contain information about returns distribution  
  > Do latent states contain information about the returns?
- Feature engineering improves model performance through noise reduction and non-linear capture  
  > • Statistical properties: captures non-linearities... • Noise reduction: by discretization

## Applications
- High-frequency trading strategy development
- Market trend prediction
- Systematic trading

## References cited
- Domingos 2012
- Write-up (last slides)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/luis_damiano.md`](../speakers/luis_damiano.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4)*

