---
type: Talk
title: Risk Parity Portfolios with the package riskParityPortfolio
description: "Introduces the R package riskParityPortfolio for computing risk parity portfolios, discussing formulations, and illustrating applications in portfolio optimization."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Daniel Palomar
speaker_slug: daniel_palomar
talk_type: Lightning
time_slot: "15:26 - 15:32"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/DanielPalomar.pdf"
file_local: "./_cache/files/2019/2019__daniel_palomar.pdf"
slug: 2019__daniel_palomar
status: archived
tags: [osqf, 2019, daniel_palomar, euler_s_theorem_risk_decomposition]
---

# Risk Parity Portfolios with the package riskParityPortfolio

_2019 · Daniel Palomar (Hong Kong University of Science and Technology (HKUST))_

**Headline:** Introduces the R package riskParityPortfolio for computing risk parity portfolios, discussing formulations, and illustrating applications in portfolio optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/DanielPalomar.pdf>
- Local: `./_cache/files/2019/2019__daniel_palomar.pdf`
- Talk type: Lightning
- Time slot: 15:26 - 15:32

## Topics
- risk parity portfolios
- portfolio optimization
- R package development
- risk contribution
- Markowitz portfolio limitations
- computational methods for risk parity

## Methods
- Euler's theorem for risk decomposition
- naive diagonal formulation
- vanilla convex formulation
- nonconvex optimization
- SCRIP algorithm

## Datasets used
*(none extracted)*

## Code & tools
- `riskParityPortfolio`
- R
- `PortfolioAnalytics`
- `FRAPO`
- `FinCovRegularization`

## Key findings
- Markowitz portfolios are sensitive to parameter errors and use variance as risk measure.  
  > variance is not a good measure of risk, portfolio is highly sensitive to parameter estimation errors
- Risk parity equalizes risk contributions across assets.  
  > RCi = 1/N σ(w) (risk parity portfolio attempts to equalize risk contributions)
- riskParityPortfolio offers efficient computation for multiple RPP formulations.  
  > riskParityPortfolio is the first package specifically devised for the computation of different versions of RPP in an efficient way
- Nonconvex formulations allow incorporating expected returns and constraints.  
  > minimize ∑(wi(Σw)i − wj(Σw)j)^2 − λwTµ subject to w ≥ 0, 1Tw=1, l ≤ w ≤ u

## Applications
- portfolio management
- risk diversification
- computational finance

## References cited
- T. Roncalli, Introduction to Risk Parity and Budgeting (2013)
- E. Qian, Risk Parity Fundamentals (2016)
- F. Spinu, An algorithm for computing risk parity weights (2013)
- Y. Feng and D. P. Palomar, SCRIP: Successive convex optimization methods for risk parity portfolios design (2015)

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/daniel_palomar.md`](../speakers/daniel_palomar.md)
- [`methods/euler_s_theorem_risk_decomposition.md`](../methods/euler_s_theorem_risk_decomposition.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4)*

