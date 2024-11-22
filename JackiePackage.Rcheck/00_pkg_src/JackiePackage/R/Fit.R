#' Perform Linear Regression
#'
#' This function performs linear regression using the ordinary least squares (OLS) method.
#' It calculates the coefficients for the predictor variables and the specified response variable.
#' The function also computes various model metrics such as R-squared, adjusted R-squared,
#' residuals, and fitted values.
#'
#' @param data A data frame containing both the predictor variables and the response variable.
#' @param response A string specifying the column name of the response variable in the data frame.
#' @return A list containing:
#'   \itemize{
#'     \item \code{coefficients}: A named vector of estimated coefficients, including the intercept.
#'     \item \code{residuals}: A numeric vector of residuals (differences between observed and fitted values).
#'     \item \code{fitted_values}: A numeric vector of fitted values.
#'     \item \code{sse}: Sum of squared errors (residual sum of squares).
#'     \item \code{sst}: Total sum of squares (total variability in the response variable).
#'     \item \code{r_squared}: R-squared, a measure of how well the model explains the variability of the response variable.
#'     \item \code{adj_r_squared}: Adjusted R-squared, accounts for the number of predictors in the model.
#'     \item \code{X}: The design matrix used in the regression analysis.
#'     \item \code{df_total}: Total degrees of freedom (sample size minus one).
#'     \item \code{df_residuals}: Degrees of freedom for residuals (sample size minus number of predictors).
#'   }
#' @examples
#' # Example data
#' data <- data.frame(
#'   Age = runif(100, 20, 80),
#'   Sex = sample(0:1, 100, replace = TRUE),
#'   Depression = rnorm(100, 50, 10)
#' )
#'
#' # Perform linear regression
#' result <- Fit(data, "Depression")
#'
#' # Print the coefficients
#' print(result$coefficients)
#' @export


Fit <- function(data, response) {
  # Extract the response variable (y)
  y <- data[[response]]
  
  # Extract the predictor variables (X), excluding the response column
  X <- data[, !names(data) %in% response, drop = FALSE]
  
  # Ensure X is a matrix and add an intercept column
  if (!is.matrix(X)) {
    X <- as.matrix(X)
  }
  X <- cbind(1, X)  # Add intercept (column of 1s)
  
  # Calculate regression coefficients using the normal equation
  beta <- solve(t(X) %*% X) %*% (t(X) %*% y)
  
  # Compute fitted values and residuals
  fitted_values <- X %*% beta
  residuals <- y - fitted_values
  
  # Calculate sum of squared errors (SSE) and total sum of squares (SST)
  sse <- sum(residuals^2)  # Residual sum of squares
  sst <- sum((y - mean(y))^2)  # Total variability in y
  
  # Degrees of freedom
  df_total <- nrow(X) - 1  # Total degrees of freedom
  df_residuals <- nrow(X) - ncol(X)  # Residual degrees of freedom
  
  # Calculate R-squared and Adjusted R-squared
  r_squared <- 1 - (sse / sst)  # Proportion of variability explained by the model
  adj_r_squared <- 1 - (sse / df_residuals) / (sst / df_total)  # Adjusted for number of predictors
  
  # Assign names to coefficients (intercept and predictors)
  coef_names <- c("(Intercept)", colnames(X[, -1, drop = FALSE]))
  names(beta) <- coef_names
  
  # Return results as a list
  return(list(
    coefficients = beta,  # Regression coefficients
    residuals = residuals,  # Differences between observed and fitted values
    fitted_values = fitted_values,  # Predicted values
    X = X,  # Design matrix used in regression
    sse = sse,  # Residual sum of squares
    sst = sst,  # Total sum of squares
    r_squared = r_squared,  # R-squared value
    adj_r_squared = adj_r_squared,  # Adjusted R-squared value
    df_total = df_total,  # Total degrees of freedom
    df_residuals = df_residuals  # Residual degrees of freedom
  ))
}





