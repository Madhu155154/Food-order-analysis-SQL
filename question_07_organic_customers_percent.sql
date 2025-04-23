--7-- what percentage of customers were organically aquired in jan 2025 ( placed their first order without 
--      promo code )

with a as (
select *, 
ROW_NUMBER () over( partition by Customer_code order by Placed_at asc ) as rn
from orders
where month(Placed_at) = 1
) 
select count(
case 
when rn =1 and Promo_code_Name is null then Customer_code end ) *100.0 / count( distinct Customer_code ) as per
from a

Output: 
per
43.902439024390
