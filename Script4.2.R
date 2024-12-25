# Script: Filtering
# Description: This script filters Stroop experiment data.
# Author: Anastasia Keidar
# Date: 25.12.24


# R course for beginners
# Week 7
# assignment by Anastasia Keidar, id 322044082

# in MAC Shift + Command + 0 to restart the R session (clear workspace and packages)
# ^ + L to clear the console.

# Load packs
library(dplyr)

load("RAW_data_frame_4.RData")

# FILTERD DATA ----

# a. + b. Counting subjects and removing missing values

cat("Number of unique subjects:", length(unique(df_filtered$subject)))

df_filtered = na.omit(df_filtered)

# c. Removing outliers 
df_filtered <- df_filtered |> 
  filter(rt > 300 & rt < 3000)

#d. + e. Calculating the percentage of trails remaining and Calculate mean and SD of removed percentages

df_summary = df_filtered |> 
  group_by(subject) |> 
  summarise(
    percentage_remaining = (n() / 400) * 100,
    percentage_removed = ((400 - n()) / 400) * 100
  ) |> 
  print(n = Inf)

avg_removed = mean(df_summary$percentage_removed)
sd_removed = sd(df_summary$percentage_removed)

print(paste("Mean percentage of removed trials:", avg_removed))
print(paste("SD of percentage of removed trials:", sd_removed))

# save 
save(df_filtered, file = "filtered_data_frame_4.RData")
