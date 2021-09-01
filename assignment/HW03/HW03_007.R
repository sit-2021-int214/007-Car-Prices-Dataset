library(MASS)
mean(cats$Bwt[cats$Sex == 'F']) 
mean(cats$Bwt[cats$Sex == 'M'])
mean(cats$Hwt[cats$Sex == 'F']) 
mean(cats$Hwt[cats$Sex == 'M'])
# Using dplyr
cats %>% dplyr::filter(Sex == 'F') %>% summarise(Bwt = mean(Bwt)) 
cats %>% dplyr::filter(Sex == 'M') %>% summarise(Bwt = mean(Bwt))
cats %>% dplyr::filter(Sex == 'F') %>% summarise(Hwt = mean(Hwt)) 
cats %>% dplyr::filter(Sex == 'M') %>% summarise(Hwt = mean(Hwt)) 

library(DescTools) 
library(MASS)
max(cats$Bwt[cats$Sex == 'F']) 
max(cats$Bwt[cats$Sex == 'M']) 
Mode(cats$Bwt[cats$Sex == 'F']) 
Mode(cats$Bwt[cats$Sex == 'M']) 
# Using dplyr
cats %>% filter(Sex == 'F') %>% summarise(max = max(Bwt,na.rm=T))
cats %>% filter(Sex == 'M') %>% summarise(max = max(Bwt,na.rm=T))
cats %>% filter(Sex == 'F') %>% summarise(mode = Mode(Bwt,na.rm=T))
cats %>% filter(Sex == 'M') %>% summarise(mode = Mode(Bwt,na.rm=T))

library(MASS)
library(DescTools) 
Mode(factor(survey$W.Hnd),na.rm = TRUE) 
# Using dplyr
survey %>% filter(W.Hnd != 'NA') %>% group_by(W.Hnd) %>% count()

library(MASS)
mean(survey$Height[survey$Sex=='Male'],na.rm = TRUE)   
mean(survey$Height[survey$Sex=='Female'],na.rm = TRUE)  
# Using dplyr
survey %>% filter(Sex != 'NA') %>% group_by(Sex) %>% summarise(avg_height = mean(Height,na.rm=T)) 

library(MASS)
length(factor(survey$Exer[survey$Exer == 'None']))
# Using dplyr
survey %>% filter(Exer == 'None') %>% count()

library(MASS)
summary(factor(survey$Smoke)) 
# Using dplyr
survey %>% group_by(Smoke) %>% count()