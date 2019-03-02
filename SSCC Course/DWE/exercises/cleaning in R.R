library(tidyverse)
library(lubridate)

setwd(file.path(".", "exercises"))
psid_path <- file.path("..", "datasets1", "PSID.CSV")
psid <- read_csv(psid_path, col_types = cols(married = col_factor(NULL), kids = (col_factor(NULL))))
glimpse(psid)

dup_dates <- duplicated(psid[,"intnum"]) | duplicated(psid[,"intnum"], fromLast=TRUE)
dup_dates_psid <- psid[dup_dates, c('intnum', 'persnum')]

head(dup_dates_psid, n=15)
