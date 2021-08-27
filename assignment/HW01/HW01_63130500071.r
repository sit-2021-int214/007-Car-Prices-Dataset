#Exercise 1
proB1 <- c(10.4, 5.6, 3.1, 6.4, 21.7)
average <- mean(proB1)
average #9.44
sum(proB1) #47.2
median(proB1) #6.4
sd(proB1) #7.33846
var(proB1) #53.853

#Exercise 2
# 2.1
# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

# Or using Function
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

marvel_movies <- data.frame(names,years)
marvel_movies 
#เพราะว่าเรามีข้อมูลที่มันตรงกันแล้วมันก็สามารถแสดงเป็นตารางได้


#2.2
#The numbers of movies

length(names) #27

#Finding the 19th movies name

names[19] #"Avengers: Infinity War"

#Which year is most released movies

wfreq <- as.data.frame((table(marvel_movies$years)))
wfreq$Var1[wfreq$Freq == max(wfreq$Freq)] #2017 2021

