# Answer to all defined question
## Define a question
1. รถที่วิ่งเยอะมีผลต่อราคามากน้อยเพียงใด ?
2. รถไฮบริดจะมีราคามากกว่ารถยนต์เครื่องธรรมดา ?
3. รถที่เก่าราคาจะถูกลดเสมอไหม?
4. สีของรถที่ได้รับความนิยมในท้องตลาดเป็นอย่างไร ?
5. ประเภทของรถ มีผลต่อ Levy หรือไม่ ?
6. รถชนิดไหนมีมากที่สุดในตลาด ?
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
จากข้อมูลจะเห็นได้ว่า ค่าเฉลี่ยของรถที่มี Mileage มาก ราคาอยู่ที่ 35126.65 ดอลลาร์ ซึ่งก็ยังจะสูงกว่าส่วนรถที่มี  Mileage น้อย ค่าเฉลี่ยของราคาก็จะไล่เลี่ยตามมาอยู่ที่ 28407.67 ดอลลาร์
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
## Question 4: สีของรถที่ได้รับความนิยมในท้องตลาดเป็นอย่างไร ?
- Top 3 popular
```
Car_Prices %>% group_by(Color) %>% count(Color) %>% arrange(desc(n)) %>% head(3)
```
Result:
``` 
Color      n
  <chr>  <int>
1 Black   2454
2 White   2391
3 Silver  1862
```
- Top 3 unpopular
```
Car_Prices %>% group_by(Color) %>% count(Color) %>% arrange(desc(n)) %>% tail(3)
```
Result:
```  
  Color      n
  <chr>  <int>
1 Orange    46
2 Pink       9
3 Purple     9
```
- Summary <br>
จากข้อมูลจะเห็นได้ว่า จะมี 3 อันดับของสีรถที่ได้รับความนิยมสูงสุด และ 3 อันดับที่มีความนิยมน้อยที่สุด สีได้รับความนิยมมากที่สุดนั้นคือสี Black ที่มีถึง 2454 คัน ซึ่งต่างสีที่ได้รับความนิยมน้อยที่สุดคือสี Purple ที่มีเพียงแค่ 9 คัน ข้อมูลนี้จึงชี้ให้เห็นถึงสีของรถที่ควรจะผลิตมาเนื่องจากได้รับความนิยมมาก และสีที่ควรหลีกเลี่ยงในการผลิต เพราะได้รับความนิยมน้อยจากกลุ่มลูกค้า

## Question 5: ประเภทของรถ มีผลต่อ Levy หรือไม่ ?
```
Car_Prices %>% group_by(Category) %>% summarise(meanLevy = mean(Levy)) %>% arrange((meanLevy))
```
Result:
```
   Category    meanLevy
   <chr>          <dbl>
 1 Limousine         0 
 2 Goods wagon     409.
 3 Hatchback       418.
 4 Microbus        448.
 5 Pickup          506.
 6 Coupe           600.
 7 Sedan           605.
 8 Cabriolet       628.
 9 Jeep            723.
10 Minivan         793.
11 Universal       832.
```
- Summary <br>
จากข้อมูลที่ได้ จะเห็น รถประเภท Limousine นั้นมีค่าเฉลี่ยของภาษีอยู่ที่ 0 ดอลลาร์ ในขณะที่ Universal นั้นมีค่าเฉลี่ยของภาษีสูงถึง 832 ดอลลาร์ นั้นอาจจะหมายถึงชนิดของรถแต่ละประเภทนั้นมีภาษีที่แตกต่างกัน ซึ่งอาจจะมีผลต่อราคาของรถด้วย 
## Question 6: รถชนิดไหนมีมากที่สุดในตลาด ?
```
Car_Prices   %>% group_by(Category)  %>% count(Category) %>% arrange(desc(n)) %>% head(1)
```
Result:
```
  Category     n
  <chr>    <int>
1 Sedan     4124
```
- Summary <br>
รถประเภท Sedan ในข้อมูลนี้จะมี 4124 คัน ซึ่งมีมากที่สุดในตลาด

*** เนื่องจากข้อมูลนี้เป็นเพียง Dataset กลุ่มตัวอย่างอาจทำให้มีข้อผิดพลาดหรือทำให้บิดเบือนไปจากความจริงได้ทางผู้จัดทำจึงขออภัยมา ณ ที่นี้

