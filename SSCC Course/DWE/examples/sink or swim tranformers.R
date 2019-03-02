library(tidyverse)
library(lubridate)

setwd(file.path("..", "examples"))

titanic_path <- file.path("..", "datasets1", "TitanicSurvival.csv")
titanic_in <- read_csv(titanic_path)
glimpse(titanic_in)

titanic <- 
  titanic_in %>%
  rename(
    name = X1,
    class = passengerClass
  )

glimpse(titanic)


dups <-
  titanic %>%
  slice(duplicated(titanic[,"name"]) | duplicated(titanic[,"name"], fromLast=TRUE)) %>%
  select(name, age, class)

glimpse(dups)

titanic <- mutate(titanic, class = str_c(class, " class"))

titanic %>%
  select(name, class) %>%
  head()


titanic <-
  titanic %>%
  separate(name, c("last", "first"), sep = ",", extra = "merge", remove = FALSE) %>%
  separate(first, c("title", "first"), sep = ". ", extra = "merge")

glimpse(titanic)

titanic <-
  titanic %>%
  mutate(woman = str_detect(title, "M.+s$"))

titanic %>%
  select(title, woman) %>%
  head()

titanic <-
  titanic %>%
  unite(class_sex, class, sex, sep = " ", remove = FALSE)

titanic %>%
  select(name, class_sex, class, sex) %>%
  head()

