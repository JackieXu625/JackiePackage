library(testthat)
library(JackiePackage)

test_that("ANOVA function correctly computes ANOVA table", {
  data <- data.frame(
    x = 1:10,
    y = 2 + 3 * 1:10 + rnorm(10, sd = 0.1)
  )
  fit_result <- Fit(data, "y")
  expect_output(ANOVA(fit_result), "Analysis of Variance Table")
  expect_output(ANOVA(fit_result), "Sum Sq")
  expect_output(ANOVA(fit_result), "Mean Sq")
  expect_output(ANOVA(fit_result), "F value")
  expect_output(ANOVA(fit_result), "Pr\\(>F\\)")
})


