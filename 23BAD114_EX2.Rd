# Roll Number: 23BAD114

library(ggplot2)
library(dplyr)

# Load data
data <- read.csv("ecommerce_transactions.csv")
data <- na.omit(data)

# Histogram of transaction amounts
ggplot(data, aes(x = Transaction_Amount)) +
  geom_histogram(bins = 30, fill = "blue", color = "black") +
  labs(
    title = "Distribution of Transaction Amounts",
    x = "Transaction Amount",
    y = "Frequency"
  ) +
  theme_minimal()

# Boxplot of transaction amounts
ggplot(data, aes(y = Transaction_Amount)) +
  geom_boxplot(fill = "lightgreen") +
  labs(
    title = "Boxplot of Transaction Amounts",
    y = "Transaction Amount"
  ) +
  theme_minimal()

# Date processing
data$Transaction_Date <- as.Date(data$Transaction_Date)
data$Month <- format(data$Transaction_Date, "%b")

# Monthly sales aggregation
monthly_sales <- data %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Transaction_Amount))

# Heatmap of monthly sales
ggplot(monthly_sales, aes(x = Month, y = 1, fill = Total_Sales)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightpink", high = "orchid") +
  labs(
    title = "Heatmap of Monthly Sales Intensity",
    x = "Month",
    fill = "Sales"
  ) +
  theme_minimal()
