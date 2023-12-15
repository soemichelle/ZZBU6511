#Summarise Performance rating grouped by Training times last year
#First, find mean of Performance Rating based on Training times last year
performancetraining_data <- aggregate(
  PerformanceRating ~ TrainingTimesLastYear,
  data = employees_data,
  FUN = mean
)

plot(x = performancetraining_data$TrainingTimesLastYear,
     y = performancetraining_data$PerformanceRating,
     type = 'o',
     col = 'blue',
     main = 'Performance Rating vs. Training Times Last Year',
     xlab = 'Training Times Last Year (No. of Days)',
     ylab = 'Performance Rating')
