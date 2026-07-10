---
type: Talk
title: "Portfolio OptimizationPrice Predictability, Utility Functions, Computational Methods, and Applications"
description: "The talk presents a portfolio optimization approach leveraging price predictability, utility theory, and global optimization methods for practical application."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: John Burkett
speaker_slug: john_burkett
talk_type: Lightning
time_slot: "10:30 - 10:54"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/JohnBurkett.pdf"
file_local: "./_cache/files/2015/2015__john_burkett.pdf"
slug: 2015__john_burkett
status: archived
tags: [osqf, 2015, john_burkett, portfolio_optimization, differential_evolution_algorithm]
---

# Portfolio OptimizationPrice Predictability, Utility Functions, Computational Methods, and Applications

_2015 · John Burkett (University of Rhode Island)_

**Headline:** The talk presents a portfolio optimization approach leveraging price predictability, utility theory, and global optimization methods for practical application.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/JohnBurkett.pdf>
- Local: `./_cache/files/2015/2015__john_burkett.pdf`
- Talk type: Lightning
- Time slot: 10:30 - 10:54

## Topics
- portfolio optimization
- utility functions
- computational methods
- price predictability
- risk management
- applications

## Methods
- differential evolution algorithm
- DEoptim package
- eqdist.etest function from Energy package

## Datasets used
- monthly real after-tax total returns data (25 assets, January 2000 onwards)
- sample with initial CAPE ratio similar to current (October 2001 onwards)

## Code & tools
- `DEoptim`
- Energy package

## Key findings
- Differential evolution algorithm (DEoptim) is used to maximize expected utility by optimizing asset weights.  
  > Expected utility is maximized by choosing asset weights, using a differential evolution algorithm (Hagströmer and Binner 2009) implemented in DEoptim.
- Utility functions must satisfy alternating derivative signs for risk aversion, prudence, and temperance.  
  > U(1) > 0, 'non-satiation,' prefer high mean; U(2) < 0, 'risk aversion,' prefer low variance; U(3) > 0, 'prudence,' prefer positive skewness; U(4) < 0, 'temperance,' prefer low kurtosis.
- Sample selection uses CAPE ratio similarity to approximate future return distributions.  
  > A sample with an initial CAPE ratio similar to the current one starts in October 2001. It is used in the portfolio optimization process outlined below.

## Applications
- portfolio optimization for risk management
- asset allocation strategies

## References cited
- Arrow (1965)
- Eeckhoudt and Schlesinger (2006)
- Hagströmer and Binner (2009)
- Samuelson (1977)

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/john_burkett.md`](../speakers/john_burkett.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)
- [`methods/differential_evolution_algorithm.md`](../methods/differential_evolution_algorithm.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

