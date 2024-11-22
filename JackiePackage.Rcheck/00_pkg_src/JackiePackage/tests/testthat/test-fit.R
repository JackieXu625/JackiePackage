library(testthat)
library(JackiePackage)

test_that("Fit function correctly computes model metrics", {
  data <- data.frame(
    x = 1:10,
    y = 2 + 3 * 1:10 + rnorm(10)
  )
  result <- Fit(data, "y")
  expect_equal(length(result$coefficients), 2)  # Intercept and slope
  expect_true(all(names(result$coefficients) %in% c("(Intercept)", "x")))
  expect_equal(result$df_residuals, 8)
  expect_equal(result$df_total, 9)
  expect_true(result$r_squared > 0.9)
  expect_true(result$adj_r_squared > 0.9)
  expect_true(result$sst > result$sse)
})
