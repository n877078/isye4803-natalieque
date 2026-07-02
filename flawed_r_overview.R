# Flawed R analysis -- attachment for ISyE 4803 HW2 Part C
# An AI assistant wrote this to "report the average of stock A's returns."
# It runs without error and confidently prints a number. The number is WRONG.
#
# Your task (HW2 Part C): run it, explain what it actually computed and why,
# then fix it so it reports the true average return.

# --- a small returns table (note: stock A has one stray non-numeric entry) ---
returns <- data.frame(
  date   = c("2024-01-02","2024-01-03","2024-01-04","2024-01-05","2024-01-08"),
  stockA = c("0.012","-0.004","0.008","n/a","0.005"),   # came in as text from a CSV
  stockB = c(0.003, 0.001, -0.002, 0.004, 0.000),
  stringsAsFactors = TRUE                                 # the AI left this default
)

# --- the AI's "average of stock A" ---
avg <- mean(as.numeric(returns$stockA))   # <-- looks reasonable, is wrong
cat("AI reports average return of stock A:", avg, "\n")

# The AI's claim to critique:
#   "The average return of stock A is the value printed above."
#
# Hints: what does as.numeric() return when applied to a FACTOR?
#        Why did stockA become a factor in the first place?
#        What should be done with the 'n/a' entry?

returns <- data.frame(
  date   = c("2024-01-02","2024-01-03","2024-01-04","2024-01-05","2024-01-08"),
  stockA = c("0.012","-0.004","0.008","n/a","0.005"),   # came in as text from a CSV
  stockB = c(0.003, 0.001, -0.002, 0.004, 0.000),
  stringsAsFactors = FALSE                                 # the AI left this default
)

returns$stockA[returns$stockA == "n/a"] <- NA
avg <- mean(as.numeric(returns$stockA), na.rm=TRUE)
cat("The correct average return of stock A:", avg, "\n")
