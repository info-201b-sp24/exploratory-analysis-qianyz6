library(tidyverse)
library(ggplot2)
# Ensure date_added column is of Date type
netflix_df$date_added <- as.Date(netflix_df$date_added, format = "%B %d, %Y")

# Extract year from date_added column
netflix_df$year_added <- format(netflix_df$date_added, "%Y")

# Filter out rows with NA in year_added
netflix_df <- netflix_df %>% filter(!is.na(year_added))

# Calculate the total number of movies and TV shows released each year by type
yearly_counts <- netflix_df %>%
  group_by(year_added, type) %>%
  summarise(count = n(), .groups = "drop") %>%
  arrange(year_added)

# Plot the line graph
ggplot(data = yearly_counts, aes(x = year_added, y = count, color = type, group = type)) +
  geom_line() +
  geom_point() +
  labs(title = "Number of Movies and TV Shows Released Each Year On Netflix",
       x = "Year",
       y = "Count",
       color = "Type") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1))