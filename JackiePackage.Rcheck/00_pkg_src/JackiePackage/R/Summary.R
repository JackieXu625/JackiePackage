#' Summary of Linear Regression Model
#'
#' This function provides a detailed summary for a linear regression model fitted using the `Fit` function.
#' The summary includes estimates of coefficients, their standard errors, t-values, p-values,
#' residual standard error, R-squared, adjusted R-squared, and F-statistic.
#'
#' @param model A list object returned by the `Fit` function. See `Fit.R` for details.
#' @return Prints the summary of the linear regression model to the console, including:
#'   \itemize{
#'     \item A table of coefficients with estimates, standard errors, t-values, and p-values.
#'     \item Residual standard error and its degrees of freedom.
#'     \item Multiple R-squared and adjusted R-squared.
#'     \item F-statistic and its associated p-value.
#'   }
#' @examples
#' # Example data
#' data <- data.frame(
#'   Age = runif(100, 20, 80),
#'   Sex = sample(0:1, 100, replace = TRUE),
#'   Depression = rnorm(100, 50, 10)
#' )
#'
#' # Fit the model
#' result <- Fit(data, "Depression")
#'
#' # Generate the summary
#' Summary(result)
#' @export

Summary <- function(model) {
  # Number of observations and predictors
  n <- nrow(model$X)  # Number of observations
  p <- ncol(model$X)  # Number of predictors (including intercept)
  
  # Mean squared error for residuals
  mse <- model$sse / (n - p)
  
  # Standard errors for coefficients
  se_coefficients <- sqrt(diag(mse * solve(t(model$X) %*% model$X)))
  
  # Print header for coefficients table
  cat("Coefficients:\n")
  cat("             Estimate  Std. Error  t value  Pr(>|t|)\n")
  
  # Calculate and print each coefficient's statistics
  for (i in seq_along(model$coefficients)) {
    t_value <- model$coefficients[i] / se_coefficients[i]  # t-statistic
    p_value <- 2 * pt(-abs(t_value), df = n - p)  # Two-tailed p-value
    coef_name <- names(model$coefficients)[i]  # Coefficient name
    cat(sprintf("%-12s %10.4f %10.4f %8.4f %8.4g\n", 
                coef_name, model$coefficients[i], se_coefficients[i], t_value, p_value))
  }
  
  cat("\n")
  
  # Print residual standard error
  cat(sprintf("Residual standard error: %.4f on %d degrees of freedom\n", sqrt(mse), n - p))
  
  # Print R-squared and Adjusted R-squared
  cat(sprintf("Multiple R-squared: %.4f, Adjusted R-squared: %.4f\n", model$r_squared, model$adj_r_squared))
  
  # F-statistic and p-value for the overall model fit
  f_statistic <- (model$r_squared * (n - p)) / ((1 - model$r_squared) * (p - 1))  # F-statistic
  f_p_value <- pf(f_statistic, p - 1, n - p, lower.tail = FALSE)  # p-value for F-statistic
  
  # Print F-statistic and p-value
  cat(sprintf("F-statistic: %.4f on %d and %d DF, p-value: %.4g\n", f_statistic, p - 1, n - p, f_p_value))
}


                  
