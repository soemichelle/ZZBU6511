suppressMessages(library(pROC))
employees <- read.csv(file='employees2.csv')
employees$Attrition <- ifelse(employees$Attrition == "Yes", 1, 0)
set.seed(57)
employees$Fold <- sample(rep(1:10, length.out=nrow(employees)))

# Define a function to do the cross-validation
cross_validate <- function(varToDrop) {
  scores <- c()
  for (fold in 1:10) {
    training = employees[employees$Fold != fold,]
    validation = employees[employees$Fold == fold,]
    model <- glm(
      formula = paste("Attrition ~ . -", varToDrop),
      data = training,
      family = "binomial"
    )
    validation$Probability <- predict(
      object = model,
      newdata = validation,
      type = "response"
    )
    auc <- roc(validation$Attrition ~ validation$Probability, quiet=TRUE)$auc
    scores <- c(scores, auc)
  }
  message("Without ", varToDrop, ": ", mean(scores))
}

# Get the variables to try dropping
vars <- colnames(employees)
vars <- vars[vars != "Attrition" & vars != "Fold"]

# Try dropping them
for (var in vars) {
  cross_validate(var)
}

