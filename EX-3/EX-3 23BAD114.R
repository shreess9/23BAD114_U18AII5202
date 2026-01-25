# Roll Number: 23BAD114
# Multivariate Data Visualization - Healthcare Analytics

library(ggplot2)
library(GGally)
library(dplyr)

health_data <- read.csv("healthcare_data.csv")

health_data <- na.omit(health_data)

health_data$Age_Group <- cut(
  health_data$Age,
  breaks = c(0, 30, 50, 100),
  labels = c("Young", "Middle-aged", "Senior")
)
  health_data,
  columns = c("Age", "BMI", "Glucose", "Blood_Pressure"),
  aes(color = Age_Group, alpha = 0.7)
)

correlation_matrix <- cor(
  health_data[, c("Age", "BMI", "Glucose", "Blood_Pressure")]
)

print(correlation_matrix)
