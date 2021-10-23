library('readr')
library('dplyr')
library('ggplot2')
library('forcats')

book_dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
glimpse(book_dataset)
View(book_dataset)

is.na(book_dataset)
summary(book_dataset)


book_dataset %>% group_by(Type) %>% summarise(mean_num = mean(Number_Of_Pages)) %>% arrange(desc(mean_num))
book_dataset %>% arrange(desc(Rating)) %>% head(5)
book_dataset %>% arrange(desc(Price)) %>% head(5)
book_dataset %>% group_by(Type) %>% count() %>% arrange(desc(n))
book_dataset %>% group_by(Rating) %>% count() %>% arrange(desc(n))
book_dataset %>% select(Book_title,Rating,Price) %>% filter(Rating > mean(Rating))


ggplot(book_dataset,aes(x=Book_title))
ggplot(book_dataset,aes(x=Rating,y=Price)) + geom_point(aes(color=Type)) + geom_smooth()
ggplot(book_dataset,aes(x=Rating,y=Reviews))+ geom_point()
ggplot(book_dataset,aes(y=Type)) + geom_bar() + coord_flip()

book_dataset %>%
mutate(Type = fct_infreq(Type)) %>%
ggplot(aes(x = Type)) + 
geom_bar()