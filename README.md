
# JackiePackage

JackiePackage is an R package designed to process linear regression analysis. The package simplifies fitting models, summarizing outputs, making predictions, and conducting ANOVA tests, ensuring ease of use for all levels of analysts and statisticians.

## Features
- **Fit**: Perform linear regression and calculate essential metrics like R-squared and adjusted R-squared.
- **Predict**: Predict response values for new data using the fitted model.
- **Summary**: Provide a comprehensive summary of the regression model.
- **ANOVA**: Conduct analysis of variance to understand the contribution of predictors.

## Performance Benchmark
JackiePackage has been benchmarked against the base R `lm()` function, demonstrating competitive performance in terms of efficiency and resource usage:

- **Efficiency**: Benchmarks show that JackiePackage achieves faster computation times for model fitting compared to `lm()`:
  - JackiePackage: **66.1µs (median: 73.7µs)** per iteration.
  - Base R `lm()`: **271.6µs (median: 298.2µs)** per iteration.
- **Resource Optimization**: JackiePackage allocates memory more efficiently:
  - JackiePackage: **84.1KB** per iteration.
  - Base R `lm()`: **138.6KB** per iteration.
- **Iteration Performance**:
  - JackiePackage achieves approximately **10754 iterations per second** with minimal garbage collection (`gc/sec: 108.63`).
  - Base R `lm()` achieves approximately **3138 iterations per second** with higher garbage collection frequency (`gc/sec: 64.04`).

- **Accuracy**: JackiePackage produces results that are identical to `lm()` in terms of prediction accuracy and model fitting metrics, ensuring consistent and reliable outcomes.

These benchmarks were conducted using the `bench` package on datasets with similar complexities.

## Installation
To install JackiePackage, use the following steps:
```R
# Install devtools if not already installed
install.packages("devtools")

# Install JackiePackage from the repository
devtools::install_github("https://github.com/JackieXu625/JackiePackage")
```

## Usage

### 1. Fitting a Model
Use the `Fit` function to perform linear regression on your dataset:
```R
# Example data
data <- data.frame(
  Age = runif(100, 20, 80),              # Random ages
  Sex = sample(0:1, 100, replace = TRUE), # Binary gender variable
  Depression = rnorm(100, 50, 10)         # Random depression scores
)

# Fit the model
fit_result <- Fit(data, "Depression")
```

### 2. Predicting Values
Use the `Predict` function to generate predictions for new data. Ensure the predictor variable names match the ones used in the model:
```R
# New predictor data
new_data <- data.frame(
  Age = c(30, 40, 50),  # Example ages
  Sex = c(0, 1, 1)      # Example genders
)

# Predict response values
predictions <- Predict(fit_result, new_data)
print(predictions)
```

### 3. Summarizing Results
The `Summary` function provides a detailed overview of the model:
```R
# Summarize the model
Summary(fit_result)
```

### 4. Performing ANOVA
The `ANOVA` function analyzes the variance explained by each predictor:
```R
# Conduct ANOVA
ANOVA(fit_result)
```

## Documentation
For detailed documentation of each function, use the help system in R:
```R
?Fit
?Predict
?Summary
?ANOVA
```

## Vignette
A comprehensive vignette demonstrating the capabilities of JackiePackage is available:
```R
vignette("Using JackiePackage for Enhanced Linear Regression Analysis")
```

## License
This package is licensed under the MIT License. See the `LICENSE` file for details.

## Author
Created by Jackie Xu. For questions or feedback, contact [Jixhaw@umich.edu](mailto:Jixhaw@umich.edu).
