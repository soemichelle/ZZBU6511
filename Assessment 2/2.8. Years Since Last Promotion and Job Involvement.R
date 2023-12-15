#Summarise Job Involvement rating grouped by Years since last promotion
#First, find mean of Job Involvement based on Years since last promotion
involvementpromotion_data <- aggregate(
  JobInvolvement ~ YearsSinceLastPromotion,
  data = employees_data,
  FUN = mean
)

plot(x = involvementpromotion_data$YearsSinceLastPromotion,
     y = involvementpromotion_data$JobInvolvement,
     type = 'o',
     col = 'blue',
     main = 'Job Involvement vs. Years Since Last Promotion',
     xlab = 'Years since last promotion',
     ylab = 'Job Involvement')
