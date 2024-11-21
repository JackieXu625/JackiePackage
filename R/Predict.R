#' Predict Response Using Linear Regression Model
#'
#' This function generates predicted values for a response variable based on the coefficients
#' of a linear regression model and new predictor data. It ensures consistency by verifying
#' that the new data includes all the predictors used in the fitted model.
#'
#' @param model A list object returned by the `Fit` function. This list should contain:
#'   \itemize{
#'     \item \code{coefficients}: A named vector of model coefficients, including the intercept.
#'     \item \code{X}: The design matrix from the fitted model (used to verify predictors).
#'   }
#' @param newdata A data frame of new predictor values. The column names must match the predictor variables
#'                used in the model, excluding the response variable. The order does not matter as long as the names match.
#' @return A numeric vector of predicted values for the response variable.
#' @examples
#' # Example data
#' data <- data.frame(
#'   Age = runif(100, 20, 80),
#'   Sex = sample(0:1, 100, replace = TRUE),
#'   Depression = rnorm(100, 50, 10)
#' )
#'
#' # Fit the model
#' fit_result <- Fit(data, "Depression")
#'
#' # New predictor data
#' new_data <- data.frame(
#'   Age = c(30, 40, 50),
#'   Sex = c(0, 1, 1) 
#' )
#'
#' # Predict response values
#' predictions <- Predict(fit_result, new_data)
#' print(predictions)
#' @export
Predict <- function(model, newdata) {
  # Check if newdata is a data frame
  if (!is.data.frame(newdata)) {
    stop("newdata must be a data frame.")
  }
  
  # Extract the predictor names from the model
  expected_predictors <- names(model$coefficients)[-1]  # Exclude intercept
  
  # Ensure all predictors are present in newdata
  if (!all(expected_predictors %in% names(newdata))) {
    stop("The new data must include the same predictors used in the model.")
  }
  
  # Reorder newdata to match the order of predictors in the model
  newdata <- newdata[, expected_predictors, drop = FALSE]
  
  # Create the design matrix for prediction
  newdata_matrix <- as.matrix(cbind(1, newdata))  # Add intercept column
  
  # Calculate predictions
  predictions <- newdata_matrix %*% model$coefficients
  
  # Return predictions
  return(as.vector(predictions))
}

