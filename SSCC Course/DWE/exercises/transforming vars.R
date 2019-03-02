library(tidyverse)
forbes_path <- file.path(".", "datasets1", "Forbes2000.csv")
forbes_in <- read_csv(forbes_path)

cols(
  X1 = col_integer(),
  rank = col_integer(),
  name = col_character(),
  country = col_character(),
  category = col_character(),
  sales = col_double(),
  profits = col_double(),
  assets = col_double(),
  marketvalue = col_double()
  )

forbes <- 
  forbes_in %>%
  select(-X1) %>%
  rename(
    market_value = marketvalue
  )

glimpse(forbes)

forbes <- mutate(forbes, sales = str_c("$", sales))

forbes %>%
  select(name, country, sales) %>%
  glimpse()

forbes <- 
  forbes %>%
  mutate(
    sales = parse_number(sales)
  )

forbes %>%
  select(sales) %>%
  head()

sales <- forbes$sales
sales[1:3] <- c(3, 2, 1)

head(sales)

forbes <-
  forbes %>%
  mutate(
    category = factor(category)
  )

glimpse(forbes)


forbes <- mutate(forbes, category = as.character(category))

category_lev <-
  forbes %>%
  select(category) %>%
  distinct(category) %>%
  arrange(category) %>%
  pull()

head(category_lev)

forbes <-
  forbes %>%
  mutate(
    category = as.character(category),
    category = parse_factor(category, levels = category_lev)
  )

glimpse(forbes)


forbes <-
  forbes %>%
  mutate(
    profit_lev = cut(profits, 
                     breaks = c(-Inf, .08, .44, 10, Inf),
                     labels = c("low", "mid", "high", "very high")
    )
  )

glimpse(forbes)


forbes <-
  forbes %>%
  mutate(
    nafta = country %in% c("United States", "Canada", "Mexico")
  )

glimpse(forbes)

largest_market_value <-
  forbes %>%
  group_by(country) %>%
  mutate(
    size_rank = rank(market_value)
  ) %>%
  filter(size_rank == max(size_rank)) %>%
  ungroup()

largest_market_value %>%
  select(name, country, market_value, sales, profits) %>%
  head()

largest_market_value <-
  forbes %>%
  separate(country, "country_mv", sep = "/", remove = FALSE, extra = "drop") %>%
  group_by(country_mv) %>%
  mutate(
    size_rank = rank(market_value)
  ) %>%
  filter(size_rank == max(size_rank)) %>%
  ungroup()

largest_market_value %>%
  select(name, country, market_value, sales, profits) %>%
  head()

largest_three <-
  forbes %>%
  separate(country, "country_mv", sep = "/", remove = FALSE, extra = "drop") %>%
  group_by(country_mv) %>%
  mutate(
    num_companies = n(),
    size_rank = row_number(desc(market_value))
  ) %>%
  filter(num_companies >= 3) %>%
  ungroup() %>%
  arrange(country_mv, size_rank)

largest_three %>%
  filter(size_rank <= 3) %>%
  arrange(country_mv, size_rank) %>%
  select(name, country, market_value, size_rank) %>%
  head()



