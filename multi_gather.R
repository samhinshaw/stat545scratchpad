## Libraries & Data.Frames -----

library(tidyverse)
input <- frame_data(
  ~hw,   ~name,  ~mark,   ~pr,
  "hw1", "anna",    95,  "ok",
  "hw1", "alan",    90, "meh",
  "hw1", "carl",    85,  "ok",
  "hw2", "alan",    70, "meh",
  "hw2", "carl",    80,  "ok"
)

## Multi-Gather -----

input %>%
  gather(key = element, value = score, mark, pr) %>%
  unite(thing, hw, element, remove = TRUE) %>%
  spread(thing, score, convert = TRUE)

## Multi-Spread -----

input %>%
  gather(mark, pr, key = element, value = score) %>%
  spread(c(hw, element), score, convert = TRUE)
