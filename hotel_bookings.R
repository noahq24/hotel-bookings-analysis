

## Step 1: Load packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")

library(tidyverse)
library(skimr)
library(janitor)

## Step 2: Import data
hotel_bookings <- read_csv("hotel_bookings.csv")

## Step 3: Getting to know your data

head(hotel_bookings)

# 1. How many columns are in this dataset?
ncol(hotel_bookings)

# 2. The 'arrival_date_month' variable is chr or character type data.

class(hotel_bookings$arrival_date_month)

# Used `str()` and `glimpse()` functions to get summaries of each column

str(hotel_bookings)
glimpse(hotel_bookings)

#Used `colnames()` to get the names of the columns in your data set

colnames(hotel_bookings)

## Manipulating your data

# Used the arrange() function to arrange the data by most lead time to least
#lead time because you want to focus on bookings that were made far in advance

hotel_bookings%>%arrange(desc(lead_time))

# The highest lead time for a hotel booking in this data set

hotel_bookings%>% summarise( max_lead_time= max(lead_time))

#### The highest lead time for a hotel booking in this data set is 737 days.

# If you wanted to create a new data frame that had those changes saved, 
# you would use the <-
hotel_bookings_v2 <- hotel_bookings%>%arrange(desc(lead_time))
hotel_bookings_v2

# You can also find out the maximum and minimum lead times without 
# sorting the whole dataset using the `arrange()` function.

max(hotel_bookings$lead_time)
min(hotel_bookings$lead_time)
mean(hotel_bookings$lead_time)

# The average lead time is 104.0114 days.

# your boss wants to know a lot more information about city hotels, including the
# maximum and minimum lead time. They are also interested in how they are different 
# from resort hotels. You don't want to run each line of code over and over again, so you decide to use the `group_by()`and`summarize()` functions.
hotel_summary <-
  hotel_bookings%>%
  group_by(hotel) %>% 
  summarize(average_lead_time = mean(lead_time), min_lead_time = min(lead_time),max_lead_time = max(lead_time))  


