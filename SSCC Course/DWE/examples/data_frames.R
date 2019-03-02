

library(tidyverse)


df <-
  data_frame(
    A = c(1, 2, 3, 4, 5),
    B = c(5, 3, 2, 1, 4)
  )

class(df)

glimpse(df)

#read_csv section

Chile_path <- file.path("datasets1", "Chile.csv")
print(Chile_path)

Chile <- read_csv(Chile_path)

glimpse(Chile)

#different section 2.3.3.1
setwd("./examples")

attnd_path <- file.path("..", "datasets1", "attendance.csv")
attnd <- read_csv(attnd_path, 
                  skip = 2, 
                  na = c("", "NA", "?", "(?)")
                  )


head(attnd)

attnd[10:13, 12:16]

