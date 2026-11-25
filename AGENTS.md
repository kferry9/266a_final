# AGENTS.md

Instructions for AI assistants (Claude, Copilot, etc.) working in this repository.

## Project

266A Final Project: using DMS structure probing to determine base pairing in *in vitro* transcribed human telomerase RNA (hTR). The analysis is an R and Quarto pipeline that imports sequencing data, computes mutation rates, plots them, and compares replicates with linear regression.

## Layout

```
266A_FINAL
├── run-analysis.qmd   <- main document; renders the full analysis
├── README.md
├── STYLE.md           <- code and writing conventions
├── renv.lock          <- pinned package versions
├── data/raw/          <- original data, NEVER edit or overwrite
├── data/processed/    <- written by the pipeline
├── scripts/           <- one script per step
└── output/            <- figures and tables
```

## Rules

1. **Never modify anything in `data/raw/`.** Read from it, write cleaned data to `data/processed/`.
2. **Don't add or update packages without asking.** Packages are pinned with renv. If a new package is needed, say so, and run `renv::snapshot()` only after the user agrees.
3. **Keep the pipeline reproducible.** Deleting `data/processed/` and `output/` and re-rendering must recreate everything. No manual steps, no hard-coded absolute paths.
4. **Use relative paths** from the project root (or `here::here()`). Folders that code writes to must exist before `write.csv()` is called.
5. **Make the smallest change that fixes the problem.** Don't rewrite or reformat working code that wasn't asked about.
6. **Explain what you changed and why**, so the user can understand and check it. This is coursework and the user needs to be able to explain every line.
7. **Don't invent results.** Report numbers only from code that was actually run. If something can't be verified, say so.
8. **Follow `STYLE.md`.**

## Running and checking

```bash
quarto render run-analysis.qmd
```

Run from the project root. Before calling a change done:

- Render the whole document without errors.
- Check row counts after any filter or join (`nrow()`, `dim()`). `NA` values can silently drop rows from models.
- Confirm plots have labelled axes and titles.

## AI use disclosure

The project report includes an "AI use" section. When an assistant helps, the user records: the tool used, what it was used for, and what was changed or rejected and how it was checked. Suggest a line for that section when you make a meaningful contribution.
