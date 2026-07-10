---
type: Talk
title: "qicR: Quantum Information & Computation in R - Bringing quantum computing to the R ecosystem"
description: "Introducing qicR: An R package for quantum computing, with applications in finance and optimization"
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Jay Panchal
speaker_slug: jay_panchal
talk_type: Talk
time_slot: "16:05 - 16:25"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/JawaharPanchal.pdf"
file_local: "./_cache/files/2022/2022__jay_panchal.pdf"
slug: 2022__jay_panchal
status: archived
tags: [osqf, 2022, jay_panchal, variational_quantum_eigensolver_vqe]
---

# qicR: Quantum Information & Computation in R - Bringing quantum computing to the R ecosystem

_2022 · Jay Panchal_

**Headline:** Introducing qicR: An R package for quantum computing, with applications in finance and optimization

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/JawaharPanchal.pdf>
- Local: `./_cache/files/2022/2022__jay_panchal.pdf`
- Talk type: Talk
- Time slot: 16:05 - 16:25

## Topics
- quantum computing
- R/qicR integration
- portfolio optimization
- quantum algorithms
- quantum annealing
- financial applications

## Methods
- Variational Quantum Eigensolver (VQE)
- Quantum Approximate Optimization Algorithm (QAOA)
- QuTip simulations
- Qiskit circuits
- IQS qubit registers
- Qrack GPU execution

## Datasets used
*(none extracted)*

## Code & tools
- `qicR`
- `QuTip`
- `Qiskit`
- `Cirq`
- `IQS`
- `Qrack`
- `Rcpp`
- `Reticulate`

## Key findings
- qicR enables R users to run quantum algorithms like VQE via Python/R integration  
  > Integration\n\tQuTip: Target to apply measurement/density operators to prepare for VQE\n\tQiskit: Target to run VQE algorithm and corresponding circuit on arbitrary architecture
- Portfolio optimization using VQE shows promise but faces NISQ hardware limitations  
  > QC application in prototype/demo stage, limitation on hardware even with VQE algorithm
- D-Wave's annealing approach outperforms gate-based systems for finance optimization  
  > Nota Bene: The adiabatic/annealing solution from D-Wave here has significantly higher success due to higher flux qubit counts for optimization-specific problems
- Quantum volume estimates suggest 1000 logical qubits needed for practical advantage  
  > Estimated quantum volume VQ ≳ 1000 (logical qubits) → ∼ 1000X (physical qubits) factor for QEC

## Applications
- portfolio optimization
- option pricing simulation
- quantum machine learning
- risk management (VaR/CVaR)

## References cited
- Barkoutsos, Panagiotis Kl et al. "Improving variational quantum optimization using CVaR." Quantum 4 (2020): 256.
- Grant, Erica et al. "Benchmarking quantum annealing controls with portfolio optimization." Physical Review Applied 15.1 (2021): 014012.
- Nielsen, Michael A. and Isaac Chuang. "Quantum computation and quantum information." (2002)

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/jay_panchal.md`](../speakers/jay_panchal.md)
- [`methods/variational_quantum_eigensolver_vqe.md`](../methods/variational_quantum_eigensolver_vqe.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

