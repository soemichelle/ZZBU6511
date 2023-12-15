# Get your working directory 
getwd()

# Load readr library
library(readr)

# Load pROC library
suppressMessages(library(pROC))

employees <- read.csv(file='employees2.csv')

# Creating binary variables for attrition 
employees$Attrition = ifelse(employees$Attrition == 'Yes', 1, 0)


# Create a plot of the employees dataset with the two new binary variables 
plot(employees)

# Close up of MonthlyIncome vs Attrition Plot 
employees$Attrition = ifelse(employees$Attrition == "Yes", 1, 0)
plot(
  Attrition ~ Age,
  data = employees
)

# Plot logistic model of Age vs Attrition Plot 
agemodel <- glm(
  formula = Attrition ~ Age,
  data = employees,
  family = 'binomial'
)

# First plot the data points for MonthylIncome vs Attrition 
plot(
  x = jitter(employees$Age, 1),
  y = jitter(employees$Attrition, 0.2),
  pch = 19,
  col = rgb(0, 0, 1, 0.5)
)

agemodel

curve(
  1/(1 + exp(0.39016 - 0.05847*x)),
  add = TRUE
)


# Get the probabilities from the model and add them into a new column 
employees$Probability <- predict(
  object = agemodel, 
  newdata = employees,
  type = 'response'
)

# Turn the probabilities into predictions, selected threshold of 0.25
employees$Prediction <- ifelse(employees$Probability >= 0.25,1,0)

head(employees)

# Measuring the fit: accuracy
# Create a confusion matrix

conf_matrix <- table(employees$Prediction, employees$Attrition)


plot(
  x = jitter(employees$Age, 1),
  y = jitter(employees$Attrition, 0.2),
  pch = 19,
  col = ifelse(
    employees$Prediction == employees$Attrition,
    # If prediction is correct use green
    rgb(0, 1, 0, 0.5),
    # Otherwise use red 
    rgb(1, 0, 0, 0.5)
  )
)

beta0 <- agemodel$coefficients[1]
beta1 <- agemodel$coefficients[2]
curve(
  1/(1 + exp(beta0 + beta1*x)),
  add = TRUE
)

# Show the confusion matrix
conf_matrix

# Calculate and show the accuracy
accuracy <- sum(diag(conf_matrix))/sum(conf_matrix)
message('Accuracy:', accuracy)

# Calculate and show the sensitivity 
sensitivity <- conf_matrix[2, 2]/sum(conf_matrix[ , 2])
message('Sensitivity:', sensitivity)

# Calculate and show the specificity 
specificity <- conf_matrix[1, 1]/sum(conf_matrix[ , 1])
message('Specificity:', specificity)

roc(
  # Provide a formula of the form 
  # Actual values ~ Probabilities 
  formula = employees$Attrition ~ employees$Probability,
  # Specify that we want the results plotted
  plot = TRUE,
  print.thres = 'best',
  print.auc = TRUE
)

# Create the folds
set.seed(57)
employees$Fold <- sample(rep(1:10, length.out=nrow(employees)))
# Initialise a vector of scores
scores <- c()
# Loop through each fold
for (fold in 1:10) {
  # Select the training set
  training = employees[employees$Fold != fold,]
  # Select the validation set
  validation = employees[employees$Fold == fold,]
  # Train the model on the training set
  incomemodel <- glm(
    formula = Attrition ~ Age,
    data = employees,
    family = "binomial"
  )
  # Apply it to the validation set
  validation$Probability <- predict(
    object = agemodel,
    newdata = validation,
    type = "response"
  )
  # Measure the AUC on the validation set
  auc <- roc(validation$Attrition ~ validation$Probability)$auc
  # Add it to the scores
  scores <- c(scores, auc)
}
# Calculate and show the mean score
message("Cross-validation AUC: ", mean(scores))