library(tidyverse)

setwd("./examples")

auto_path <- file.path("..", "datasets1", "auto.csv")
auto <- read_csv(auto_path)
glimpse(auto)

ggplot(data = auto, mapping = aes(x = weight, y = mpg)) + 
  geom_point() +
  theme_bw()

library(tidyverse)

setwd("./examples")
psid_path <- file.path("..", "datasets1", "PSID.CSV")
psid <- read_csv(psid_path, col_types = cols(married = col_factor(NULL), kids = (col_factor(NULL))))
glimpse(psid)



ggplot(data = psid, mapping= aes(x= earnings, y= hours))+ 
  geom_point() +
  theme_bw()
  

ggplot(data = psid, mapping = aes(x= married, y= earnings))+ 
  geom_boxplot() +
  coord_flip()+
  theme_bw()

ggplot(data = psid, mapping = aes(x= married, y= earnings))+ 
  geom_boxplot() +
  theme_bw()


ggplot(data = psid, mapping= aes(x= kids, y= earnings))+ 
  geom_point() +
  theme_bw()