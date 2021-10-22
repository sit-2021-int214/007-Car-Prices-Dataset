top <- read.csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv')

library(dplyr)
library(ggplot2)

glimpse(top)

#1 Best rating book
top %>% filter(Rating == max(Rating)) %>% select(!Description)

#2 number page effect price ?
top %>% filter(Number_Of_Pages>=50,Number_Of_Pages<=978) %>% group_by(Type) %>% summarise(mean_num = mean(Number_Of_Pages))

#3 most of type book
top$Type %>% table()

#graph
top %>% ggplot(aes(x=Type)) + geom_bar() + ggtitle("Number of type book")

#4 mean price each type
top %>% filter(Price <= 119) %>% group_by(Type) %>% select(Price) %>% summarise(price_mean = mean(Price))

#grah
top %>% ggplot(aes(x=Number_Of_Pages)) + geom_boxplot()

#5 books have rating more than mean rating
top %>% filter(Rating >= 3.45 ,Rating <= 4.72,Rating > mean(Rating) , Type == 'ebook') %>% select(!Description)

#6 max price
top %>% filter(Price == max(Price)) %>% select(!Description)

write.csv(top,file = "Top_progaming_book.csv")


