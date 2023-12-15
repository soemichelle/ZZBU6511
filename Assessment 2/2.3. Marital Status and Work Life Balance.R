#Summarise Work-Life Balance grouped by Marital Status
#First, find mean of Work-Life Balance based on Marital Status
balancemarital_data <- aggregate(
  WorkLifeBalance ~ MaritalStatus,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Work-Life Balance
barplot(WorkLifeBalance ~ MaritalStatus,
        data = balancemarital_data,
        main = 'Mean Work-Life Balance according to Marital Status',
        xlab = 'Marital Status',
        ylab = 'Mean Work-Life Balance'
)
