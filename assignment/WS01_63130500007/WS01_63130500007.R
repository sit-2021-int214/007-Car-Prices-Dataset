#63130500007

## MyStep
# Step 1: Loading library and dataset  
# Step 2: Define a question
# Step 3: Cleaning Data

# Step 1: Loading library and dataset  
## Library

library(stringr)
library(assertive)
library(dplyr)
library(readr)

## Dataset
sat_score <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

# Step 2: Define a question
## 1.How many observation of this dataset (before cleaning) ?
## 2.Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
## 3.How many distinct school in this dataset ? (Know after drop duplicate data)
## 4.What is min, max, average, quartile of each part in SAT ?
## 5.What is min, max, average, quartile of total score in SAT ?
## 6.Which school is get highest SAT score ?


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

# question
## 1. How many observation of this dataset (before cleaning) ?
glimpse(sat_score)

## 2. Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat_score %>% filter(duplicated(sat_score))

## 3. How many distinct school in this dataset ? (Know after drop duplicate data)
sat_score %>% distinct() %>% count()

## 4. What is min, max, average, quartile of each part in SAT ?
sat_score %>% select(math_score,reading_score,writing_score) %>% summary()

## 5. What is min, max, average, quartile of total score in SAT ?
sat_score <- sat_score %>% mutate(total_score = math_score+reading_score+writing_score)
sat_score %>% select(total_score) %>% summary()

## 6. Which school is get highest SAT score ?
sat_score %>% arrange(desc(total_score)) %>% head(n = 1)

#Summary
การนำข้อมูล DataSet ไปใช้ให้เกิดประโยชน์สูงสุดได้นั้น เกิดจากการกำหนดหัวข้อในสิ่งที่เราต้องการทราบ และจัดเรียงหมวดหมู่ให้เป็นระเบียบ จึงจะสามารถนำข้อมูลชุดนั้นมาใช้อย่างถูกต้องและเกิดประโยชน์สูงสุดได้ โดยใน DataSet ชุดนี้ เราได้ทำการดึงข้อมูลมาแสดงในตารางเพื่อให้เกิดความเข้าใจที่ง่ายขึ้นต่อรายละเอียดที่แสดง และลดค่าที่อาจเกิดการซ้ำกันขึ้นในการแสดงผล
