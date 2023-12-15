# Set up a 1 x 3 grid of plots
par(
  mfrow = c(1, 3)
)
role_involvement_relationship_environment_data <- aggregate(
  cbind(JobInvolvement, RelationshipSatisfaction, EnvironmentSatisfaction) ~ JobRole,
  data = employees_data,
  FUN = mean
)
# Produce the first plot
barplot(
  JobInvolvement ~ JobRole,
  data = role_involvement_relationship_environment_data
)
# Produce the second plot
barplot(
  RelationshipSatisfaction ~ JobRole,
  data = role_involvement_relationship_environment_data

)
# Produce the third plot
barplot(
  EnvironmentSatisfaction ~ JobRole,
  data = role_involvement_relationship_environment_data,
  col = ifelse(
  role_involvement_relationship_environment_data$JobRole == 'Healthcare Representative', 'green', 
  ifelse(role_involvement_relationship_environment_data$JobRole == 'Human Resources', 'blue',
         ifelse(role_involvement_relationship_environment_data$JobRole == 'Laboratory Technician', 'red',
                ifelse(role_involvement_relationship_environment_data$JobRole == 'Manager', 'yellow',
                       ifelse(role_involvement_relationship_environment_data$JobRole == 'Manufacturing Director', 'purple',
                              ifelse(role_involvement_relationship_environment_data$JobRole == 'Research Director', 'pink',
                                     ifelse(role_involvement_relationship_environment_data$JobRole == 'Research Scientist', 'cyan',
                                            ifelse(role_involvement_relationship_environment_data$JobRole == 'Sales Executive', 'grey',
                                                   ifelse(role_involvement_relationship_environment_data$JobRole == 'Sales Representative','black'
))))))))))

  