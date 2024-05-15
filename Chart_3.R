# Load necessary packages
library(tidyverse)
library(ggplot2)

# Ensure date_added column is of Date type
netflix_df$date_added <- as.Date(netflix_df$date_added, format = "%B %d, %Y")

# Extract year from date_added column
netflix_df$year_added <- format(netflix_df$date_added, "%Y")

# Filter out rows with NA in release_year or year_added
netflix_df <- netflix_df %>%
  filter(!is.na(release_year) & !is.na(year_added))

# Convert year_added to numeric
netflix_df$year_added <- as.numeric(netflix_df$year_added)

# Calculate the difference in years
netflix_df <- netflix_df %>%
  mutate(year_difference = year_added - release_year)

# Filter out differences greater than 50 years
netflix_df <- netflix_df %>%
  filter(abs(year_difference) <= 50)

# Group by year_difference and count
year_diff_counts <- netflix_df %>%
  group_by(year_difference) %>%
  summarise(count = n(), .groups = "drop") %>%
  arrange(year_difference)

# Plot the histogram with fill colors and adjust legend size
ggplot(data = year_diff_counts, aes(x = year_difference, y = count, fill = as.factor(year_difference))) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Year Difference Between Release and Streaming Addition",
       x = "Year Difference",
       y = "Count",
       fill = "Year Difference") +
  theme_minimal() +
  scale_fill_viridis_d() +  # Optionally, use a color scale like viridis
  theme(
    axis.text.x = element_text(angle = 0, hjust = 1),
    legend.title = element_text(size = 8),  # Smaller legend title
    legend.text = element_text(size = 6),   # Smaller legend text
    legend.key.size = unit(0.5, "lines")   # Smaller legend keys
  )
