#Summarise Years at Company grouped by Income Group
#First, find mean of Years in Current Role based on Income Group 
companyincome_data <- aggregate(
  YearsAtCompany ~ IncomeGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Years at Company
barplot(YearsAtCompany ~ IncomeGroup,
        data = companyincome_data,
        main = 'Mean Years at Company according to Monthly Income Group',
        xlab = 'Monthly Income Group',
        ylab = 'Mean Years at Company'
)
