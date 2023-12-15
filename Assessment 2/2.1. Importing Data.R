#Get your working directory 
getwd()

#Import required package 
library(readr)

#Import required data 
employees_data <- read_csv('employees.csv',
                           col_types = cols(Age = col_integer(),
                                            BusinessTravel = col_character(),
                                            Department = col_character(),
                                            DistanceFromHome = col_integer(),
                                            Education = col_character(), 
                                            EnvironmentSatisfaction = col_integer(),
                                            Gender = col_character(),
                                            JobInvolvement = col_integer(),
                                            JobRole = col_character(),
                                            MaritalStatus = col_character(),
                                            MonthlyIncome = col_integer(),
                                            NumCompaniesWorked = col_integer(),
                                            OverTime = col_character(),
                                            PerformanceRating = col_integer(), 
                                            RelationshipSatisfaction = col_integer(), 
                                            StockOptionLevel = col_character(), 
                                            TotalWorkingYears = col_integer(), 
                                            TrainingTimesLastYear = col_integer(), 
                                            WorkLifeBalance = col_integer(),
                                            YearsAtCompany = col_integer(),
                                            YearsInCurrentRole = col_integer(),
                                            YearsSinceLastPromotion = col_integer(),
                                            YearsWithCurrManager = col_integer()))




