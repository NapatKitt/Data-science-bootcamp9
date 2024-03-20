## Homework transform data nycflight13

library(nycflights13)
library(tidyverse)


## ask 5 questions about this dataset
data("flights")
view(flights)

## explore data
dim(flights)
head(flights)
colnames(flights)

## explore airlines dataset
head(airlines)

## count month
flights %>%
  select(month, carrier) %>%
  count(month) %>%
  arrange(desc(n))

flights %>%
  group_by(month) %>%
  summarise(total_flights = n()) %>%
  arrange(desc(total_flights))


## month 7 destiantion
flights %>%
  filter(month == 7, year == 2013) %>%
  count(dest) %>%
  arrange(-n)

flights %>%
  filter(month == 7) %>%
  group_by(dest) %>%
  summarise(total_flights = n()) %>%
  arrange(desc(total_flights)) %>%
  head(1)

## month 7 the most carrier
flights %>%
  filter(month == 7) %>%
  group_by(carrier) %>%
  summarise(total_carrier = n()) %>%
  arrange(desc(total_carrier))



## which carrier is the most delay flight
flights %>%
  select(carrier, dep_delay) %>%
  arrange(dep_delay)


## count airline and join with flights
flights %>%
  count(carrier) %>%
  inner_join(airlines) %>%
  arrange(desc(n))

# which airlines have longest distance
flights %>%
  select(carrier, dest) %>%
  group_by(dest) %>%
  summarise(max_dis = max(distance),
            min_dis = min(distance),
            avg_dis = mean(distance),
            median_dis = median(distance)) %>%
  inner_join(airlines) %>%
  arrange(desc(max_dis))

## average distance
flights %>%
  group_by(carrier) %>%
  summarise(avg_distance = mean(distance)) %>%
  arrange(desc(avg_distance)) %>%
  inner_join(airlines)
## UA distance
flights %>%
  filter(carrier == "UA") %>%
  select(dest) %>%
  summarise(total_dest = sum(distance)) %>%
  group_by(dest) %>%
  arrange(desc(distance))

flights %>%
  filter(carrier == "UA") %>%
  group_by(dest, carrier) %>%
  summarise(total_flights = n()) %>%
  arrange(desc(total_flights))


## count destination from UA airlines
flights %>%
  filter(carrier == "UA") %>%
  count(dest) %>%
  arrange(-n)


## HA carrier goes to
ha_flights <- flights %>%
  filter(carrier == "HA")
view(ha_flights)
# average hour per flights

## test rm.na = TURE
flights %>%
  group_by(carrier, dest) %>%
  summarise(average_distance = mean(distance, na.rm = TRUE)) %>%
  arrange(desc(average_distance))


flights %>%
  group_by(carrier) %>%
  summarise(avg_distance = mean(distance)) %>%
  arrange(desc(avg_distance))


## arr_delay
flights %>%
  select(carrier, arr_delay) %>%
  arrange(desc(arr_delay))

## fliter December flights

flights %>%
  filter(month == 12, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n))

flights %>%
  filter(month == 12, year == 2013) %>%
  count(dest) %>%
  arrange(desc(n))

flights %>%
  filter(month == 12, year == 2013) %>%
  group_by(carrier, dest, month) %>%
  summarise(total_flights = n()) %>%
  arrange(desc(total_flights))
