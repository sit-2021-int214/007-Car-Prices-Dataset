# CLEANING DATA

## Define 

1.

Can add more question ....

## Step 1: Remove Duplicate Data

```
Car_Prices <- Car_Prices %>% distinct()
```
- จะทำการลบข้อมูลที่ซ้ำออกไปก่อน 
## Step 2: Change Mileage datatype
```
Car_Prices$Mileage <- Car_Prices$Mileage %>% str_remove("km") %>% str_trim() %>% as.numeric()
```
-  ลบหน่วย 'km' ออกจากข้อมูล
-  ลบช่องว่างก่อนและหลังของข้อมูล
-  เปลี่ยน datatype ให้เป็น numeric เพื่อที่จะนำไปคำนวณได้
## Step 3: Replace '-' to 0 and change Levy datatype from chr to numeric
```
Car_Prices$Levy <- replace(Car_Prices$Levy,Car_Prices$Levy == '-' , 0) %>% as.numeric()
```
- ใน Levy จะมี row ที่ไม่มีข้อมูล จะต้องทำการแทนที่ '-' ด้วย 0
- เปลี่ยน datatype ให้เป็น numeric เพื่อที่จะนำไปคำนวณได้
## Step 4: Change Leather interior datatype from chr to logical (replace 'Yes' to TRUE , 'No' to FALSE)
```
Car_Prices$Leather.interior <- Car_Prices$Leather.interior %>% replace(Car_Prices$Leather.interior == 'Yes',TRUE) %>% 
replace(Car_Prices$Leather.interior == 'No',FALSE) %>% as.logical()
```
- ในข้อมูล Leather interior จะมีเป็น datatype chr ซึ่งจะทำการเปลี่ยนเป็น logical
- แทนที่ข้อมูลที่เป็น 'Yes' เป็น TRUE และ 'No' เป็น FALSE
## Step 5: Remove unused column from dataset
```
Car_Prices <- select(Car_Prices,-c(Doors,Wheel,Engine.volume))
```
- ลบข้อมูลที่ไม่ได้ใช้ออก
- ซึ่งจะมี Doors, Wheel, Engine volume
## Step 6: Scope Mileage between 0 - 200000
```
Car_Prices <- Car_Prices %>% filter(Mileage <= 200000)
```
- กำหนดขอบเขตของข้อมูล Mileage ให้อยู่ในช่วง 0 - 200000
## Step 7: Scope Price between 10000 - MAX PRICE
```
Car_Prices <- Car_Prices %>% filter(Price >= 10000)
```
- กำหนดขอบเขตของข้อมูล Price ให้มากกว่า 10000 ขึ้นไป
