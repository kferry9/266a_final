source("scripts/clean_seq_data.R")
source("Results/mut_rate.R")
library(ggplot2)

seq_clean$raw_DMS1_plus <- seq_clean$raw_mut_rate[seq_clean$sample %in% "hTR_DMS_1" & seq_clean$probe %in% "DMS_plus"]
seq_clean$raw_DMS2_plus <- seq_clean$raw_mut_rate[seq_clean$sample %in% "hTR_DMS_2" & seq_clean$probe %in% "DMS_plus"]
seq_clean$eff_DMS1_plus <- seq_clean$effective_mut_rate[seq_clean$sample %in% "hTR_DMS_1" & seq_clean$probe %in% "DMS_plus"]
seq_clean$eff_DMS2_plus <- seq_clean$effective_mut_rate[seq_clean$sample %in% "hTR_DMS_2" & seq_clean$probe %in% "DMS_plus"]

raw_corr_plus_plot <- ggplot(seq_clean, aes(x = raw_DMS1_plus, y = raw_DMS2_plus)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + labs(x = "Raw DMS 1 mutation rate", y = "Raw DMS 1 mutation rate", title = "Raw DMS correlation")

raw_corr_plus_plot

raw_plus_corr <- lm(raw_DMS1_plus ~ raw_DMS2_plus, data = seq_clean)
coef(raw_plus_corr)
summary(raw_plus_corr)

eff_corr_plus_plot <- ggplot(seq_clean, aes(x = eff_DMS1_plus, y = eff_DMS2_plus)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + labs(x = "Effective DMS 1 mutation rate", y = "Effective DMS 1 mutation rate", title = "Effective DMS correlation")

eff_corr_plus_plot

eff_plus_corr <- lm(eff_DMS1_plus ~ eff_DMS2_plus, data = seq_clean)
coef(eff_plus_corr)
summary(eff_plus_corr)
nobs(eff_plus_corr)

raw_diag_df <- data.frame(raw_fitted = fitted(raw_plus_corr), raw_resid  = residuals(raw_plus_corr))

raw_residual <- ggplot(raw_diag_df, aes(x = raw_fitted, y = raw_resid)) + geom_point() + geom_hline(yintercept = 0) + labs(x = "Fitted raw mutation rate", y = "Residual", title = "Raw read residuals")

raw_residual

eff_diag_df <- data.frame(eff_fitted = fitted(eff_plus_corr), eff_resid  = residuals(eff_plus_corr))

eff_residual <- ggplot(eff_diag_df, aes(x = eff_fitted, y = eff_resid)) + geom_point() + geom_hline(yintercept = 0) + labs(x = "Fitted effective mutation rate", y = "Residual", title = "Effective read residuals")

eff_residual