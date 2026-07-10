---
type: Talk
title: ROIThe R Optimization Infrastructure Package
description: "ROI is an R package providing a unified infrastructure for solving various optimization problems, including portfolio optimization and L1 regression."
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Theussl
speaker_slug: theussl
talk_type: Talk
time_slot: "15:35 - 15:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/StefanTheussl.pdf"
file_local: "./_cache/files/2012/2012__theussl.pdf"
slug: 2012__theussl
status: archived
tags: [osqf, 2012, theussl, linear_programming_lp]
---

# ROIThe R Optimization Infrastructure Package

_2012 · Theussl (Department of Finance, Accounting and Statistics, Institute for Statistics and Mathematics, WU Wirtschaftsuniversität Wien)_

**Headline:** ROI is an R package providing a unified infrastructure for solving various optimization problems, including portfolio optimization and L1 regression.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/StefanTheussl.pdf>
- Local: `./_cache/files/2012/2012__theussl.pdf`
- Talk type: Talk
- Time slot: 15:35 - 15:55

## Topics
- optimization infrastructure
- mathematical programming
- R solvers
- portfolio optimization
- L1 regression
- solver interoperability

## Methods
- Linear Programming (LP)
- Quadratic Programming (QP)
- Mixed Integer Programming (MILP)
- ROI's OP() problem constructor
- L_constraint()
- Q_objective()
- ROI_solve() solver interface

## Datasets used
- LPP2005.RET (fPortfolio)
- stackloss (quantreg)

## Code & tools
- `ROI`
- `fPortfolio`
- `quantreg`
- `quadprog`
- `Rcplex`
- `Rglpk`
- `Rsymphony`
- `IpSolve`
- `nlminb`
- optim()
- nlminb()
- Q_objective()
- L_constraint()
- ROI_solve()

## Key findings
- ROI provides a transparent, uniform framework for handling multiple problem classes (LP, QP, MILP) via S3 objects.  
  > A general framework for optimization should be capable of handling several different problem classes in a transparent and uniform way.
- ROI supports multiple solvers (e.g., glpk, cplex, quadprog) with canonicalized status codes and solution formats.  
  > Solution canonicalization; Status code canonicalization.
- Portfolio optimization examples demonstrate ROI's ability to solve mean-variance problems with identical results across solvers (cplex/quadprog).  
  > sqrt(t(w) %*% cov(lppData) %*% w) [,1] 0.2450869 (both solvers)
- L1 regression problems are formulated via ROI's OP() function and solved with glpk, matching results from quantreg's rq().  
  > ROI_solve(..., solver = "glpk")$solution [...] -39.68985507 0.83188406 [...] (matches rq() output)

## Applications
- portfolio optimization
- L1 regression

## References cited
- Brooks and Dula (2009)
- Würtz et al (2009)

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/theussl.md`](../speakers/theussl.md)
- [`methods/linear_programming_lp.md`](../methods/linear_programming_lp.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4), source=ocr(paddle)*

