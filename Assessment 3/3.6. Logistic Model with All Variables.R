# Load the libraries we need
suppressMessages(library(pROC))

# Load and prepare the data
employees <- read.csv(file='employees2.csv')
employees$Attrition <- ifelse(employees$Attrition == "Yes", 1, 0)

# Create the folds
set.seed(57)
employees$Fold <- sample(rep(1:10, length.out=nrow(employees)))

# Initialise a vector of scores
scores <- c()

# Loop through each fold
for (fold in 1:10) {
  
  # Create the training set
  training = employees[employees$Fold != fold,]
  
  # Create the validation set
  validation = employees[employees$Fold == fold,]
  
  # Train the model on the training set
  model <- glm(
    formula = Attrition ~ .,
    data = training,
    family = "binomial"
  )
  
  # Apply it to the validation set
  validation$Probability <- predict(
    object = model,
    newdata = validation,
    type = "response"
  )
  
  # Measure the AUC on the validation set
  auc <- roc(validation$Attrition ~ validation$Probability, quiet=TRUE)$auc
  
  # Add it to the scores
  scores <- c(scores, auc)
}

# Calculate and show the mean score
message("Cross-validation score: ", mean(scores))
