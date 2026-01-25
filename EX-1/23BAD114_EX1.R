# Roll Number: 23BAD114

library(ggplot2)
library(dplyr)

data <- read.csv("student_performance.csv")
data <- na.omit(data)

data <- data %>%
  mutate(Average_Marks = (Internal_Test1 + Internal_Test2 + Assignment_Marks) / 3)

subject_avg <- data %>%
  group_by(Subject) %>%
  summarise(Avg_Marks = mean(Average_Marks))

ggplot(subject_avg, aes(x = Subject, y = Avg_Marks, fill = Subject)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Subject-wise Average Marks",
    x = "Subject",
    y = "Average Marks"
  ) +
  theme_minimal()

test_avg <- data %>%
  summarise(
    Internal_Test1 = mean(Internal_Test1),
    Internal_Test2 = mean(Internal_Test2),
    Assignment = mean(Assignment_Marks)
  )

test_avg_long <- data.frame(
  Test = c("Internal Test 1", "Internal Test 2", "Assignment"),
  Average_Marks = as.numeric(test_avg)
)

ggplot(test_avg_long, aes(x = Test, y = Average_Marks, group = 1)) +
  geom_line() +
  geom_point() +
  labs(
    title = "Performance Trend Across Assessments",
    x = "Assessment",
    y = "Average Marks"
  ) +
  theme_minimal()

grade_dist <- as.data.frame(table(data$Final_Grade))
colnames(grade_dist) <- c("Grade", "Count")

ggplot(grade_dist, aes(x = "", y = Count, fill = Grade)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  labs(title = "Grade Distribution of Students") +
  theme_void()
