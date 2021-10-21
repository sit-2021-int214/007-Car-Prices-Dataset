library('readr')
library('dplyr')
library('ggplot2')

book_dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
glimpse(book_dataset)
View(book_dataset)

is.na(book_dataset)
summary(book_dataset)

