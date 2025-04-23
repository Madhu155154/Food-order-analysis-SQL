--2-- Find the daily new customer count from the launch date ( everyday how many new customers are we acquring )

with a as 
(
select  Customer_code , min(cast(Placed_at as date )) as first_order_date
from orders
group by Customer_code
)
select first_order_date , count(Customer_code) as no_of_new_customers 
from a
group by first_order_date
order by first_order_date;

output: 

### Sample Output

| First_Order_Date | No_Of_New_Customers |
|------------------|---------------------|
| 2025-01-01       | 2                   |
| 2025-01-02       | 1                   |
| 2025-01-03       | 1                   |
