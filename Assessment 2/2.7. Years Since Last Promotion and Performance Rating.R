#Summarise Performance rating grouped by Years since last promotion
#First, find mean of Performance Rating based on Years since last promotion
performancepromotion_data <- aggregate(
  PerformanceRating ~ YearsSinceLastPromotion,
  data = employees_data,
  FUN = mean
)

plot(x = performancepromotion_data$YearsSinceLastPromotion,
     y = performancepromotion_data$PerformanceRating,
     type = 'o',
     col = 'blue',
     main = 'Performance Rating vs. Years Since Last Promotion',
     xlab = 'Years since last promotion',
     ylab = 'Performance Rating')

