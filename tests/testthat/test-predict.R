library(testthat)
library(JackiePackage)
test_that("Predict handles non-data.frame input gracefully", {
  data <- data.frame(Age = 1:10, Depression = 2 + 3 * 1:10)
  model <- Fit(data, "Depression")
  expect_error(
    Predict(model, list(Age = c(30, 40, 50))),
    "newdata must be a data frame."
  )
})
test_that("Predict handles missing predictors in newdata", {
  data <- data.frame(Age = 1:10, Depression = 2 + 3 * 1:10)
  model <- Fit(data, "Depression")
  new_data <- data.frame(WrongCol = c(30, 40, 50))
  expect_error(
    Predict(model, new_data),
    "The new data must include the same predictors used in the model."
  )
})
test_that("Predict returns correct predictions", {
  data <- data.frame(Age = 1:10, Depression = 2 + 3 * 1:10)
  model <- Fit(data, "Depression")
  new_data <- data.frame(Age = c(11, 12, 13))
  predictions <- Predict(model, new_data)
  expected <- 2 + 3 * c(11, 12, 13)
  expect_equal(predictions, expected)
})
