library(tidyverse)
library(lubridate)

setwd(file.path("..", "examples"))

auto_path <- file.path("..", "datasets1", "Auto.csv")
auto <- read_csv(auto_path)
glimpse(auto)

rename(
  auto,
  observation = X1
)

dup_dates <- duplicated(auto[,"name"]) | duplicated(auto[,"name"], fromLast=TRUE)
dup_dates_auto <- auto[dup_dates, c('name', 'year')]
head(dup_dates_auto)

ggplot(auto, aes(x = weight, y = horsepower)) +
  geom_point() +
  facet_wrap(~cylinders)

