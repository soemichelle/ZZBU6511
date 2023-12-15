suppressMessages(library(rpart))
suppressMessages(library(pROC))
employees <- read.csv(file='employees2.csv')
employees$Attrition <- ifelse(employees$Attrition == "Yes", 1, 0)
set.seed(57)
employees$Fold <- sample(rep(1:10, length.out=nrow(employees)))
scores <- c()
for (fold in 1:10) {
  training = employees[employees$Fold != fold,]
  validation = employees[employees$Fold == fold,]
  model <- rpart(
    formula = Attrition ~ .,
    data = training,
    method = "class"
  )
  validation$Probability <- predict(
    object = model,
    newdata = validation,
    type = "prob"
  )
  auc <- roc(validation$Attrition ~ validation$Probability[ , 2], quiet=TRUE)$auc
  scores <- c(scores, auc)
}
message("Cross-validation score: ", mean(scores))
