#Categorise the different Stock Option Levels 
employees_data$StockOptionLevelGroup[employees_data$StockOptionLevel == '0'] <- '(0) None'
employees_data$StockOptionLevelGroup[employees_data$StockOptionLevel == '1'] <- '(1) Some'
employees_data$StockOptionLevelGroup[employees_data$StockOptionLevel == '2'] <- '(2) High'
employees_data$StockOptionLevelGroup[employees_data$StockOptionLevel == '3'] <- '(3) Very High'

#Summarise Performance Rating grouped by Stock Option Level
#First, find mean of Performance Rating based on Stock Option Level 
performancestock_data <- aggregate(
  PerformanceRating ~ StockOptionLevelGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Performance Rating
barplot(PerformanceRating ~ StockOptionLevelGroup,
        data = performancestock_data,
        main = 'Mean Performance Rating according to Stock Option Level',
        xlab = 'Stock Option Level Group',
        ylab = 'Mean Performance Rating'
)

