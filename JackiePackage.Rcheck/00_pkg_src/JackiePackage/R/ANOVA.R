#' ANOVA for Linear Regression Model
#'
#' Performs an analysis of variance (ANOVA) for a linear regression model,
#' breaking down the variability explained by each predictor and the residuals.
#'
#' @param model A list object returned by the `Fit` function, containing model details.
#' @return Prints an ANOVA table to the console, showing the contribution of each predictor.
#' @examples
#' # Example data
#' data <- data.frame(
#'   Age = runif(100, 20, 80),
#'   Sex = sample(0:1, 100, replace = TRUE),
#'   Depression = rnorm(100, 50, 10)
#' )
#' fit_result <- Fit(data, "Depression")
#' ANOVA(fit_result)
#' @export
ANOVA <- function(model) {
  # Reconstruct the response variable from fitted values and residuals
  y <- model$fitted_values + model$residuals
  
  # Extract the design matrix and predictor names
  X <- model$X
  predictors <- colnames(X[, -1, drop = FALSE])  # Exclude intercept
  
  # Initialize storage for sum of squares (SSR) and degrees of freedom (DF)
  ssr <- numeric(length(predictors))
  df <- numeric(length(predictors))
  
  # Compute SSR and DF for each predictor
  for (i in seq_along(predictors)) {
    # Include predictors sequentially
    X_current <- X[, 1:(i + 1), drop = FALSE]
    beta_current <- solve(t(X_current) %*% X_current) %*% t(X_current) %*% y
    fitted_current <- X_current %*% beta_current
    ssr[i] <- sum((fitted_current - mean(y))^2)  # Calculate SSR for current predictor
    df[i] <- 1  # Each predictor adds 1 degree of freedom
  }
  
  # Calculate residual sum of squares (SSE) and total sum of squares (SST)
  sse <- model$sse
  sst <- model$sst
  
  # Compute incremental SSR for each predictor
  ssr <- c(ssr[1], diff(ssr))  # Adjust for sequential contribution
  
  # Compute mean squares for predictors and residuals
  msr <- ssr / df
  mse <- sse / model$df_residuals
  
  # Calculate F-statistic and p-values
  f_stat <- msr / mse
  p_value <- pf(f_stat, df, model$df_residuals, lower.tail = FALSE)
  
  # Print the ANOVA table
  cat("Analysis of Variance Table\n")
  cat(sprintf("%-10s %-4s %-12s %-12s %-10s %-6s\n", "Source", "DF", "Sum Sq", "Mean Sq", "F value", "Pr(>F)"))
  for (i in seq_along(predictors)) {
    # Print each predictor's ANOVA results
    cat(sprintf("%-10s %-4d %-12.2f %-12.2f %-10.2f %-6.4g\n", 
                predictors[i], df[i], ssr[i], msr[i], f_stat[i], p_value[i]))
  }
  
  # Print residuals and total rows
  cat(sprintf("%-10s %-4d %-12.2f %-12.2f\n", 
              "Residuals", model$df_residuals, sse, mse))
  cat(sprintf("%-10s %-4d %-12.2f\n", 
              "Total", model$df_total, sst))
}
