#Summarise Work-Life Balance grouped by Travel
#First, find mean of Work-Life Balance based on Travel
balancetravel_data <- aggregate(
  WorkLifeBalance ~ BusinessTravel,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Work-Life Balance
barplot(WorkLifeBalance ~ BusinessTravel,
        data = balancetravel_data,
        main = 'Mean Work-Life Balance according to Travel',
        xlab = 'Travel',
        ylab = 'Mean Work-Life Balance'
)

