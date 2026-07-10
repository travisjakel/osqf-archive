---
type: Talk
title: Mutually Exciting Hawkes Processes for Microstructure Noise Modelling
description: "Applying mutually exciting Hawkes processes to model microstructure noise in financial data, with focus on volatility and correlation estimation."
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Dunand-Chatellet
speaker_slug: dunand_chatellet
talk_type: Talk
time_slot: "13:40 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/ClementDunand.pdf"
file_local: "./_cache/files/2011/2011__dunand_chatellet.pdf"
slug: 2011__dunand_chatellet
status: archived
tags: [osqf, 2011, dunand_chatellet]
---

# Mutually Exciting Hawkes Processes for Microstructure Noise Modelling

_2011 · Dunand-Chatellet (Ecole Polytechnique, Palaiseau, France)_

**Headline:** Applying mutually exciting Hawkes processes to model microstructure noise in financial data, with focus on volatility and correlation estimation.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/ClementDunand.pdf>
- Local: `./_cache/files/2011/2011__dunand_chatellet.pdf`
- Talk type: Talk
- Time slot: 13:40 - 14:00

## Topics
- microstructure noise modeling
- Hawkes processes
- high-frequency trading
- volatility forecasting
- Epps effect
- signature plots

## Methods
- mutually exciting Hawkes processes
- conditional intensity modeling
- signature plot analysis
- Epps effect quantification

## Datasets used
- Euro-Bund futures contracts
- Euro-Bobl futures contracts
- tick-by-tick last traded price data (0.01 increments)

## Code & tools
- R in Finance

## Key findings
- Hawkes processes capture clustering and mean reversion in high-frequency data  
  > Irregular spacing of data in time, clustering of orders... Discrete nature of price variations tick data
- Model parameters α/β govern stability and mean reversion  
  > α > 0 is a scale parameter... β > 0 drives the strength of the time decay
- Closed-form solution exists for mean signature plot  
  > Closed Form formula for the mean Epps effect... can be computed !
- Empirical validation shows parameter estimates match theory  
  > α̂ = 0.024... β̂ = 0.11... µ̂ = 0.016

## Applications
- high-frequency volatility estimation
- correlation analysis between assets
- cross-scale modeling

## References cited
- Andersen [2]
- Epps [3]
- model [1]

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/dunand_chatellet.md`](../speakers/dunand_chatellet.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/4), source=ocr(paddle)*

