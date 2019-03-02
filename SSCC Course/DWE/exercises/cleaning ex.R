library(tidyverse)

setwd("../exercises")

psid_path <- file.path("..", "datasets1", "PSID.CSV")
psid <- read_csv(psid_path, col_types = cols(married = col_factor(NULL), kids = (col_factor(NULL))))
glimpse(psid)

colnames(psid)

psid <-
  rename(
    psid,
    education= educatn,
    income = earnings,
    )

glimpse(psid)

psid <- select(psid, -X1)
glimpse(psid)

slice (psid, 6:8)
psid[4854:4856, ]
psid_test <- slice(psid, 1:20)
glimpse(psid_test)

