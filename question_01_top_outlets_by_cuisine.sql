--1-- Find	top 2 outlets by cuisine type without using limit and top function. 

with a as 
(
select Cuisine, Restaurant_id , count(*) order_count
from orders
group by Cuisine, Restaurant_id
) 
select *from (
select *, ROW_NUMBER() over(partition by Cuisine order by order_count) as rn 
from a ) b
where rn <=2;

output: 


| Cuisine   | Restaurant_ID | Order_Count | RN |
|-----------|----------------|--------------|----|
| American  | AMERICAN2      | 6            | 1  |
| American  | BURGER99       | 8            | 2  |
| Italian   | ITALIAN2       | 6            | 1  |
| Italian   | PIZZA123       | 10           | 2  |
| Japanese  | JAPANESE2      | 5            | 1  |
| Japanese  | SUSHI456       | 6            | 2  |
| Lebanese  | LEBANESE2      | 9            | 1  |
| Lebanese  | KMKMH6787      | 10           | 2  |
| Mexican   | MEXICAN2       | 6            | 1  |
| Mexican   | TACO789        | 7            | 2  |
