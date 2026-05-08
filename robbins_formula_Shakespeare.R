# This code was generated with the help of Claude AI

# Shakespeare Vocabulary Data (from CASI Chapter 6)
# Frequency of word counts in Shakespeare's canon

word_freq <- c(14376, 4343, 1100, 450, 213, 112, 70, 62, 42, 37)
# This represents: 14,376 words appear 1x, 4,343 words appear 2x, etc.

# Create count data: for each observed count x, how many words had that count
counts <- 1:length(word_freq)
names(word_freq) <- counts

# Compute empirical frequency f(x) = (# words with x occurrences) / (total distinct words)
total_distinct <- sum(word_freq)
f_hat <- word_freq / total_distinct

# Robbins' Formula
robbins_formula <- function(x, f_hat) {
  # E[θ|x] = (x+1) * f(x+1) / f(x)
  
  posterior_means <- numeric(length(x))
  
  for (i in seq_along(x)) {
    x_i <- x[i]
    
    # Check if x+1 is in range
    if (x_i + 1 > length(f_hat)) {
      posterior_means[i] <- NA
      next
    }
    
    denom <- f_hat[x_i]
    if (denom == 0) {
      posterior_means[i] <- NA
      next
    }
    
    numer <- (x_i + 1) * f_hat[x_i + 1]
    posterior_means[i] <- numer / denom
  }
  
  return(posterior_means)
}

# Apply Robbins' Formula to observed counts
observed_counts <- 1:9  # words we observed 1x, 2x, ..., 9x times
robbins_estimates <- robbins_formula(observed_counts, f_hat)

# Display results
results <- data.frame(
  observed_count = observed_counts,
  num_words = word_freq[observed_counts],
  robbins_estimate = robbins_estimates
)

print(results)


# Compute standard errors using CASI formula
n <- sum(counts)  # total words in Shakespeare canon
se <- numeric(9)

for (x in 1:9) {
  fx   <- f_hat[x]
  fx1  <- f_hat[x + 1]
  fx2  <- if (x + 2 <= length(f_hat)) f_hat[x + 2] else 0
  
  eb   <- (x + 1) * fx1 / fx          # Robbins' estimate
  term <- (x + 1)^2 * fx2 / fx        # second moment term
  se[x] <- sqrt((term - eb^2) / (n * fx))
}

# Plot with error bars
plot(results$observed_count, results$robbins_estimate,
     xlab = "Observed Count",
     ylab = "Robbins Estimate",
     main = "Robbins' Formula with Standard Errors: Shakespeare Data",
     ylim = c(0, 12), pch = 16)
abline(0, 1, lty = 2)
arrows(results$observed_count, results$robbins_estimate - 2*se,
       results$observed_count, results$robbins_estimate + 2*se,
       length = 0.05, angle = 90, code = 3)


# Interpretation: For words we observed exactly once (observed_count = 1),
# Robbins' Formula gives us a shrinkage estimate of how many times 
# we'd expect those words to appear if we had more Shakespeare text.