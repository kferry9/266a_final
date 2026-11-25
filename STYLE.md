# STYLE.md

Conventions for code and writing in this project.

## R code

- **Assignment:** use `<-`, not `=`. Use `=` only for function arguments.
- **Names:** `snake_case` for objects and columns (`raw_mut_rate`, `seq_clean`). Make names describe the content. Avoid `df`, `temp`, `x2`.
- **Spacing:** spaces around operators and after commas (`a + b`, `x[i, ]`). No space before a function's opening parenthesis.
- **Line length:** keep lines under about 80 characters. Break long `ggplot()` calls and pipes after each `+` or `|>`, indented two spaces.
- **Pipes:** use the native pipe `|>`. One verb per line.
- **Comparisons:** use `==`, `!=`, `%in%`. Wrap multi-value tests in `%in%`, not `==`.
- **Quotes:** double quotes for strings.
- **Libraries:** load all packages at the top of the document or script, not scattered through it.
- **Comments:** explain *why*, not *what*. Put them on their own line above the code.
- **Magic numbers:** name them. For example, `bins <- 120` instead of repeating a bare number.

```r
raw_mut <- ggplot(seq_clean, aes(x = raw_mut_rate, fill = sample)) +
  geom_histogram(bins = 120, position = "identity", alpha = 0.5) +
  coord_cartesian(xlim = c(0, 0.1)) +
  labs(
    x = "Raw mutation rate",
    y = "Count",
    title = "Raw Mutation Rates"
  )
```

## Data handling

- Never edit raw data. Cleaning happens in code and the result is written to `data/processed/`.
- Record every removed or recoded value in a comment (for example, zero read depths set to `NA` because a mutation rate divides by depth).
- After any filter, check `nrow()` or `dim()`.
- Handle `NA` explicitly (`na.rm = TRUE`, `which()`, `is.na()`), and say so in a comment.

## Figures

- Every plot has a title, labelled axes with units, and a legend title if colour is used.
- Choose the plot type for the data: histograms for distributions, scatter plots for two numeric variables, bars for counts or summaries.
- Use the same colours for the same samples across all figures.
- Axis ranges that hide data (zooming) should use `coord_cartesian()`, not `xlim()`, so the data is not dropped.
- Save figures to `output/` with `ggsave()` and a descriptive file name.

## Quarto document

- Give every chunk a `label`. Chunk options go on the first lines of the chunk as `#| label: ...`.
- One idea per chunk. Source helper functions from `scripts/` rather than pasting code.
- Write a short plain-language interpretation after each figure or table: what it shows and why that plot type was chosen.
- Keep `echo: true` so the code is visible, and `warning: false` only after warnings have been checked.

## Scripts

- One script per step in `scripts/`, named for what it does (`clean_seq_data.R`, `mut_rate.R`).
- Scripts should run top to bottom from a fresh R session and not rely on objects left over in the workspace.

## Writing

- Short, direct sentences. Define abbreviations on first use (dimethyl sulfate, DMS; human telomerase RNA, hTR).
- Italicise Latin terms such as *in vitro*.
- State results with the numbers that support them (coefficients, R², n).

## Files and folders

- File and folder names: lowercase, no spaces, `snake_case` or hyphens.
- Don't commit large generated files or `renv/library/`. Do commit `renv.lock`.
