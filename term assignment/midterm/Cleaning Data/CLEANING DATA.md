# CLEANING DATA

## Define a question

1. How many observation of this dataset (before cleaning) ?
2. Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
3. How many distinct school in this dataset ? (Know after drop duplicate data)
4. What is min, max, average, quartile of each part in SAT ?
5. What is min, max, average, quartile of total score in SAT ?
6. Which school is get highest SAT score ?

Can add more question ....

## Step 0: Loading library and dataset

```
# Library
library(dplyr)
library(readr)
library(stringr)
library(assertive)

# Dataset
sat_score <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")
```
