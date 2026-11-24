source("scripts/clean_seq_data.R")
source("Results/mut_rate.R")
library(ggplot2)

raw_mut <- ggplot(seq_clean, aes(x = raw_mut_rate, fill = sample)) + geom_histogram(bins = 120, position = "identity", alpha = 0.5) + coord_cartesian(xlim = c(0, 0.1)) + labs(x = "Raw mutation rate", y = "Nucleotide", title = "Raw Mutation Rates")

raw_mut

eff_mut <- ggplot(seq_clean, aes(x = effective_mut_rate, fill = sample)) + geom_histogram(bins = 200, position = "identity", alpha = 0.5) + coord_cartesian(xlim = c(0, 0.1)) + labs(x = "Effective mutation rate", y = "Nucleotide", title = "Effective Mutation Rates")
eff_mut