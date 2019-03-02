library(tidyverse)
library(lubridate)

setwd(file.path("..", "exercises"))

mtcars_path <- file.path("..", "datasets1", "mtcars.csv")
mtcars_in <- read_csv(mtcars_path)
glimpse(mtcars_in)

mtcars <- 
  mtcars_in %>%
  rename(
    name = X1
  )

mtcars <-
  mtcars %>%
  separate(name, c("make", "model"), sep = " ", extra = "merge", remove = FALSE) %>%
  head()

titanic <-
  titanic %>%
  mutate(company = str_detect(make, "Chry", "GM", "Ford"))

titantic <-
  titantic %>%
  unite( "make", " ", (company), "model")