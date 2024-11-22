pkgname <- "JackiePackage"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "JackiePackage-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('JackiePackage')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("ANOVA")
### * ANOVA

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ANOVA
### Title: ANOVA for Linear Regression Model
### Aliases: ANOVA

### ** Examples

# Example data
data <- data.frame(
  Age = runif(100, 20, 80),
  Sex = sample(0:1, 100, replace = TRUE),
  Depression = rnorm(100, 50, 10)
)
fit_result <- Fit(data, "Depression")
ANOVA(fit_result)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ANOVA", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("Fit")
### * Fit

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Fit
### Title: Perform Linear Regression
### Aliases: Fit

### ** Examples

# Example data
data <- data.frame(
  Age = runif(100, 20, 80),
  Sex = sample(0:1, 100, replace = TRUE),
  Depression = rnorm(100, 50, 10)
)

# Perform linear regression
result <- Fit(data, "Depression")

# Print the coefficients
print(result$coefficients)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Fit", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("Predict")
### * Predict

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Predict
### Title: Predict Response Using Linear Regression Model
### Aliases: Predict

### ** Examples

# Example data
data <- data.frame(
  Age = runif(100, 20, 80),
  Sex = sample(0:1, 100, replace = TRUE),
  Depression = rnorm(100, 50, 10)
)

# Fit the model
fit_result <- Fit(data, "Depression")

# New predictor data
new_data <- data.frame(
  Age = c(30, 40, 50),
  Sex = c(0, 1, 1) 
)

# Predict response values
predictions <- Predict(fit_result, new_data)
print(predictions)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Predict", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("Summary")
### * Summary

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Summary
### Title: Summary of Linear Regression Model
### Aliases: Summary

### ** Examples

# Example data
data <- data.frame(
  Age = runif(100, 20, 80),
  Sex = sample(0:1, 100, replace = TRUE),
  Depression = rnorm(100, 50, 10)
)

# Fit the model
result <- Fit(data, "Depression")

# Generate the summary
Summary(result)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Summary", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
