# Part 1: Explore the dataset

# Library
library(ggplot2)
library(stringr)
library(readr)
library(dplyr)

## Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

## Explore the dataset
glimpse(dataset)

## Check for Not Available (NA)
is.na(dataset) %>% table()

## Check for duplicated data
dataset %>% filter(duplicated(dataset))

## Summary of dataset
dataset %>% summary()

# Part 2: Learning function from Tidyverse

## filter for book that have Rating below 3.5
dataset %>% filter(Rating < 3.5)

# Part 3: Transform data with dplyr and finding insight the data

## 1
dataset$Rating %>% mean() 
dataset %>% select(Rating,Book_title,Price) %>% filter(Rating > mean(Rating))

## 2
dataset$Price %>% mean()
dataset %>% select(Rating,Book_title,Price) %>% filter(Price > mean(Price) & Rating > mean(Rating))

## 3
dataset %>% select (Rating,Book_title,Price) %>% filter(Price == max(Price))

## 4
dataset %>% select (Rating,Book_title,Price) %>% filter(Price == min(Price))

## 5
dataset %>% select(Type) %>% distinct()

## 6
book_type_frequency <- as.data.frame(table(dataset$Type))
book_type_frequency$Var1[book_type_frequency$Freq == max(book_type_frequency$Freq)]

# Part 4: Visualization with GGplot2

## 1. Rating & Price Relations
scat_plot <- dataset %>% ggplot(aes(x=Rating,y=Price)) + ggtitle("Rating and Price Relaltions") + geom_point(aes(color=Type))
scat_plot

## 2. Average rating of each type of book
rating_plot <- dataset %>% mutate(Type) %>%  group_by(Type) %>% summarise(Rating = mean(Rating))
rating_plot <- rating_plot %>% ggplot(aes(x = Type , y = Rating ,fill=Type)) + geom_point(aes(color=Type))
rating_plot
