---
type: Talk
title: "Non-Fungible Token Transactions: Data and Challenges"
description: Modeling NFT transaction durations and quantifying illiquidity challenges using Bayesian ACD models.
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Jason Cho
speaker_slug: jason_cho
talk_type: Lightning
time_slot: "15:45 - 15:52"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/JasonCho.pdf"
file_local: "./_cache/files/2023/2023__jason_cho.pdf"
slug: 2023__jason_cho
status: archived
tags: [osqf, 2023, jason_cho]
---

# Non-Fungible Token Transactions: Data and Challenges

_2023 · Jason Cho (Cornell University)_

**Headline:** Modeling NFT transaction durations and quantifying illiquidity challenges using Bayesian ACD models.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/JasonCho.pdf>
- Local: `./_cache/files/2023/2023__jason_cho.pdf`
- Talk type: Lightning
- Time slot: 15:45 - 15:52

## Topics
- NFT illiquidity
- duration modeling
- Bayesian statistics
- uncertainty quantification
- NFT returns

## Methods
- Autoregressive Conditional Duration (ACD) model
- Bayesian inference (R stan package)
- RMSE evaluation

## Datasets used
- Bored Ape Yacht Club (BAYC)
- CloneX
- Doodles
- Moonbirds (Gallop API data 2022-2023)

## Code & tools
- R stan (Bayesian framework)

## Key findings
- NFTs exhibit extreme illiquidity with <3 annual transactions for BAYC tokens.  
  > Average number of transactions per token for Bored Ape Yacht Club was less than 3 transactions per year.
- ACD model achieved 7.12 RMSE for Doodles vs 13.58 for naive baseline.  
  > ACD 7.12... Simple Average 10.86... RMSE on the held-out test data set.
- 95% confidence intervals show BAYC sales occur every 30 days vs 7-8 days for other collections.  
  > On average, NFTs were sold within 7 to 8 days... 30 days for the Bored Ape Yacht Club.

## Applications
*(none extracted)*

## References cited
- Kong and Lin, 2022
- Bao and Roubaud, 2022
- Mazur, 2021
- Dowling, 2022a
- Dowling, 2022b
- Ante, 2022

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/jason_cho.md`](../speakers/jason_cho.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

