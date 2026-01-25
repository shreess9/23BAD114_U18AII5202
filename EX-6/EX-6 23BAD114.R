# Roll No: 23BAD114
#Multivariate Analysis

library(ggplot2)
library(GGally)
library(dplyr)


retail_data <- read.csv("C:/Users/praniga s/Downloads/6.retail_business.csv")
retail_data <- na.omit(retail_data)

ggparcoord(
  retail_data,
  columns = which(names(retail_data) %in% c("Sales", "Profit")),
  groupColumn = which(names(retail_data) == "Customer_Segment"),
  scale = "uniminmax",
  showPoints = TRUE
) +
  labs(
    title = "Parallel Coordinate Plot for Sales and Profit",
    color = "Customer Segment"
  ) +
  theme_minimal()

ggplot(retail_data, aes(
  x = Sales,
  y = Profit,
  size = Sales,
  color = Customer_Segment
)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Bubble Chart: Sales vs Profit",
    x = "Sales",
    y = "Profit",
    size = "Sales"
  ) +
  theme_minimal()

ggplot(retail_data, aes(
  x = Sales,
  y = Profit,
  color = Customer_Segment
)) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ Region) +
  labs(
    title = "Trellis Display of Sales vs Profit by Region",
    x = "Sales",
    y = "Profit"
  ) +
  theme_minimal()
