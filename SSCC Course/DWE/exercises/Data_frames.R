 setwd(./exercises)
 library(tidyverse)
 mtcars_path <- file.path("..", "datasets1", "mtcars.csv")
 mtcars<- read_csv(mtcars_path)
 print(mtcars)
 
 cane_path <- file.path("..", "datasets1", "cane.csv")
 cane<-read_csv(cane_path)
 print(cane)
 
 
 
amis_path <- file.path("..","datasets1", "amis.csv")
amis <- read_csv(amis_path,skip = 10)
print(amis)

head(amis)

mifem_path <- file.path("..", "datasets1", "mifem.csv")
mifem <- read_csv(mifem_path)
print(mifem)
