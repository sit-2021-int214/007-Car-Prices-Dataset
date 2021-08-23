#Exercise 1
a <- c(10.4,5.6,3.1,6.4,21.7) # ประกาศตัวแปร a เป็น Vector ที่มีค่า (10.4, 5.6, 3.1, 6.4, 21.7)
mean(a) # ค่า average ของ a = 9.44
sum(a) # ค่า sum ของ a = 47.2
median(a) # ค่า median ของ a = 6.4
sd(a) # ค่า sd ของ a = 7.33846
var(a) # ค่า variance ของ a = 53.853


#Exercise 2
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
                   "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
                   "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
                   "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
                   "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
                   "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

marvel_movies <- data.frame(names,years) # ใช้ data.frame เพื่อที่จะได้แสดงออกมาเป็นในรูปแบบตาราง ซ้าย(ชื่อหนัง) ขวา(ปีที่ปล่อยฉาย)

length(names) # The number of movies (ใช้ length เพื่อแสดงจำนวนสมาชิกใน names (จำนวนหนัง)) = 27

names[19] # Finding the 19th movies name (เข้าถึงสมาชิกของ names ตัวที่ 19 โดยเข้าถึงจาก index เลย) = "Avengers: Infinity War"

years_frequency <- as.data.frame(table(marvel_movies$years)) # ประกาศตัวแปร years_frequency

years_frequency$Var1[years_frequency$Freq == max(years_frequency$Freq)] # Which year is most released movies = 2017 2021