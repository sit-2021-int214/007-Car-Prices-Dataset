#Install Packages
install.packages("tidyverse")
install.packages("forcats")
#Load Library
library(dplyr)
library(readr)
library(assertive)
library(stringr)
library(ggplot2)
library(tidyr)
library(forcats)

#Part 1: Explore the dataset
# Load data
prog_book <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(prog_book)
glimpse(prog_book)
prog_book %>% filter(duplicated(prog_book))
is.na(prog_book) %>% table()
prog_book$Reviews <- prog_book$Reviews  %>% str_remove(",") %>% str_trim() %>% as.numeric()
View(prog_book)
summary(prog_book)

#Part 2: Learning function from Tidyverse
prog_book %>% mutate(Book_title = fct_lump(Description,n=5))

#Part 3: Transform data with dplyr and finding insight the data

#1
prog_book %>% select(Book_title,Rating,Price) %>% arrange(desc(Rating)) %>% head(5)

#2
prog_book %>% filter(Price > mean(Price)) %>% group_by(Type) %>% count()

#3 
BookZ <- str_subset(prog_book$Book_title, "[Z]") %>% glimpse() 
View(BookZ)

#4
prog_book %>% group_by(Type) %>% summarise(Rating = sum(Rating)) %>% filter(Rating == max(Rating))

#5
prog_book %>%  select(Book_title , Price) %>% filter(prog_book$Reviews > 2000 & prog_book$Rating > 4.5)

#6
prog_book %>% select(Book_title,Reviews,Rating) %>% filter(Reviews > mean(prog_book$Reviews) & prog_book$Rating > mean(prog_book$Rating))

#Part 4: Visualization with GGplot2

#4.1
Price_plot <- prog_book %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Price = mean(Price))
Price_plot <- Price_plot %>% ggplot(aes(x = fct_infreq(Type),y = Price,fill=Type)) + geom_bar(stat="identity") 
Price_plot + ggtitle("Price average of Type Book") + xlab("Type") + ylab("Price average")

#4.2
Reviews_plot <- prog_book %>% filter(Reviews < 1500) %>% ggplot(aes(y=Reviews,x=Rating)) + geom_point(aes(color=Type))
Reviews_plot

