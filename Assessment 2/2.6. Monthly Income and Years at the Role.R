#Summarise Years in Current Role grouped by Income Group
#First, find mean of Years in Current Role based on Income Group 
roleincome_data <- aggregate(
  YearsInCurrentRole ~ IncomeGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Years in Current Role
barplot(YearsInCurrentRole ~ IncomeGroup,
        data = roleincome_data,
        main = 'Mean Years in Current Role according to Monthly Income Group',
        xlab = 'Monthly Income Group',
        ylab = 'Mean Years in Current Role'
)
