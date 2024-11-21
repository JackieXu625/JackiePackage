library(testthat)
library(JackiePackage)

test_that("Summary function provides accurate summary", {
  data <- data.frame(
    x = 1:10,
    y = 2 + 3 * 1:10 + rnorm(10, sd = 0.1)
  )
  fit_result <- Fit(data, "y")
  expect_output(Summary(fit_result), "Coefficients:")
  expect_output(Summary(fit_result), "Residual standard error")
  expect_output(Summary(fit_result), "Multiple R-squared")
  expect_output(Summary(fit_result), "Adjusted R-squared")
  expect_output(Summary(fit_result), "F-statistic")
})
