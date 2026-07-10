---
type: Talk
title: "Portfolio OptimizationUtility, Computaton, Equities Applications"
description: "Portfolio optimization using utility functions, computational methods, and applications to equities."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: John Burkett
speaker_slug: john_burkett
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/JohnBurkett.pdf"
file_local: "./_cache/files/2014/2014__john_burkett.pdf"
slug: 2014__john_burkett
status: archived
tags: [osqf, 2014, john_burkett, portfolio_optimization]
---

# Portfolio OptimizationUtility, Computaton, Equities Applications

_2014 · John Burkett (University of Rhode Island Department of Economics)_

**Headline:** Portfolio optimization using utility functions, computational methods, and applications to equities.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/JohnBurkett.pdf>
- Local: `./_cache/files/2014/2014__john_burkett.pdf`
- Talk type: Lightning

## Topics
- portfolio optimization
- utility functions
- computational methods
- equities applications

## Methods
- mean-variance efficient frontier
- minimum variance portfolio
- tangency portfolio
- Anderson-Darling normality tests
- differential evolution algorithm

## Datasets used
- Yahoo Finance adjusted closing prices (27 of 40 Value 40 Fund stocks, 1999-2014)
- Federated National Holding Co. returns (distribution data)

## Code & tools
- `fPortfolio`
- `nortest`
- `DEoptim`

## Key findings
- Minimum variance portfolio assigns positive weights to 16 of 23 stocks in Value 40 Fund.  
  > the minimum variance portfolio gives positive weights to 16 of the 23
- Tangency portfolio assigns positive weights to 14 of 23 stocks in Value 40 Fund.  
  > the tangency portfolio gives positive weights to 14 of the 23
- 18 of 23 stocks fail Gaussian normality tests using Anderson-Darling.  
  > Anderson-Darling normality tests... reject the Gaussian hypothesis for 18 of the 23.
- Utility function derivatives alternate in sign to reflect decreasing sensitivity to losses.  
  > derivatives alternate in sign: + -, +, -, ...
- Differential evolution algorithm selects specific stock weights for optimal utility.  
  > weight .2151 .2717 .1028 .0547 .3557

## Applications
- equities portfolio optimization

## References cited
- Arrow (1965)
- Denuit and Rey (2010)
- Hagströmer and Binner (2009)
- Samuelson (1977)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/john_burkett.md`](../speakers/john_burkett.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

