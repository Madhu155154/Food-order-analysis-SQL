--6-- list customers who placed more then 1 order and all their orders on promo only. 

select Customer_code , count(Order_id) as no_orders, 
count(Promo_code_Name) as promo_orders
from orders
group by Customer_code
having  count(Order_id) > 1 and (  count(Order_id) = count(Promo_code_Name)); 

output:


| Customer_Code     | No_Orders | Promo_Orders |
|-------------------|-----------|--------------|
| DEF9876543210XYZ  | 2         | 2            |
| UVW7890123456JKL  | 3         | 3            |

