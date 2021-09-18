# 63130500071
#Step 0
library(dplyr)
library(readr)
library(stringr)
library(assertive)

sat_score <- read_csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv')
View(sat_score)

#Step 1
#1
glimpse(sat_score)


#Step 2 change type
sat_score$math_score <- as.numeric(sat_score$math_score)
sat_score$reading_score <- as.numeric(sat_score$reading_score)
sat_score$writing_score <- as.numeric(sat_score$writing_score)

#Step 3
#2
sat_score %>% filter(duplicated(sat_score))

#Step 4
#cleaning data
sat_score <- sat_score %>% distinct()
sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score == 's',NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score == 's',NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score == 's',NA)
sat_score <- sat_score %>% na.omit()

#Step 5
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
sat_score %>% summary()

#5
sat_score %>% select(total_score) %>% summary()

#6
sat_score %>% arrange(desc(total_score)) %>% head(n = 1L)

write_csv(sat_score,file = "SAT_clean.csv")
