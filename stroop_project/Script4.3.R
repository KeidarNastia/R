# Script: Ploting
# Description: This script calculates mean and sd for each condition and ploting it.
# Author: Anastasia Keidar
# Date: 25.12.24

# R course for beginners
# Week 7
# assignment by Anastasia Keidar, id 322044082

# in MAC Shift + Command + 0 to restart the R session (clear workspace and packages)
# ^ + L to clear the console.

load("filtered_data_frame_4.RData")

# Load packs
library(dplyr)
library(ggplot2)

# a. Calculate mean and SD for each condition
summary_stats = df_filtered |> 
  group_by(task, congruency) |> 
  summarise(
    mean_rt = mean(rt),
    sd_rt = sd(rt),
    .groups = "drop"
    ) |>
  print()

# b. Plot
ggplot(summary_stats, aes(x = task, y = mean_rt, fill = congruency)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_errorbar(
    aes(ymin = mean_rt - sd_rt, ymax = mean_rt + sd_rt),
    width = 0.2, position = position_dodge(0.9)
    ) +
  scale_x_discrete(
    labels = c("ink_naming" = "Ink naming", "word_reading" = "Word reading")
    ) +
  labs(
    title = "Mean reaction time by sask and congruency",
    x = "Task",
    y = "Mean Reaction Time"
    ) +
  theme_minimal()
