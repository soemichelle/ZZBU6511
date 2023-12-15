#Summarise Work-Life Balance grouped by Overtime
#First, find mean of Work-Life Balance based on Overtime
balanceovertime_data <- aggregate(
  WorkLifeBalance ~ OverTime,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Work-Life Balance
barplot(WorkLifeBalance ~ OverTime,
        data = balanceovertime_data,
        main = 'Mean Work-Life Balance according to Overtime',
        xlab = 'Overtime',
        ylab = 'Mean Work-Life Balance'
)
