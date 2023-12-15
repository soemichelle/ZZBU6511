#Summarise Relationship Satisfaction grouped by Overtime
#First, find mean of Relationship Satisfaction based on Overtime
relationshipovertime_data <- aggregate(
  RelationshipSatisfaction ~ OverTime,
  data = employees_data,
  FUN = mean
)

#Plot Bar Plot to visualise relationship between Relationship Satisfaction
barplot(RelationshipSatisfaction ~ OverTime,
        data = relationshipovertime_data ,
        main = 'Mean Relationship Satisfaction according to Overtime',
        xlab = 'Overtime',
        ylab = 'Mean Relationship Satisfaction'
)


