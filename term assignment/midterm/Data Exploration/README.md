# Data Exploration

## Step 0: Loading Library and dataset

```
library(stringr)
library(readr)
library(assertive)
library(dplyr)

Car_Prices <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/007-Car-Prices-Dataset/master/term%20assignment/midterm/Data%20Exploration/Car_Prices_Dataset_Original.csv")
```
- ดาวน์โหลด Library ที่จำเป็นจะต้องใช้
- Original Dataset : [Car_Prices_Dataset_Original](./Car_Prices_Dataset_Original.csv)
## Step 1: Observe Data

```
glimpse(Car_Prices)
```

Result:
```
Rows: 19,237
Columns: 18
$ ID               <int> 45654403, 44731507, 45774419, 45769185, 45809263, 45802912, 45656768, 45816158, 45641395, 45756839, 45621750, 45814819, 45815568, 45~
$ Price            <int> 13328, 16621, 8467, 3607, 11726, 39493, 1803, 549, 1098, 26657, 941, 8781, 3000, 1019, 59464, 549, 7683, 28382, 549, 941, 18826, 206~
$ Levy             <chr> "1399", "1018", "-", "862", "446", "891", "761", "751", "394", "-", "1053", "-", "-", "1055", "891", "1079", "810", "810", "2386", "~
$ Manufacturer     <chr> "LEXUS", "CHEVROLET", "HONDA", "FORD", "HONDA", "HYUNDAI", "TOYOTA", "HYUNDAI", "TOYOTA", "LEXUS", "MERCEDES-BENZ", "FORD", "OPEL", ~
$ Model            <chr> "RX 450", "Equinox", "FIT", "Escape", "FIT", "Santa FE", "Prius", "Sonata", "Camry", "RX 350", "E 350", "Transit", "Vectra", "RX 450~
$ Prod..year       <int> 2010, 2011, 2006, 2011, 2014, 2016, 2010, 2013, 2014, 2007, 2014, 1999, 1997, 2013, 2016, 2018, 2016, 2016, 2006, 2008, 2012, 2012, ~
$ Category         <chr> "Jeep", "Jeep", "Hatchback", "Jeep", "Hatchback", "Jeep", "Hatchback", "Sedan", "Sedan", "Jeep", "Sedan", "Microbus", "Goods wagon",~
$ Leather.interior <chr> "Yes", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "No", "No", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Ye~
$ Fuel.type        <chr> "Hybrid", "Petrol", "Petrol", "Hybrid", "Petrol", "Diesel", "Hybrid", "Petrol", "Hybrid", "Petrol", "Diesel", "CNG", "CNG", "Hybrid"~
$ Engine.volume    <chr> "3.5", "3", "1.3", "2.5", "1.3", "2", "1.8", "2.4", "2.5", "3.5", "3.5", "4", "1.6", "3.5", "2", "2", "1.8", "1.8", "3.3", "3.5", "1~
$ Mileage          <chr> "186005 km", "192000 km", "200000 km", "168966 km", "91901 km", "160931 km", "258909 km", "216118 km", "398069 km", "128500 km", "18~
$ Cylinders        <dbl> 6, 6, 4, 4, 4, 4, 4, 4, 4, 6, 6, 8, 4, 6, 4, 4, 4, 4, 6, 6, 4, 4, 4, 4, 4, 4, 8, 4, 4, 6, 6, 6, 8, 6, 6, 4, 4, 4, 4, 6, 4, 4, 4, 4, ~
$ Gear.box.type    <chr> "Automatic", "Tiptronic", "Variator", "Automatic", "Automatic", "Automatic", "Automatic", "Automatic", "Automatic", "Automatic", "Au~
$ Drive.wheels     <chr> "4x4", "4x4", "Front", "4x4", "Front", "Front", "Front", "Front", "Front", "4x4", "Rear", "Rear", "Front", "Front", "Front", "Front"~
$ Doors            <chr> "04-May", "04-May", "04-May", "04-May", "04-May", "04-May", "04-May", "04-May", "04-May", "04-May", "04-May", "02-Mar", "04-May", "0~
$ Wheel            <chr> "Left wheel", "Left wheel", "Right-hand drive", "Left wheel", "Left wheel", "Left wheel", "Left wheel", "Left wheel", "Left wheel", ~
$ Color            <chr> "Silver", "Black", "Black", "White", "Silver", "White", "White", "Grey", "Black", "Silver", "White", "Blue", "White", "White", "Whit~
$ Airbags          <int> 12, 8, 2, 0, 4, 4, 12, 12, 12, 12, 12, 0, 4, 12, 4, 12, 12, 4, 12, 12, 4, 12, 12, 0, 4, 8, 0, 8, 4, 12, 4, 12, 6, 12, 10, 4, 12, 4, ~
```
- มี 19,237 Observations และมี 18 Variables

