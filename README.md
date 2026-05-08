# Empirical Bayes: A Self-Directed Study
**MA677 Conceptual Foundations of Statistics | Spring 2026**  
**Madeleine Livaudais**

## Overview

This repository contains the materials for my final project, a self-directed study of Empirical Bayes 
through Chapter 6 of *Computer Age Statistical Inference* by Efron and Hastie. The paper explores the 
non-parametric empirical Bayes approach through Robbins' formula, works through its mathematical 
derivation, and implements it on the Shakespeare vocabulary data from the text.

## Repository Structure

```
├── Paper_Empirical_Bayes.Rmd        # R Markdown source file for the paper
├── Paper_Empirical_Bayes.pdf        # Final compiled paper
├── robbins_formula_Shakespeare.R    # R script implementing Robbins' formula on Shakespeare data
├── notes/                           # Hand-written derivation notes (PDF)
├── images/                          # Images used in the paper
├── ai_transcripts/                  # Full transcripts of AI conversations used during study
└── README.md
```

## How to Run the R Code

1. Open `robbins_formula_Shakespeare.R` in R or RStudio
2. Run the script — no additional packages are required
3. The script defines a general `robbins_formula()` function and applies it to the Shakespeare word 
frequency data from CASI Chapter 6

## Key Topics Covered

- Robbins' formula and the non-parametric empirical Bayes approach
- Mathematical derivation of the posterior mean under a Poisson model
- The philosophical concern of "using data twice" and its asymptotic justification
- Implementation of shrinkage estimation on the Shakespeare missing vocabulary problem

## Notes on AI Use

Claude (Anthropic) was used as a study aid during this project. Full transcripts are available in the 
`ai_transcripts/` folder. See the Notes on AI Use section in the paper for complete disclosure.

## Reference

Efron, B., & Hastie, T. (2016). *Computer Age Statistical Inference: Algorithms, Evidence, and Data Science*. 
Cambridge University Press.




