# 266A Final Project

**Author:** Kimmy Ferry

## Question

Can we use dimethyl sulfate (DMS) structure probing to accurately determine base pairing in *in vitro* transcribed human telomerase RNA (hTR)?

## Data

hTR was modified by DMS probing. DMS modification induces base mismatches during reverse transcription, which are mapped by Illumina short-read sequencing.

| File | Source | Format |
|------|--------|--------|
| `data/raw/266_seq_data.csv` | Experimental data | CSV |

Raw data is never edited.

## How to run

1. Open this folder in Positron (*File -> Open Folder*).
2. Install the exact package versions (one time only):

   ```r
   renv::restore()
   ```

3. Render the analysis from the project's top folder:

   ```bash
   quarto render run-analysis.qmd
   ```

The full analysis lives in `run-analysis.qmd`, which renders to a self-contained HTML report.

## Folder structure

```
266A_FINAL
├── run-analysis.qmd   <- render this to run everything
├── README.md          <- you are here
├── renv.lock          <- exact package versions
├── data/raw/          <- original data, never edited
├── data/processed/    <- written by the pipeline
├── scripts/           <- one script per step
└── output/            <- figures and tables
```

## Reproducing from scratch

Delete the contents of `data/processed/` and `output/`, restart R, and render again. Everything is regenerated.

## Requirements

- R and [Quarto](https://quarto.org)
- Packages are pinned in `renv.lock` (includes tidyverse and ggplot2)
