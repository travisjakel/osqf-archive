---
type: Talk
title: Data Mining with Markowitz Portfolio Optimization in Higher Dimensions
description: The talk explores applying Markowitz portfolio optimization in high-dimensional settings using data mining techniques.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Mark Bennett
speaker_slug: mark_bennett
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MarkBennett.pdf"
file_local: "./_cache/files/2014/2014__mark_bennett.pdf"
slug: 2014__mark_bennett
status: archived
tags: [osqf, 2014, mark_bennett, portfolio_optimization, markowitz_portfolio_optimization]
---

# Data Mining with Markowitz Portfolio Optimization in Higher Dimensions

_2014 · Mark Bennett (University of Chicago)_

**Headline:** The talk explores applying Markowitz portfolio optimization in high-dimensional settings using data mining techniques.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/MarkBennett.pdf>
- Local: `./_cache/files/2014/2014__mark_bennett.pdf`
- Talk type: Lightning

## Topics
- portfolio optimization
- data mining
- high-dimensional statistics
- graphical models
- financial analytics

## Methods
- Markowitz portfolio optimization
- Glasso (Graphical Lasso)
- huge package for high-dimensional graph estimation
- quadprog for quadratic programming
- covariance matrix thresholding

## Datasets used
*(none extracted)*

## Code & tools
- R
- `huge`
- `quadprog`
- `Glasso`

## Key findings
- Portfolio theory and graphical models are natural tools for handling market uncertainty and portfolio complexity.  
  > Portfolio Theory and Graphical Models are Natural Tools for Market Uncertainty, Portfolio Complexity
- The talk emphasizes data mining in scenarios where the number of features (p) is comparable to the number of observations (N).  
  > Perform data mining where N ≈ p
- The Glasso method and huge package are used to estimate sparse covariance matrices in high-dimensional settings.  
  > Huge lambda.min.ratio: 0.4 NPN, Glasso Cov Matrix Threshold: 1.7
- The optimization problem involves minimizing portfolio variance subject to return constraints and no short sales.  
  > argmin w T ∑w, (1) for each target level of return μ P where w T ∑w is the return variance

## Applications
- portfolio optimization
- risk management
- financial analytics

## References cited
- Ruppert, D., Statistics and Data Analysis for Financial Engineering, Springer Texts in Statistics. Springer, New York, ISBN 9781441977861, 2011.
- Zhao, T., Liu, H., Roeder, K., Lafferty, J., Wasserman, L., The huge Package for High-dimensional Undirected Graph Estimation in R, Journal of Machine Learning Research 13 (2012) 1059-1062, April 2012.

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/mark_bennett.md`](../speakers/mark_bennett.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)
- [`methods/markowitz_portfolio_optimization.md`](../methods/markowitz_portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

