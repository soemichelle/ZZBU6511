# Set up a 2 x 2 grid of plots
par(
  mfrow = c(2, 2)
)
department_involvement_relationship_environment_performance_data <- aggregate(
  cbind(JobInvolvement, RelationshipSatisfaction, EnvironmentSatisfaction, PerformanceRating) ~ Department,
  data = employees_data,
  FUN = mean
)
# Produce the first plot
barplot(
  JobInvolvement ~ Department,
  data = department_involvement_relationship_environment_performance_data,
  main = 'Job Involvement vs. Department'
)
# Produce the second plot
barplot(
  RelationshipSatisfaction ~ Department,
  data = department_involvement_relationship_environment_performance_data,
  main = 'Relationship Satisfaction vs. Department'
)
# Produce the third plot
barplot(
  EnvironmentSatisfaction ~ Department,
  data = department_involvement_relationship_environment_performance_data,
  main = 'Environment Satisfaction vs. Department'
)
# Produce the fourth plot
barplot(
  PerformanceRating ~ Department,
  data = department_involvement_relationship_environment_performance_data,
  main = 'Performance Rating vs. Department'
)




