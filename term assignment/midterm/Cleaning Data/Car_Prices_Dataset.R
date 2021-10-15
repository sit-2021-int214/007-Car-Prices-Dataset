## Library
library(stringr)
library(readr)
library(assertive)
library(dplyr)

# Dataset
cpd <- read.csv("C:/Users/C0MPUT3R/Desktop/car_dataset.csv")

# Cleaning Data
## Remove Duplicate Data
cpd <- cpd %>% distinct()
## Change Mileage datatype from chr to numeric (remove 'km' and cast type to numeric)
cpd$Mileage <- cpd$Mileage %>% str_remove("km") %>% str_trim() %>% as.numeric()
## Replace '-' to 0 and change Levy datatype from chr to numeric
cpd$Levy <- replace(cpd$Levy,cpd$Levy == '-' , 0) %>% as.numeric()
## Change Leather.interior datatype from chr to logical (replace 'Yes' to TRUE , 'No' to FALSE)
cpd$Leather.interior <- cpd$Leather.interior %>% replace(cpd$Leather.interior == 'Yes',TRUE) %>% replace(cpd$Leather.interior == 'No',FALSE) %>% as.logical()
## Remove unused column from dataset
cpd <- select(cpd,-c(Doors,Wheel,Engine.volume))
## Scope Mileage between 0 - 200000
cpd <- cpd %>% filter(Mileage <= 200000)

glimpse(cpd)