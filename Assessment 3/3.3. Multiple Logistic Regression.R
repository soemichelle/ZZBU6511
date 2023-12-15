# Create a Colour column 
# Set it to green for Is.Yes, black for the rest (Is.No)
employees$Colour = ifelse(employees$Attrition == 'Yes', 'green', 'black')
par(
  # Create a 3 x 2 grid of plots
  mfrow = c(3, 2),
  # Redure the margin of each plot,
  # to better utilise the space
  mar = c(4, 4, 1, 1)
)

# Make a list of pairs of variables to loop through 
pairs <- list(
  c('YearswithCurrManager', 'Age'),
  c('YearswithCurrManager', 'DistanceFromHome'),
  c('YearswithCurrManager', 'MonthlyIncome'),
  c('YearswithCurrManager', 'TotalWorkingYears'),
  c('YearswithCurrManager', 'YearsSinceLastPromotion'),
  c('YearswithCurrManager', 'TrainingTimeLastYear')
)

# Loop through the pairs 
for (pair in pairs) {
  # Create a scatter plot of the pair
  plot(
    x = employees[[pair[1]]],
    y = employees[[pair[2]]],
    pch = 19,
    col = employees$Colour,
    xlab = pair[1],
    ylab = pair[2]
  )
  # Show the grid
  grid()
}

