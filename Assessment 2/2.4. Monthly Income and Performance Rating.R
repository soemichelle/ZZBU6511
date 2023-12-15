#Summarise Performance Rating grouped by Income Group
#First, find mean of Performance Rating based on Income Group 
performanceincome_data <- aggregate(
  PerformanceRating ~ IncomeGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Performance Rating
barplot(PerformanceRating ~ IncomeGroup,
        data = performanceincome_data,
        main = 'Mean Performance Rating according to Monthly Income Group',
        xlab = 'Monthly Income Group',
        ylab = 'Mean Performance Rating'
)
