summary_table <- data.frame(
  streaming_name = c("netflix", "hulu", "amazon", "disney"),
  movie_ratio = c(summary_info$movie_num_netflix / summary_info$total_num_netflix, summary_info$movie_num_hulu / summary_info$total_num_hulu, summary_info$movie_num_amazon / summary_info$total_num_amazon, summary_info$movie_num_disney / summary_info$total_num_disney)
)
summary_table <- summary_table %>% mutate(Tv_ratio = 1 - movie_ratio)
print(summary_table)