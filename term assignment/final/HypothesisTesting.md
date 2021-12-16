# Hypothesis Testing

### Step to do:

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion
## Define question
average milage of all cars is 100483, if we random bought 350 cars to our tent
and our cars average milage is not higher than all average? (alpha = 0.05)


### Step 0 : Assign variables
``` ruby
car_dataset <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/007-Car-Prices-Dataset/master/term%20assignment/midterm/Cleaning%20Data/Car_Prices_Dataset_Clean_Update.csv")

#sampledata
carInTent <- sample_n(car_dataset,350)
glimpse(carInTent)

mue0 <- 100483
mean_intent <- mean(carInTent$Mileage) #97098.93
sd_intent <- sqrt(var(carInTent$Mileage)) #52544.04
n <- 350
```
### Step 1 : State the hypothesis
``` ruby
Ho : u <= 100483
Ha : u > 10048
```

### Step 2 : Select Level of significance
``` ruby
alpha <- 0.05
```

### Step 3 : Select Test statistic
```ruby
t_intent <- -1*(mean_intent-mue0)/(sd_intent/sqrt(n))
```
#### Result
``` ruby
1.204897
```
### Step 4 : Finding P-value approach or Critical Value approach
```ruby
# P-value approach
p_value_intent <- pt(t_intent, n-1)

# Critical Value approach
cri <- qt(alpha, n-1, lower.tail = FALSE)
```
#### Result
``` ruby
> pvalue
0.8854703
> zalpha
1.649231
```

### Step 5 : Compare P-value with alpha or z/t with zalpha/talpha
``` ruby
#with p-value
if(p_value_intent<=0.05){
  print("reject H0")
}else{
  print("accept H0")
}

#accept H0

#with critical-value
if(t_intent>=cri){
  print("reject H0")
}else{
  print("accept H0")
}

#accept H0
```

### Step 6 : Conclusion
cars in our tent is less milage than other in market.
