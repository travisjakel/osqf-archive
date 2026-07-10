---
type: Talk
title: Cross-Over Options
description: Introduces cross-over (CO) options – a novel class of path-dependent volatility instruments with robust replication strategies and applications to vanilla options and variance trading.
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Oleg Bondarenko
speaker_slug: oleg_bondarenko
talk_type: Talk
time_slot: "09:45 - 10:05"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/OlegBondarenko.pdf"
file_local: "./_cache/files/2025/2025__oleg_bondarenko.pdf"
slug: 2025__oleg_bondarenko
status: archived
tags: [osqf, 2025, oleg_bondarenko]
---

# Cross-Over Options

_2025 · Oleg Bondarenko (University of Illinois at Chicago)_

**Headline:** Introduces cross-over (CO) options – a novel class of path-dependent volatility instruments with robust replication strategies and applications to vanilla options and variance trading.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/OlegBondarenko.pdf>
- Local: `./_cache/files/2025/2025__oleg_bondarenko.pdf`
- Talk type: Talk
- Time slot: 09:45 - 10:05

## Topics
- path-dependent options
- volatility instruments
- replication strategies
- variance trading
- model-free finance
- risk management

## Methods
- Aggregation Property (AP)
- Carr and Madan (1998) spanning formula
- Monte-Carlo simulations
- local time process analysis

## Datasets used
*(none extracted)*

## Code & tools
- Monte-Carlo simulations

## Key findings
- CO options can be robustly replicated under general conditions (including jumps) with no discretization errors.  
  > A CO option can be robustly replicated under very general conditions Model-free – general price process, including jumps Exact at any frequency – no discretization or jump errors.
- Vanilla options are a special case of CO options, enabling new decomposition of their value into continuous and jump components.  
  > A vanilla option is a special case of CO options. This connection produces a number of new results and applications for vanilla options
- Modified realized variance (RV(3)) satisfies AP and has market price equal to ideal VIX².  
  > Modified realized variance RVT(3) satisfies AP and its market price EQ0[RVT(3)] = 2∫∞0 M0(K,T)/K² dK = MFIV = Ideal VIX²

## Applications
- variance trading
- risk management
- generalized variance contracts
- volatility forecasting
- option replication

## References cited
- Bondarenko (2014, JE)
- Carr and Madan (1998)
- Bondarenko (2004)
- Andersen and Bondarenko (2007)
- Schneider and Trojani (2019)
- Orlowski, Schneider, Trojani (2021)
- Carr and Jarrow (1990)

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/oleg_bondarenko.md`](../speakers/oleg_bondarenko.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

