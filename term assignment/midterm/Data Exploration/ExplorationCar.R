library(stringr)
library(readr)
library(assertive)
library(dplyr)

Car_Prices <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/007-Car-Prices-Dataset/master/term%20assignment/midterm/Data%20Exploration/Car_Prices_Dataset_Original.csv")
glimpse(Car_Prices)
summary(Car_Prices)
