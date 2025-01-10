# R course for beginners
# Week 10
# assignment by Anastasia Keidar, id 322044082

# in MAC Shift + Command + 0 to restart the R session (clear workspace and packages)
# ^ + L to clear the console.

# Set seed for reproducibility
set.seed(123)

# GENERATE VECTORS ----

N = 20
Subject = seq(1, N, 1)
Age = runif(N, 18, 60)
Gender = factor(sample(c("male", "female"), N, replace = TRUE))
Response_Time = runif(N, 200, 6000)
Depression = runif(N, 0, 100)
Average_Sleep = runif(N, 2, 12)

df = data.frame(
  Subject = Subject,
  Age = Age,
  Gender = Gender,
  Response_Time = Response_Time,
  Depression = Depression,
  Average_Sleep = Average_Sleep
)

print(head(df))

# DESCRIPTIVES  ----

source("functions.R")

results = Descriptives(df, subject_start = 5, subject_end = 15)
print(results)
