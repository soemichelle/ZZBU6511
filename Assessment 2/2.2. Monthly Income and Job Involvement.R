#How does Monthly Income impact Relationship Satisfaction

#Create a conditional column to group Monthly Income in employees_data

#Check the quantile of Monthly Incomes to create bins
quantile(employees_data$MonthlyIncome)

employees_data$IncomeGroup[employees_data$MonthlyIncome <= 3000] <- '1.Low Income' 

employees_data$IncomeGroup[employees_data$MonthlyIncome > 3000 & employees_data$MonthlyIncome <= 5000] <- '2.Low-Middle Income'

employees_data$IncomeGroup[ employees_data$MonthlyIncome > 5000 & employees_data$MonthlyIncome <= 9000] <- '3.High-Middle Income'

employees_data$IncomeGroup[employees_data$MonthlyIncome > 9000] <- '4.High Income'
                  

#Summarise Job Involvement rating grouped by Income Group
#First, find mean of Job Involvement based on Income Group 
involvementincome_data <- aggregate(
  JobInvolvement ~ IncomeGroup,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Job Involvement
involvement_plot <- barplot(JobInvolvement ~ IncomeGroup,
data = involvementincome_data,
main = 'Mean Job Involvement according to Monthly Income Group',
xlab = 'Monthly Income Group',
ylab = 'Mean Job Involvement'
)

#plot(x = employees_data$IncomeGroup,
#y = employees_data$RelationshipSatisfaction,
#type = 'o',
#col = 'blue',
#xlab = 'Income Group',
#ylab = 'Relationship Satisfaction')

