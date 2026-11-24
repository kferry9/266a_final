seq_data <- read.csv("data/raw/266_seq_data.csv")

str(seq_data)

summary(seq_data$mutation[seq_data$sample %in% "hTR_DMS_1" & seq_data$probe %in% "DMS_plus"])
summary(seq_data$mutation[seq_data$sample %in% "hTR_DMS_2" & seq_data$probe %in% "DMS_plus"])
summary(seq_data$mutation[seq_data$sample %in% "hTR_DMS_1" & seq_data$probe %in% "DMS_minus"])
summary(seq_data$mutation[seq_data$sample %in% "hTR_DMS_2" & seq_data$probe %in% "DMS_minus"])

zeros_vals <- seq_data[which(seq_data$raw_read_depth <= 0 | seq_data$effective_depth <= 0), ]   #mutation rate is mutations/read depth so read depths cannot be zero

seq_data$raw_read_depth[seq_data$raw_read_depth <= 0] <- NA    #remove zero values
seq_data$effective_depth[seq_data$effective_depth <= 0] <- NA   #remove zero values
seq_data$raw_read_depth <- as.numeric(seq_data$raw_read_depth)
NA_val <- sum(is.na(seq_data$raw_read_depth), is.na(seq_data$effective_depth))  #check how many NAs are found



if (any(seq_data$raw_read_depth <= 0 | seq_data$effective_depth <= 0, na.rm = TRUE)) stop("zero values must be removed")

str(seq_data)

message("seq_data is cleaned")

write.csv(seq_data, "data/processed/seq_clean.csv", row.names = FALSE)
seq_clean <- read.csv("data/processed/seq_clean.csv")
dim(seq_clean)

