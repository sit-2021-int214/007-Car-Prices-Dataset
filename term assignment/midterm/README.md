# Answer to all defined question
## Define a question
- รถที่วิ่งเยอะมีผลต่อราคามากน้อยเพียงใด
- รถไฮบริดจะมีราคามากกว่ารถยนต์เครื่องธรรมดา
- รถที่เก่าราคาจะถูกลดเสมอไหม
- สีของรถมีผลต่อราคารถหรือไม่
- Levy มีผลต่อราคารถหรือไม่
- รถชนิดไหนมีมากที่สุดในตลาด
## Question 1: รถที่วิ่งเยอะมีผลต่อราคามากน้อยเพียงใด ?
- Low Mileage 
```
lowmileage <- Car_Prices %>% filter(Mileage > 50000)
lowmileage %>% summarise(meanPrice = mean(Price))
```
Result:
```
  meanPrice
1  28407.67
```
- High Mileage 
```
highmileage <- Car_Prices %>% filter(Mileage < 50000)
highmileage %>% summarise(meanPrice = mean(Price))
```
Result:
```
  meanPrice
1  35126.65
```
- Summary <br>
จากข้อมูลจะเห็นได้ว่า 
## Question 2: รถไฮบริดจะมีราคามากกว่ารถยนต์เครื่องธรรมดา ?
- Average price of a hybrid car
```
car_hybrid <- Car_Prices %>% filter(Fuel.type == 'Hybrid')
View(car_hybrid)
mean(car_hybrid$Price)
```
Result:
```
19766.29
```
- Average price of a normal car
```
car_normal <- Car_Prices %>% filter(Fuel.type == 'Petrol' | Fuel.type == 'Diesel')
View(car_normal)
mean(car_normal$Price)
```
Result:
```
32178.07
```
- Summary <br>
จากข้อมูลจะเห็นได้ว่า รถที่มีเครื่องยนต์ธรรมดานั้นมีค่าเฉลี่ยของราคาอยู่ที่ 32178.07 ดอลลาร์ ซึ่งสูงกว่ารถไฮบริดที่มีค่าเฉลี่ยของราคาอยู่ที่ 19766.29 ดอลลาร์ จากDatasetนี้จึงสรุปได้ว่าไฮบริดไม่ได้มีราคามากกว่ารถยนต์เครื่องธรรมดา 
## Question 3: รถที่เก่าราคาจะถูกลดเสมอไหม?
- Old Cars
```
oldcars <- Car_Prices %>% filter(Prod..year < 2000) %>% arrange(Prod..year)
View(oldcars)
oldcars %>% summarise(meanPrice = mean(Price))
```
Result:
```
  meanPrice
1  339164.6
```
- Modern Cars
```
moderncars <- Car_Prices %>% filter(Prod..year > 2000) %>% arrange(Prod..year)
View(moderncars)
moderncars %>% summarise(meanPrice = mean(Price))
```
Result:
```
  meanPrice
1  27144.79
```
- Summary <br>
จากข้อมูลจะเห็นได้ว่า รถที่เก่าจะมีคาเฉลี่ยของราคารถอยู่ที่ 339164.6 ดอลลาร์ ซึ่งราคาสูงกว่ารถใหม่ที่มีค่าเฉลี่ยของราคารถอยู่ที่ 27144.79 ดอลลาร์ ดังนั้นรถที่เก่าราคาจะถูกลดเสมอนั้นไม่เป็นความจริง
## Question 4: สีของรถมีผลต่อราคารถหรือไม่ ?
```
Car_Prices %>% group_by(Color) %>% summarise(meanprice = mean(Price))
```
Result:
```
   Color         meanprice
   <chr>             <dbl>
 1 Beige            22097.
 2 Black            30678.
 3 Blue             66744.
 4 Brown            29860.
 5 Carnelian red    21178.
 6 Golden           19434.
 7 Green            20473.
 8 Grey             28726.
 9 Orange           27268.
10 Pink             20176.
11 Purple           17231.
12 Red              22060.
13 Silver           22298.
14 Sky blue         19463.
15 White            27971.
16 Yellow           26935.
```
- Summary <br>
เมื่อนำราคาของรถแต่ละสีมาเปรียบเทียบกัน จะเห็นได้ว่า รถที่มีสี Blue จะมีค่าเฉลี่ยของราคาอยู่ที่ 66744 ดอลลาร์ ส่วนรถสี Purple จะมีค่าเฉลี่ยราคาที่ต่ำที่สุดอยู่ที่ 17231 ดอลลาร์ ซึ่งจะเห็นได้ว่ารถที่สีแตกต่างกัน ก็จะมีราคาที่ต่างกันไปด้วย ค่าเฉลี่ยของราคาที่สูงที่สุดและต่ำที่สุดแตกต่างกันมาก ทำให้สรุปได้ว่า สีของรถมีผลต่อราคารถ นั้นเป็นเรื่องจริง และสามารถใช้ข้อมูลนี้ประกอบการตัดสินใจในการซื้อรถได้
## Question 5: Levy มีผลต่อราคารถหรือไม่ ?
```

```
Result:

```
```
- Summary <br>
อธิบายค่าาาาาาาาาาาาา
## Question 6: รถชนิดไหนมีมากที่สุดในตลาด ?
```
Car_Prices %>% group_by(Category) %>% count(Category)
```
Result:
```
   Category        n
   <chr>       <int>
 1 Cabriolet      23
 2 Coupe         324
 3 Goods wagon    53
 4 Hatchback    1331
 5 Jeep         3003
 6 Limousine       5
 7 Microbus      140
 8 Minivan       431
 9 Pickup         28
10 Sedan        4124
11 Universal     204
```
- Summary <br>
รถประเภท Sedan ในข้อมูลนี้จะมี 4124 คัน ซึ่งมีมากที่สุดในตลาด

