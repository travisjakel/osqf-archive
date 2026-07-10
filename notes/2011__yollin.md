---
type: Talk
title: Can you do better than cap-weighted equity benchmarks
description: The talk explores alternative index constructions that outperform cap-weighted equity benchmarks using minimum variance and CVaR optimization techniques.
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Yollin
speaker_slug: yollin
talk_type: Talk
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/GuyYollin.pdf"
file_local: "./_cache/files/2011/2011__yollin.pdf"
slug: 2011__yollin
status: archived
tags: [osqf, 2011, yollin, mean_variance_portfolio_optimization]
---

# Can you do better than cap-weighted equity benchmarks

_2011 · Yollin (Principal Consultant, r-programming.org; Visiting Lecturer, University of Washington)_

**Headline:** The talk explores alternative index constructions that outperform cap-weighted equity benchmarks using minimum variance and CVaR optimization techniques.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/GuyYollin.pdf>
- Local: `./_cache/files/2011/2011__yollin.pdf`
- Talk type: Talk

## Topics
- efficient indexes
- portfolio optimization
- factor models
- risk management
- index fund performance

## Methods
- mean-variance portfolio optimization
- quadratic programming
- principal component analysis (PCA)
- CVaR optimization
- factor models

## Datasets used
- S&P 500 constituents
- Historical S&P 500 constituent weights
- Historical stock prices

## Code & tools
- `quadprog`
- `Rglpk`
- `RevoScaleR`
- `S-PLUS`

## Key findings
- All minimum variance portfolios and the minimum CVaR portfolio outperformed the S&P 500 during the testing period.  
  > all minimum variance portfolios and the minimum CVaR portfolio outperformed the S&P 500 Index during the testing period
- Minimum variance strategies achieved higher annualized returns and lower volatility compared to the S&P 500.  
  > higher annualized return, lower annualized volatility, smaller conditional value-at-risk, smaller maximum drawdown
- CVaR optimization via linear programming provided risk-adjusted returns superior to traditional benchmarks.  
  > CVaR Optimization via Linear Programming... can be carried out with a general-purpose LP solver

## Applications
- alternative index fund construction
- risk management strategies

## References cited
- Amenc, Goltz, Martellini, 'Efficient Indexation: An Alternative to Cap-Weighted Indices', January 2010
- Haugen and Baker, Journal of Portfolio Management, 'The efficient market inefficiency of capitalization-weighted stock portfolios', Spring 1991
- Zivot, 'Modeling Financial Time Series with S-PLUS, 2nd Edition', 2005

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/yollin.md`](../speakers/yollin.md)
- [`methods/mean_variance_portfolio_optimization.md`](../methods/mean_variance_portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

