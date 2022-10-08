install.packages("tidyverse")

library(tidyverse)
?tidyverse
library(dplyr)
library(lubridate)
setwd("D:/Vishakh's/Official/CAREER DEVELOPMENT/GOOGLE ANALYTICS/Portfolio Case Study/Case Study 1 Bike Share Case Study/Datasets/CSV Files/TripDetails_Clean")
BikeShareData_Clean <- read_csv("BikeShareData_Clean.csv")
head(BikeShareData_Clean)

str(BikeShareData_Clean)

RidesLast12Months <- BikeShareData_Clean %>%
  select(ride_id, member_casual, rideable_type, started_at, ended_at)

head(RidesLast12Months)

RidesLast12Months <- RidesLast12Months %>%
  transform(started_at = substr(started_at, 1, 10), ended_at = substr(ended_at, 1, 10)) %>%
  
RidesLast12Months$started_at <- ymd(RidesLast12Months$started_at)
RidesLast12Months$ended_at <- ymd(RidesLast12Months$ended_at)

head(RidesLast12Months)

head(RidesLast12Months)

RideCounts_Last12Months <- RidesLast12Months %>%
  select(ride_id, member_casual, started_at) %>%
  group_by(member_casual, started_at) %>%
  summarize(ride_count = n())

head(RideCounts_Last12Months)

ggplot(RideCounts_Last12Months)+geom_point(mapping = aes(x = started_at, y = ride_count, color = member_casual)) + geom_smooth(method = "gam", mapping=aes(x = started_at, y = ride_count))

ggplot(RideCounts_Last12Months)+geom_point(mapping = aes(x = started_at, y = ride_count, color = member_casual)) + geom_smooth(method = "gam", mapping=aes(x = started_at, y = ride_count)) + facet_wrap(~member_casual)

RideCounts_Last12Months <- RidesLast12Months %>%
  select(ride_id, member_casual, rideable_type, started_at)

ggplot(RideCounts_Last12Months) + geom_bar(mapping = aes(x = rideable_type, fill = rideable_type)) + facet_wrap(~member_casual)


RideCounts_Last12Months <- RidesLast12Months %>%
  select(ride_id, member_casual, rideable_type, started_at) %>%
  group_by(member_casual, rideable_type, started_at) %>%
  summarize(ride_count = n())

head(RideCounts_Last12Months)

ggplot(RideCounts_Last12Months) + geom_point(mapping = aes(x = started_at, y = ride_count, color = rideable_type)) + facet_wrap(~member_casual)

RideCounts_Last12Months <- RidesLast12Months %>%
  select(ride_id, member_casual, rideable_type, started_at)

ggplot(RideCounts_Last12Months) + geom_bar(mapping = aes(x = rideable_type, fill = rideable_type)) + facet_wrap(~member_casual)

colnames(BikeShareData_Clean)

str(BikeShareData_Clean)


glimpse(BikeShareData_Clean)

RideDates <- BikeShareData_Clean %>%
  select(ride_id, member_casual, started_at, ended_at)

glimpse(RideDates)


RideDates <- RideDates %>%
  transform(started_at1 = substr(started_at, 1, 10))

glimpse(RideDates)

RideDates <- RideDates %>%
  transform(ended_at2 = substr(ended_at, 1, 10))

glimpse(RideDates)

RideDates <- RideDates %>%
  select(ride_id, member_casual, started_at1, ended_at2)

head(RideDates)

str(RideDates)


view(ridecount)
?as.character
RideDates$ride_id <- as.character(RideDates$ride_id)

head(RideDates)
str(RideDates)

ridecount <- RideDates %>%
  select(ride_id, member_casual) %>%
  group_by(member_casual) %>%
  summarize(rideCount = count(ride_id))

RideDates$member_casual <- as.character(RideDates$member_casual)

str(RideDates)

ridecount <- RideDates %>%
  select(ride_id, member_casual) %>%
  group_by(member_casual) %>%
  summarise(rideCount = n())

view(ridecount)

RideDates$started_at1 <- ymd(RideDates$started_at1)

RideDates$ended_at2 <- ymd(RideDates$ended_at2)

str(RideDates)

as.data.frame(Order.Date) %>%
  mutate(Month = month.abb[lubridate::month(Order.Date, label = TRUE)],
         Year = lubridate::year(Order.Date))

RideDates2 <- RideDates %>%
  mutate(month = month.abb[lubridate::month(started_at1)], year = lubridate::year(started_at1))

head(RideDates2)

RideDates <- RideDates %>%
  group_by(member_casual, started_at1) %>%
  summarize(ridecount = n())

view(RideDates)

ggplot(RideDates) + geom_point(mapping = aes(x = started_at1, y = ridecount, color = member_casual))



