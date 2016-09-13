library(dplyr)
library(purrr)
library(ggplot2)

uniforms <- function(numbers){
  mini_sequence <- runif(numbers, 0, 1)
  mean(mini_sequence)
}

long_sequence <- seq(1, 10000)
str(long_sequence)

AllMeans <- map(long_sequence, uniforms) %>% unlist()
str(AllMeans)

MeanSequence <- tibble("Means" = AllMeans, "Sequence" = long_sequence)

ggplot(MeanSequence, aes(x = Sequence, y = Means)) + geom_point(alpha = 0.5)
