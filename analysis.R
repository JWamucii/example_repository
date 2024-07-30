# Load necessary libraries
library(ggplot2)
library(dplyr)
library(magrittr) # In case dplyr doesn't load the %>% operator automatically

# Create a data frame with HorseID, Weight carried, and Position finished
race_data <- data.frame(
  HorseID = 1:10,
  Weight = c(150, 160, 155, 145, 170, 165, 160, 150, 155, 165),
  Position = c(1, 3, 2, 5, 7, 6, 4, 8, 9, 10)
)

# Print the data frame
print(race_data)

# Summary statistics
summary_stats <- race_data %>%
  summarise(
    avg_weight = mean(Weight),
    avg_position = mean(Position),
    weight_sd = sd(Weight),
    position_sd = sd(Position)
  )

# Print summary statistics
print(summary_stats)

# Create a scatter plot of Weight vs Position
plot <- ggplot(race_data, aes(x = Weight, y = Position)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  theme_minimal() +
  labs(title = "Weight Carried vs Finishing Position",
       x = "Weight Carried (lbs)",
       y = "Finishing Position")

# Save the plot
ggsave("weight_vs_position.png", plot = plot)

# Print a message
print("Analysis complete. Plot saved as weight_vs_position.png.")

