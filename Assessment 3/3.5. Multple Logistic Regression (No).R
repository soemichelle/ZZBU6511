library(pROC)
employees$Is.No = ifelse(employees$Attrition == "No", 1, 0)

# Train the model
mlrnomodel <- glm(
  # Use both MonthlyIncome and Years at Company 
  formula = Is.No ~ MonthlyIncome + YearsAtCompany,
  data = employees,
  family = 'binomial'
)

# Make the predictions 
employees$Probability <- predict(
  object = mlrnomodel, 
  newdata = employees, 
  type = 'response'
)

# Plot the ROC curve 
roc(
  formula = employees$Is.No ~ employees$Probability,
  plot = TRUE,
  print.auc = TRUE
)
