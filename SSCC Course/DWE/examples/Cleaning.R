library(tidyverse)
library(tidyverse)
library(lubridate)

setwd(file.path(".", "examples"))

getwd()

airAccs_path <- file.path("..", "datasets1", "airAccs.csv")
air_accidents <- read_csv(airAccs_path)

glimpse(air_accidents)


colnames(air_accidents)

air_accidents <-
  rename(
    air_accidents,
    date = Date,
    plane_type = planeType,
    dead = Dead,
    aboard = Aboard,
    ground = Ground,
  )

glimpse(air_accidents)

air_accidents_in <- read_csv(airAccs_path)
air_accidents <-
  rename(
    air_accidents_in,
    obs_num = 1,
    date = Date,
    plane_type = planeType,
    dead = Dead,
    aboard = Aboard,
    ground = Ground
  )

air_accidents <-
  rename(
    air_accidents_in,
    obs_num = 1,
    date = Date,
    plane_type = planeType,
    dead = Dead,
    aboard = Aboard,
    ground = Ground
  )

glimpse(air_accidents)

air_accidents <-
  select(air_accidents, date, plane_type, dead, aboard, ground)

glimpse(air_accidents)

air_accidents <-
  rename(
    air_accidents_in,
    obs_num = 1,
    date = Date,
    plane_type = planeType,
    dead = Dead,
    aboard = Aboard,
    ground = Ground
  )

air_accidents <- select(air_accidents, -obs_num)

glimpse(air_accidents)

slice(air_accidents, 1:5)

air_accidents_test <- slice(air_accidents, 1:10)
glimpse(air_accidents_test)

air_accidents <- 
  mutate(
    air_accidents,
    operator = na_if(operator, "?"),
    plane_type = recode(plane_type, "?" = NA_character_)
  )

air_accidents[63:68, c("location", "operator", "plane_type")]

air_accidents <- 
  mutate_at(air_accidents, vars(operator, plane_type), ~ na_if(., "?"))

glimpse(air_accidents)
