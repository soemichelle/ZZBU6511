#Summarise Job Involvement grouped by Stock Option Level
#First, find mean of Job Involvement based on Stock Option Level 
involvementstock_data <- aggregate(
  PerformanceRating ~ StockOptionLevelGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Job Involvement
barplot(PerformanceRating ~ StockOptionLevelGroup,
        data = performancestock_data,
        main = 'Mean Job Involvement according to Stock Option Level',
        xlab = 'Stock Option Level Group',
        ylab = 'Mean Job Involvement'
)

