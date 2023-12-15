#Summarise Years In Current Role grouped by Stock Option Level
#First, find mean of Years in Current Role based on Stock Option Level 
rolestock_data <- aggregate(
  YearsInCurrentRole ~ StockOptionLevelGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Years In Current Role
barplot(YearsInCurrentRole ~ StockOptionLevelGroup,
        data = rolestock_data,
        main = 'Mean Years in Current Role according to Stock Option Level',
        xlab = 'Stock Option Level Group',
        ylab = 'Mean Years in Current Role'
)
