#63130500007 Kochathong chahahirun 

#Exercise 1
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
mean(x)
sum(x)
median(x)
sd(x)
var(x)

#Exercise 2
#-- 2.1) Create data structure in variable named marvel_movies and explain why you using this data structure ?
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
                   "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
                   "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
                   "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
                   "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
                   "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

marvel_movies <- data.frame(names,years)
marvel_movies #Show about data name & year of marvel movie.

#-- 2.2) Finding the information: 
#------- The numbers of movies
a <- length(names)
a #show length of member of marvel movie.

#------- Finding the 19th movies name
names[c(19)] #Show Index member at 19th.

#------- Which year is most released movies
View(marvel_movies) #Show Content table for looking all name & year.
