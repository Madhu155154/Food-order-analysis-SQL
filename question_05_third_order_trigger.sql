-- 5-- Growth team is planning to create a trigger that will target customers after every 
--     thrid order with personalized communication and they have asked you to create a query 
---    for this. 

with a as (

select *, ROW_NUMBER () over( partition by Customer_code order by Placed_at asc ) as rn
from orders
) 
select * from a 
where rn % 3= 0   and cast(a.Placed_at as date ) = '2025-03-25';

output: 

### Sample Output

| Order_ID     | Customer_Code     | Placed_At               | Restaurant_ID | Cuisine | Order_Status | Promo_Code_Name | RN |
|--------------|-------------------|--------------------------|----------------|---------|---------------|------------------|----|
| OF1900191873 | UVW7890123456JKL  | 2025-03-25 19:15:00.000  | PIZZA123       | Italian | Delivered     | TASTY50          | 3  |

