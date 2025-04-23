4-- List all customers with order in last 7 days but were acquired one month ago with first order 
--    on promo 
with a as 
(
select Customer_code, min(Placed_at) as first_order_date , 
max(Placed_at) as  latest_order_date 
from orders
Group by Customer_code
) 
select *from orders as o 
inner join a on a.Customer_code = o.Customer_code and a.first_order_date = o.Placed_at 
and o.Promo_code_Name is not null
where a.latest_order_date < DATEADD(DAY, -7, '2025-03-24')
and a.first_order_date <  DATEADD(MONTH, -1, '2025-03-24') 
and o.Promo_code_Name is not null; 

output 

### Sample Output - Orders with First & Latest Order Dates

| Order_ID     | Customer_Code     | Placed_At               | Restaurant_ID | Cuisine  | Order_Status | Promo_Code_Name | First_Order_Date       | Latest_Order_Date       |
|--------------|-------------------|--------------------------|----------------|----------|---------------|------------------|-------------------------|-------------------------|
| OF1900191806 | ABC1234567890XYZ  | 2025-01-01 08:45:00.000  | AMERICAN2      | American | Delivered     | NEWUSER          | 2025-01-01 08:45:00.000 | 2025-01-05 13:20:00.000 |
| OF1900191833 | ABC9876543210MNO  | 2025-01-27 15:15:00.000  | PIZZA123       | Italian  | Delivered     | FIRSTORDER       | 2025-01-27 15:15:00.000 | 2025-03-15 15:15:00.000 |
