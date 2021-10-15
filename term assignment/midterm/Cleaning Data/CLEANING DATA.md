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


