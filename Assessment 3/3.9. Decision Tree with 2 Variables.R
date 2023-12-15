library(rpart)
library(rpart.plot)
library(pROC)

employees$Attrition = ifelse(employees$Attrition == "Yes", 1, 0)
model <- rpart(
  formula = Attrition ~ MonthlyIncome + YearsAtCompany,
  data = employees,
  method = "class"
)

rpart.plot(model)

employees$Probability <- predict(
  object = model,
  newdata = employees,
  type = "prob"
)

roc(
  formula = employees$Attrition ~ employees$Probability[ , 2],
  plot = TRUE,
  print.auc = TRUE,
  print.thres = "best"
)
