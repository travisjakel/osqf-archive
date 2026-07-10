---
type: Talk
title: 7 Steps to Systematic Investing
description: "A tutorial on systematic investing covering data collection, model development, backtesting, risk management, deployment, and ongoing maintenance"
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Jeff Ryan and Justin Shea
speaker_slug: jeff_ryan_and_justin_shea
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/JeffRyan-JustinShea-seminar.pdf"
file_local: "./_cache/files/2025/2025__jeff_ryan_and_justin_shea.pdf"
slug: 2025__jeff_ryan_and_justin_shea
status: archived
tags: [osqf, 2025, jeff_ryan_and_justin_shea]
---

# 7 Steps to Systematic Investing

_2025 · Jeff Ryan and Justin Shea_

**Headline:** A tutorial on systematic investing covering data collection, model development, backtesting, risk management, deployment, and ongoing maintenance

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/JeffRyan-JustinShea-seminar.pdf>
- Local: `./_cache/files/2025/2025__jeff_ryan_and_justin_shea.pdf`
- Talk type: Tutorial

## Topics
- systematic investing
- data collection and preparation
- exploratory data analysis
- model development
- backtesting
- risk management
- deployment
- monitoring and maintenance

## Methods
- machine learning models (neural networks, ensemble methods, time-series algorithms)
- statistical models
- grid search
- Bayesian optimization
- cross-validation
- walk-forward analysis
- out-of-sample testing
- scenario testing
- stress testing
- parameter sensitivity analysis

## Datasets used
*(none extracted)*

## Code & tools
- `LSTM`
- `XGBoost`
- `AWS`
- `GCP`
- `Azure`
- `HPC`

## Key findings
- Data standardization and validation are critical to avoid skewed outcomes  
  > Gather and Standardize: Acquire data from APIs, databases (Bloomberg, Refinitiv, quantKiosk, Quandl, CoinGecko), ensuring consistent timestamps and reference IDs.
- EDA helps identify redundant features and formulate market inefficiency hypotheses  
  > Hypothesis Formulation: Based on observations, hypothesize how the model might capture market inefficiencies (e.g., patterns in volatility or cyclical behaviors).
- Hyperparameter tuning must use cross-validation to prevent overfitting  
  > Hyperparameter Tuning: Employ grid search or Bayesian optimization, using cross-validation for robust parameter selection.
- Walk-forward analysis better mimics real-world adaptability than static backtesting  
  > Walk-Forward Analysis: Retrain periodically on rolling windows to mimic real-world conditions and test adaptability.
- Stress testing extreme scenarios is essential for robust risk management  
  > Stress Test Extremes: Shock critical variables to test model output
- Deployment requires cloud infrastructure and latency-aware execution mechanisms  
  > Infrastructure Setup: Deploy on cloud platforms (AWS, GCP, Azure) or on-premise HPC, ensuring sufficient compute resources for the model's needs.
- Ongoing monitoring must detect model drift and performance degradation  
  > Model Drift Detection: Observe data distribution shifts or market condition changes that may degrade performance.

## Applications
- systematic investing
- model deployment
- risk management
- backtesting strategies

## References cited
*(none extracted)*

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/jeff_ryan_and_justin_shea.md`](../speakers/jeff_ryan_and_justin_shea.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/7), source=ocr(paddle)*

