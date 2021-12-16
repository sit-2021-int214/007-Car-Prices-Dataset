library('dplyr')
library('readr')

car_dataset <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/007-Car-Prices-Dataset/master/term%20assignment/midterm/Cleaning%20Data/Car_Prices_Dataset_Clean_Update.csv")
glimpse(car_dataset)

mean(car_dataset$Mileage)

#sampledata
carInTent <- sample_n(car_dataset,350)
glimpse(carInTent)

#average milage of all cars is 100483, if we bought 350 cars to our tent
#and our cars average milage is not higher than all average? (alpha = 0.05)

#Ho : u <= 100483
#Ha : u > 100483

#assign variable
mue0 <- 100483
mean_intent <- mean(carInTent$Mileage) #97098.93
sd_intent <- sqrt(var(carInTent$Mileage)) #52544.04
n <- 350
alpha <- 0.05

#t-test
t_intent <- -1*(mean_intent-mue0)/(sd_intent/sqrt(n)) #1.204897

#p-value
p_value_intent <- pt(t_intent, n-1) #0.8854703

#cri
cri <- qt(alpha, n-1, lower.tail = FALSE) #1.649231

#conclusion
#with p-value
if(p_value_intent<=alpha){
  print("reject H0")
}else{
  print("accept H0")
}


#with critical-value
if(t_intent>=cri){
  print("reject H0")
}else{
  print("accept H0")
}


