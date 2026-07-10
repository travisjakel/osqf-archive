---
type: Talk
title: Interfacing NEOS from RThe rneos Package
description: "The R package rneos provides an XML-RPC client-side API to interface with the NEOS optimization server, enabling remote solving of mathematical programs."
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Pfaff
speaker_slug: pfaff
talk_type: Talk
time_slot: "16:10 - 16:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/BernhardPfaff.pdf"
file_local: "./_cache/files/2011/2011__pfaff.pdf"
slug: 2011__pfaff
status: archived
tags: [osqf, 2011, pfaff]
---

# Interfacing NEOS from RThe rneos Package

_2011 · Pfaff (Invesco Asset Management Deutschland GmbH, Frankfurt am Main)_

**Headline:** The R package rneos provides an XML-RPC client-side API to interface with the NEOS optimization server, enabling remote solving of mathematical programs.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/BernhardPfaff.pdf>
- Local: `./_cache/files/2011/2011__pfaff.pdf`
- Talk type: Talk
- Time slot: 16:10 - 16:30

## Topics
- optimization
- R package
- NEOS server
- API implementation

## Methods
- XML-RPC client-side API
- S4 classes and methods

## Datasets used
*(none extracted)*

## Code & tools
- `XMLRPC`
- `RCurl`
- `XML`
- `rneos`

## Key findings
- rneos implements an XML-RPC client for NEOS with S4 classes  
  > • Implementation of XML-RPC client-side API
• Employs S4 classes and methods (NAMESPACE)
- NEOS supports 15+ optimization problem categories  
  > Bound Constrained Optimization
Combinatorial Optimization and Integer Programming
... 
Unconstrained Optimization
- Example workflow demonstrates two-stage stochastic programming  
  > Workflow: Two-Stage in GMS
$TITLE Stochastic Two-stage program
* TwoStageStochastic.gms: Stochastic Two-stage program.
- API functions are prefixed with 'N'  
  > Nota bene: API functions are prefixed with 'N', hence Nfoo() designates the API function foo.

## Applications
- remote optimization problem solving
- stochastic programming

## References cited
- Czyzyk, J., M. Mesnier, and J. Moré (1998). The neos server.
- Dolan, E. (2001). The neos server 4.0 administrative guide.
- Gropp, W. and J. Moré (1997). Optimization Environments and the NEOS Server.
- Lang, D. (2010). RCurl, XML, XMLRPC R packages

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/pfaff.md`](../speakers/pfaff.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

