employees <- read.csv(file='employees2.csv')
employees$Attrition = ifelse(employees$Attrition == "Yes", 1, 0)
plot(
  x = jitter(employees$MonthlyIncome, 1),
  y = jitter(employees$Attrition, 0.2),
  pch = 19,
  col = rgb(0, 0, 1, 0.5)
)

# Import the rpart library
library(rpart)
# Create the binary variable
employees$Attrition = ifelse(employees$Attrition == "Yes", 1, 0)
# Build the tree
treemodel <- rpart(
  formula = Attrition ~ YearsAtCompany,
  data = employees,
  # Specify that we want classification
  method = "class"
)
# Print the tree
treemodel

# Import both rpart and rpart.plot
library(rpart)
library(rpart.plot)
employees$Attrition = ifelse(employees$Attrition == "Yes", 1, 0)
treemodel <- rpart(
  formula = Attrition ~ DistanceFromHome,
  data = employees,
  method = "class"
)
# Plot the tree
rpart.plot(treemodel)

# Add the probabilities into a new column, "Probability"
employees$Probability <- predict(
  object = treemodel,
  newdata = employees,
  # Specify that we want to output probabilities
  type = "prob"
)
head(employees)

# Print the first few rows of the Probability column
head(employees$Probability)

# Plot the ROC curve, including the AUC and best threshold.
# Note that we want the probabilities in the second column
# of iris$Probability.
roc(
  formula = employees$Attrition ~ employees$Probability[ , 2],
  plot = TRUE,
  print.auc = TRUE,
  print.thres = "best"
)

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

