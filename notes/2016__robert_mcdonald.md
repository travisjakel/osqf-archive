---
type: Talk
title: The derivmkts package
description: "The derivmkts R package provides functions for option pricing, binomial models, and financial simulations."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Robert McDonald
speaker_slug: robert_mcdonald
talk_type: Lightning
time_slot: "10:20 - 10:50"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/RobertMcDonald.pdf"
file_local: "./_cache/files/2016/2016__robert_mcdonald.pdf"
slug: 2016__robert_mcdonald
status: archived
tags: [osqf, 2016, robert_mcdonald, option_pricing]
---

# The derivmkts package

_2016 · Robert McDonald (Kellogg School of Management, Northwestern University)_

**Headline:** The derivmkts R package provides functions for option pricing, binomial models, and financial simulations.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/RobertMcDonald.pdf>
- Local: `./_cache/files/2016/2016__robert_mcdonald.pdf`
- Talk type: Lightning
- Time slot: 10:20 - 10:50

## Topics
- option pricing
- binomial models
- financial simulations
- risk management
- educational tools

## Methods
- Quincunx simulation
- binomial option pricing
- Merton jump model
- Central Limit Theorem demonstration

## Datasets used
*(none extracted)*

## Code & tools
- R
- `binomopt`
- `quincunx`
- `binomplot`

## Key findings
- The Quincunx simulation visually demonstrates probability distributions and the Central Limit Theorem.  
  > The Central Limit Theorem to the rescue...
- The binomopt function calculates option prices, Greeks, and returns detailed trees for analysis.  
  > Trees returned include stock price, value of option...
- The package supports American and European options with customizable parameters.  
  > Lots of control over output: binomopt <- function(s, k, v, r, tt, d, nstep=10,
- Visual plots show binomial trees with node sizes proportional to probabilities.  
  > The dot size in the plot is proportional to the probability of reaching the node

## Applications
- educational tools for teaching option pricing
- risk management analysis
- financial modeling

## References cited
*(none extracted)*

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/robert_mcdonald.md`](../speakers/robert_mcdonald.md)
- [`topics/option_pricing.md`](../topics/option_pricing.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4)*