## Step 2: Dataset Summary

```
summary(Car_Prices)
```

Result:
```
       ID               Price              Levy           Manufacturer          Model             Prod..year     Category         Leather.interior  
 Min.   :20746880   Min.   :       1   Length:19237       Length:19237       Length:19237       Min.   :1939   Length:19237       Length:19237      
 1st Qu.:45698374   1st Qu.:    5331   Class :character   Class :character   Class :character   1st Qu.:2009   Class :character   Class :character  
 Median :45772308   Median :   13172   Mode  :character   Mode  :character   Mode  :character   Median :2012   Mode  :character   Mode  :character  
 Mean   :45576536   Mean   :   18556                                                            Mean   :2011                                        
 3rd Qu.:45802036   3rd Qu.:   22075                                                            3rd Qu.:2015                                        
 Max.   :45816654   Max.   :26307500                                                            Max.   :2020                                        
  Fuel.type         Engine.volume        Mileage            Cylinders      Gear.box.type      Drive.wheels          Doors              Wheel          
 Length:19237       Length:19237       Length:19237       Min.   : 1.000   Length:19237       Length:19237       Length:19237       Length:19237      
 Class :character   Class :character   Class :character   1st Qu.: 4.000   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Median : 4.000   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                          Mean   : 4.583                                                                              
                                                          3rd Qu.: 4.000                                                                              
                                                          Max.   :16.000                                                                              
    Color              Airbags      
 Length:19237       Min.   : 0.000  
 Class :character   1st Qu.: 4.000  
 Mode  :character   Median : 6.000  
                    Mean   : 6.583  
                    3rd Qu.:12.000  
                    Max.   :16.000  
```
### คำอธิบายของแต่ละ Variables ใน Dataset นี้

```
ID = เลข ID ของรถ (int)
Price = ค่าประกัน ดูแลบำรุงรถยนต์ (int)
Levy = ค่าภาษี (chr)
Manufacturer = ผู้ผลิต (chr)
Model = รุ่น (chr)
Prod. year = ปีที่เปิดตัว
Category = ประเภทของรถ (chr) 
Leather interior = ตกแต่งภายในรถด้วยชนิดเบาะหนัง (chr)
Fuel type = ประเภทของน้ำมัน (chr)
Engine volume = อัตราส่วนกำลังอัดเครื่องยนต์ (chr)
Mileage = ระยะทางที่รถวิ่งไปได้ (chr)
Cylinders = กระกอบสูบ (dbl)
Gear box type = ประเภทของฟันเฟือง (chr)
Drive wheels = ล้อรถที่ได้รับกำลังจากเครื่องทำการขับเคลื่อน (chr)
Doors = จำนวนประตูที่รถมี (chr)
Wheel = ตำแหน่งของพวงมาลัย (chr)
Color = สีของรถ (chr)
Airbags = จำนวนของถุงลมนิรภัย (int)
```

## Step 3: Analyze Data

### ทำการ ตรวจสอบ / วิเคราะห์ Variables ที่จะนำไปใช้ว่ามีปัญหาไหม ต้องแก้ไขอย่างไร
-  Levy ค่าภาษีมันเป็น chr จะต้องนำไปแปลงให้เป็น numeric ก่อน เพื่อที่จะสามารถนำไปใช้ในการคิดคำนวณได้ และจะต้อง handle ค่าที่เป็น "-" ด้วย
-  Leather interior เป็น chr จะต้องนำไปแปลงให้เป็น logical ก่อน เพื่อที่จะสามารถนำไปใช้เปรียบเทียบได้
-  Mileage เป็น chr และมี "km" ติดมาตรงด้านหลัง จะต้องลบ "km" ออกก่อนแล้วแปลงเป็น numeric เพื่อที่จะสามารถนำไปใช้ในการคิดคำนวณได้

### ตัด Variables ที่ไม่จำเป็นต้องใช้ออก
- Doors (ไม่ได้ใช้)
- Wheel (ไม่ได้ใช้)
- Engine volume (ไม่ได้ใช้)
