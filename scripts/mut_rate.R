source("scripts/clean_seq_data.R")

#create two new columns with mutation rates

seq_clean$raw_mut_rate <- seq_clean$mutations / seq_clean$raw_read_depth
seq_clean$effective_mut_rate <- seq_clean$mutations / seq_clean$effective_depth


