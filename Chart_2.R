# Load necessary packages
library(tidyverse)
library(ggplot2)
# Group by rating and count, excluding rows with "min" in the rating
rating_counts <- netflix_df %>%
  filter(!is.na(rating) & !str_detect(rating, "min")) %>%  # Filter out NA values and ratings containing "min"
  group_by(rating) %>%
  summarise(count = n(), .groups = "drop") %>%
  arrange(desc(count))

# Plot the horizontal bar chart with fill colors
ggplot(data = rating_counts, aes(x = count, y = reorder(rating, count), fill = rating)) +
  geom_bar(stat = "identity") +
  labs(title = "Frequency of Ratings on Netflix",
       x = "Count",
       y = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  scale_fill_viridis_d()