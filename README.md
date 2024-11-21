
# JackiePackage

JackiePackage is an R package designed to process linear regression analysis. The package simplifies fitting models, summarizing outputs, making predictions, and conducting ANOVA tests, ensuring ease of use for all levels of analysts and statisticians.

## Features
- **Fit**: Perform linear regression and calculate essential metrics like R-squared and adjusted R-squared.
- **Predict**: Predict response values for new data using the fitted model.
- **Summary**: Provide a comprehensive summary of the regression model.
- **ANOVA**: Conduct analysis of variance to understand the contribution of predictors.

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
