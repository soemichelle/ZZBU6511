# Get your working directory 
getwd()

# Load readr library
library(readr)

# Load pROC library
library(pROC)

employees <- read.csv(file='employees2.csv')

# Creating binary variables for attrition 
employees$Attrition = ifelse(employees$Attrition == 'Yes', 1, 0)

# Close up of MonthlyIncome vs Attrition Plot 
employees$Is.Yes = ifelse(employees$Attrition == "Yes", 1, 0)
plot(
  Attrition ~ MonthlyIncome + YearsAtCompany,
  data = employees
)

# Train the model
mlrmodel <- glm(
  # Use both MonthlyIncome and Years at Company 
  formula = Attrition ~ MonthlyIncome + YearsAtCompany,
  data = employees,
  family = 'binomial'
)

mlrmodel

# Make the predictions 
employees$Probability <- predict(
  object = mlrmodel, 
  newdata = employees, 
  type = 'response'
)

# Plot the ROC curve 
roc(
  formula = employees$Attrition ~ employees$Probability,
  plot = TRUE,
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
  mlrmodel <- glm(
    formula = Attrition ~ MonthlyIncome + YearsAtCompany,
    data = employees,
    family = "binomial"
  )
  # Apply it to the validation set
  validation$Probability <- predict(
    object = mlrmodel,
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

# Training the model
employees$Attrition = ifelse(employees$Attrition == 'Yes', 1, 0)
mlrmodel <- glm(
  formula = Attrition ~ MonthlyIncome + YearsAtCompany,
  data = employees, 
  family = 'binomial'
)

mlrmodel
