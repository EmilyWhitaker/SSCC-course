library(tidyverse)
mtcars_path <- file.path(".", "datasets1", "mtcars.csv")
mtcars_in1 <- read_csv(mtcars_path)

mtcars <-
  mtcars_in1 %>%
  mutate(
    cyl = factor(cyl),
    gear = factor(gear),
    carb = factor(carb)
    )

glimpse(mtcars)


mtcars <-
  mtcars %>%
  mutate(
    horses = cut(hp, 
                     breaks = c(-Inf, 100, 170, 240, 300),
                     labels = c("very low", "low", "mid", "high")
                )
    )
    
glimpse(mtcars)


most_eff <-
  mtcars %>%
  group_by(cyl) %>%
  mutate(
    mpg_rank = rank(mpg)
  ) %>%
  filter(mpg_rank ==max(mpg_rank)) %>%
  ungroup()

glimpse(most_eff)


mtcars <-
  mtcars %>%
  mutate(
    mpg_per_wt = mpg / wt
  )

mtcars %>%
  select(X1, wt, mpg, mpg_per_wt) %>%
  head()

graph <- qplot(mpg_per_wt, hp, data= mtcars, facets= cyl)
graph2 <- qplot(mpg_per_wt, disp, data= mtcars, fecets =cyl)

  






eff_cyl_gear <-
  mtcars %>%
  group_by(cyl, gear) %>%
  mutate(
    num_group_obs = n(),
    efficiency_rank = rank(mpg_per_wt)
  ) %>%
  filter(
    num_group_obs >= 2,
    efficiency_rank == 1
  ) %>%
  ungroup()
  

