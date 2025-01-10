# R course for beginners
# Week 10
# assignment by Anastasia Keidar, id 322044082

# in MAC Shift + Command + 0 to restart the R session (clear workspace and packages)
# ^ + L to clear the console.

# DESCRIPTIVE STATISTICS FUNCTION ----

Descriptives <- function(df, subject_start = 1, subject_end = nrow(df)) {
  df <- df[df$Subject >= subject_start & df$Subject <= subject_end, ]
  if (nrow(df) < 10) {
    stop("data is too short")
    }
  results <- data.frame(
    Variable = character(),
    Statistic = character(),
    Value = numeric(),
    stringsAsFactors = FALSE
  )
  for (var in names(df)) {
    if (class(df[[var]]) %in% c("numeric", "integer")) {
      results <- rbind(results, data.frame(
        Variable = var,
        Statistic = "Mean",
        Value = mean(df[[var]], na.rm = TRUE)
        ))
      results <- rbind(results, data.frame(
        Variable = var,
        Statistic = "Standard Deviation",
        Value = sd(df[[var]], na.rm = TRUE)
        ))
      results <- rbind(results, data.frame(
        Variable = var,
        Statistic = "Min",
        Value = min(df[[var]], na.rm = TRUE)
        ))
      results <- rbind(results, data.frame(
        Variable = var,
        Statistic = "Max",
        Value = max(df[[var]], na.rm = TRUE)
        ))
      } else if (class(df[[var]]) == "factor") {
        levels_count <- table(df[[var]])
        for (level in names(levels_count)) {
          results <- rbind(results, data.frame(
            Variable = var,
            Statistic = paste("Count of", level),
            Value = levels_count[level]
          ))
        }
      }
    }
  return(results)
  }