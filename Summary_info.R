library(tidyverse)
library(dplyr)
# First, we import our datasets.

netflix_df <- read.csv("/Users/yinyu/INFO201/csv_files/netflix_titles.csv")
hulu_df <- read.csv("/Users/yinyu/INFO201/csv_files/hulu_titles.csv")
amazon_df <- read.csv("/Users/yinyu/INFO201/csv_files/amazon_prime_titles.csv")
disney_df <- read.csv("/Users/yinyu/INFO201/csv_files/disney_plus_titles.csv")

# Then, we create a summary information list.
summary_info <- list()

# We add the total numbers of movies and TV shows to the list.
summary_info$total_num_netflix <- nrow(netflix_df)
summary_info$total_num_hulu <- nrow(hulu_df)
summary_info$total_num_amazon <- nrow(amazon_df)
summary_info$total_num_disney <- nrow(disney_df)

# We continue to add the numbers of movies and the numbers of TV shows respectly to the list.
summary_info$movie_num_netflix <- netflix_df %>% filter(type=="Movie") %>% nrow()
summary_info$movie_num_hulu <- hulu_df %>% filter(type=="Movie") %>% nrow()
summary_info$movie_num_amazon <- amazon_df %>% filter(type=="Movie") %>% nrow()
summary_info$movie_num_disney <- disney_df %>% filter(type=="Movie") %>% nrow()

summary_info$Tv_num_netflix <- netflix_df %>% filter(type=="TV Show") %>% nrow()
summary_info$Tv_num_hulu <- hulu_df %>% filter(type=="TV Show") %>% nrow()
summary_info$Tv_num_amazon <- amazon_df %>% filter(type=="TV Show") %>% nrow()
summary_info$Tv_num_disney <- disney_df %>% filter(type=="TV Show") %>% nrow()

# Now, we print our summary information
for (name in names(summary_info)) {
  cat(name, ":", summary_info[[name]], "\n")
}
