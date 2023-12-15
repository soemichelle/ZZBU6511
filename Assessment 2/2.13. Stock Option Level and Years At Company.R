#Summarise Years at Company grouped by Stock Option Level
#First, find mean of Years at Company based on Stock Option Level 
companystock_data <- aggregate(
  YearsAtCompany ~ StockOptionLevelGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Years At Company
barplot(YearsAtCompany ~ StockOptionLevelGroup,
        data = companystock_data,
        main = 'Mean Years at Company according to Stock Option Level',
        xlab = 'Stock Option Level Group',
        ylab = 'Mean Years at Company'
)
