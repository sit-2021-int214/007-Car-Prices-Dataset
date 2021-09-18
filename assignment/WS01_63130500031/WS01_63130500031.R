#63130500031

# Step 1: Define a question
## 1.How many observation of this dataset (before cleaning) ?
## 2.Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
## 3.How many distinct school in this dataset ? (Know after drop duplicate data)
## 4.What is min, max, average, quartile of each part in SAT ?
## 5.What is min, max, average, quartile of total score in SAT ?
## 6.Which school is get highest SAT score ?

# Step 2: Loading library and dataset  
## Library
library(stringr)
library(readr)
library(assertive)
library(dplyr)
## Dataset
sat_score <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

# Step 3: Cleaning Data
## Remove duplicate data
sat_score <- sat_score %>% distinct()
## Replace 's' with NA (Handle Missing Values)
sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score == 's',NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score == 's',NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score == 's',NA)
sat_score <- sat_score %>% na.omit()
## Change score datatype
sat_score$math_score <- sat_score$math_score %>% as.numeric()
sat_score$reading_score <- sat_score$reading_score %>% as.numeric()
sat_score$writing_score <- sat_score$writing_score %>% as.numeric()

# Cleaning data
sat_score <- sat_score %>% distinct()
glimpse(sat_score)
sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score  == 's', NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score  == 's', NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score  == 's', NA)
typeof(sat_score$math_score)
sat_score$math_score <- sat_score$math_score %>% as.numeric()
sat_score$reading_score <- sat_score$reading_score %>% as.numeric()
sat_score$writing_score <- sat_score$writing_score %>% as.numeric()
View(sat_score)

#Question 1: How many observation of this dataset (before cleaning) ?
glimpse(sat_score)

#Question 2: Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat_score %>% filter(duplicated(sat_score))

#Question 3: How many distinct school in this dataset ? (Know after drop duplicate data)
sat_score %>% filter(duplicated(sat_score))

#Question 4: What is min, max, average, quartile of each part in SAT ?
summary(sat_score)

#Question 5: What is min, max, average, quartile of total score in SAT ?
sat_score <- sat_score %>% mutate(total_score = math_score + reading_score + writing_score) %>% select(total_score) %>% summary()

#Question 6: Which school is get highest SAT score ?
sat_score %>% arrange(desc(total_score)) %>% head(n = 1L)
