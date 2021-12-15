## Library
library(stringr)
library(readr)
library(assertive)
library(dplyr)

# Dataset
Car_Prices <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/007-Car-Prices-Dataset/master/term%20assignment/midterm/Data%20Exploration/Car_Prices_Dataset_Original.csv")
View(Car_Prices)
# Cleaning Data
## Remove Duplicate Data
Car_Prices <- Car_Prices %>% distinct()
## Change Mileage datatype from chr to numeric (remove 'km' and cast type to numeric)
Car_Prices$Mileage <- Car_Prices$Mileage %>% str_remove("km") %>% str_trim() %>% as.numeric()
## Replace '-' to 0 and change Levy datatype from chr to numeric
Car_Prices$Levy <- replace(Car_Prices$Levy,Car_Prices$Levy == '-' , 0) %>% as.numeric()
## Change Leather.interior datatype from chr to logical (replace 'Yes' to TRUE , 'No' to FALSE)
Car_Prices$Leather.interior <- Car_Prices$Leather.interior %>% replace(Car_Prices$Leather.interior == 'Yes',TRUE) %>% replace(Car_Prices$Leather.interior == 'No',FALSE) %>% as.logical()
## Remove unused column from dataset
Car_Prices <- select(Car_Prices,-c(Doors,Wheel,Engine.volume))
## Scope Mileage between 0 - 200000
Car_Prices <- Car_Prices %>% filter(Mileage <= 200000)
## Scope Price between 10000 - 1000000
Car_Prices <- Car_Prices %>% filter(Price >= 10000 | Price <= 1000000)



glimpse(Car_Prices)
write.csv(Car_Prices,"./CleaningData.csv")
