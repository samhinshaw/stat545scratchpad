library(gapminder)
library(tidyverse)
library(ggplot2)
library(knitr)
new_gap <- gapminder %>% 
  group_by(year) %>% 
  summarise(lifeExp_weightedM = weighted.mean(lifeExp,pop), 
            M_unweighted = mean(lifeExp))

new_gap %>% ggplot(aes(x = year, y = lifeExp_weightedM)) + 
  geom_smooth(aes(year, lifeExp_weightedM, color= "hotpink")) + 
  geom_smooth(linetype= 2, 
              aes(year,M_unweighted, color = "purple"))

tidy_gap <- gather(new_gap, "M_type", "M_lifeExp", 2:3)
# Does this work too?
tidy_gap <- gather(new_gap, "M_type", "M_lifeExp", c(lifeExp_weightedM, M_unweighted))

ggplot(tidy_gap, aes(x = year, y = M_lifeExp, color = M_type)) + 
  geom_smooth()

tidy_gap %>% arrange(year) %>% head(n = 4) %>% kable()
