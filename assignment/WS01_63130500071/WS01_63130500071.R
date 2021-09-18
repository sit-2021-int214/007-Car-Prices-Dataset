# 63130500071
library(dplyr)
library(readr)
library(stringr)
library(assertive)

sat_score <- read_csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv')
View(sat_score)

#1
glimpse(sat_score)

assert_is_a_number(sat_score$math_score)
is.numeric(sat_score$math_score)

#change type
sat_score$math_score <- as.numeric(sat_score$math_score)
sat_score$reading_score <- as.numeric(sat_score$reading_score)
sat_score$writing_score <- as.numeric(sat_score$writing_score)

#2
sat_score$DBN %>% duplicated() %>% sum()
sat_score$DBN %>% duplicated() %>% View()

#cleaning data
sat_score <- sat_score %>% distinct()
sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score == 's',NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score == 's',NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score == 's',NA)
sat_score <- sat_score %>% na.omit()

#handling out of range
sat_score %>% filter(math_score < 200 | reading_score < 200 | writing_score < 200)
sat_score %>% filter(math_score > 800 | reading_score > 800 | writing_score > 800)

sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score < 200,NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score < 200,NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score < 200,NA)

sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score > 800,NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score > 800,NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score > 800,NA)

#3
sat_score %>% distinct() %>% count() 

#Calculate total score
sat_score <- sat_score %>% mutate(total_score = math_score+reading_score+writing_score) 

#4
sat_score %>% select(math_score,reading_score,writing_score) %>% summary()

#5
sat_score %>% select(total_score) %>% summary()

#6
sat_score %>% arrange(desc(total_score)) %>% head(n = 1L)
