#Exercise 1
m <- c(10.4, 5.6, 3.1, 6.4, 21.7)
average <- mean(m)
average #9.44
sum <-sum(m)
sum #47.2
median<-median(m)
median #6.4
sd <- sd(m)
sd # 7.33846
variance <- var(m)
variance #53.853

#Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)
Marvel_movies <- data.frame(names,years)
View(Marvel_movies)#ถ้าใช้data.frame จะได้ข้อมูลเปป็นตารางคั้บ

length(names) #The numbers of movies 27
names[19] #Finding the 19th movies name "Avengers: Infinity War"

#Which year is most released movies = 2017 ,2021 
years_freq <- as.data.frame(table(Marvel_movies$years))
years_freq$Var1[years_freq$Freq == max(years_freq$Freq)]






