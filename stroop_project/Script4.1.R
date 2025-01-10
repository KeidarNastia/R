# Script: 1st Raw data
# Description: This script processes Stroop experiment data.
# Author: Anastasia Keidar
# Date: 25.12.24


# R course for beginners
# Week 7
# assignment by Anastasia Keidar, id 322044082

# in MAC Shift + Command + 0 to restart the R session (clear workspace and packages)
# ^ + L to clear the console.

# Load packs
library(dplyr)
library(tidyverse)

# Creating raw data ----

# a. Uploading files to a single df object

files_names = dir("~/Library/Mobile Documents/com~apple~CloudDocs/דוקטורט/קורסים אוני׳/R/untitled folder/stroop_data", full.names = TRUE)

df = data.frame()

df = map_dfr(files_names, read.csv)

print(df)

# b. + c. Adding task, congruency and accuracy variables

df = df |> 
  mutate(
    task = case_when(
      grepl("ink_naming", condition) ~ "ink_naming",
      TRUE ~ "word_reading"
      ),
    congruency = case_when(
      grepl("incong", condition) ~ "incongruent",
      TRUE ~ "congruent"
      ),
    accuracy = ifelse(participant_response == correct_response, 1, 0)
  )

# d. Keeping only relevant variables and checking variable types

df_filtered = df |> select(subject, task, congruency, block, trial, accuracy, rt)

print(df_filtered)

df_filtered <- df_filtered |>
  mutate(
    across(c(subject, task, congruency), as.factor),
    across(c(block, trial, accuracy, rt), as.numeric)
    )

print(df_filtered)

# e. Factor encoding
contrasts(df_filtered$task) = c(1,0)
contrasts(df_filtered$task)
contrasts(df_filtered$congruency)

# Save
save(df_filtered, file = "RAW_data_frame_4.RData")
