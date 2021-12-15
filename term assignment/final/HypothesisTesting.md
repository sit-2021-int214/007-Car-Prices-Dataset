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
xxxxxxxxxxx


### Step 0 : Assign variables
``` ruby
n <- count()
sd <- sd() 
xbar <- mean()
u0 <- 
```
### Step 1 : State the hypothesis
``` ruby
H0:
Ha:
```

### Step 2 : Select Level of significance
``` ruby
alpha <- 0.05
```

### Step 3 : Select Test statistic
```ruby
z <- ((xbar - u0) / (sd/sqrt(n)));
z <- z$n
```
#### Result
``` ruby
[1] 
```
### Step 4 : Finding P-value approach or Critical Value approach
```ruby
# P-value approach
pvalue <- pnorm(z);

# Critical Value approach
zalpha <- qnorm(alpha);
```
#### Result
``` ruby
> pvalue
[] 
> zalpha
[] 
```

### Step 5 : Compare P-value with alpha or z/t with zalpha/talpha
``` ruby

```

### Step 6 : Conclusion
xxxxxxxxxxxxxxxxxxxxxxxxx
