#Summarise Job Involvement rating grouped by Training times last year
#First, find mean of Job Involvement based on Training times last year
involvementraining_data <- aggregate(
  JobInvolvement ~ TrainingTimesLastYear,
  data = employees_data,
  FUN = mean
)

plot(x = involvementraining_data$TrainingTimesLastYear,
     y = involvementraining_data$JobInvolvement,
     type = 'o',
     col = 'blue',
     main = 'Job Involvement vs. Training Times Last Year',
     xlab = 'Training Times Last Year (No. of Days)',
     ylab = 'Job Involvement')
