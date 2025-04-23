# 🍽️ Food Delivery Orders Analysis (SQL Project)

This SQL project analyzes a fictional food delivery platform's order data to understand customer acquisition, promotional campaign impact, and behavior across cuisines and time periods.

---

### 📌 Problem Statement

The growth and marketing teams of a food delivery platform want to extract insights from order data to:
- Track new customer acquisition trends
- Identify outlets performing well within each cuisine
- Analyze the behavior of customers acquired via promotions
- Monitor organic vs promo-driven growth
- Detect customer ordering patterns (e.g., repeated orders, loyalty)

By analyzing detailed order data, the goal is to support business strategies across acquisition, engagement, and retention.

---

### 🎯 Project Goals

- Identify the top outlets per cuisine without using `TOP` or `LIMIT`
- Track daily new customer acquisition over time
- Detect customers acquired in Jan 2025 who only ordered once
- List customers whose **first order used a promo** and **recent order happened long ago**
- Create logic to **trigger personalized communication** after every third order
- Find customers who only place orders **with promo codes**
- Calculate % of customers organically acquired (first order without promo) in Jan 2025

---

### 🧾 Dataset Description

The dataset consists of **orders placed** on a food delivery platform during **January to March 2025**. Each row represents one food order and includes information about the customer, cuisine, restaurant, and promotional use.

| Column Name        | Description                                                 |
|--------------------|-------------------------------------------------------------|
| `Order_id`         | Unique order identifier                                     |
| `Customer_code`    | Unique identifier for each customer                         |
| `Placed_at`        | Date and time when the order was placed                     |
| `Restaurant_id`    | Outlet from which food was ordered                          |
| `Cuisine`          | Type of cuisine offered by the restaurant                   |
| `Order_status`     | Status of the order (Delivered, Cancelled, etc.)            |
| `Promo_code_Name`  | Name of the promo code used (NULL if no promo applied)      |

#### Sample Row:
| Order_id     | Customer_code   | Placed_at           | Restaurant_id | Cuisine   | Order_status | Promo_code_Name |
|--------------|------------------|---------------------|----------------|-----------|--------------|-----------------|
| OF1900191801 | UFDDN1991918XUY1 | 2025-01-01 15:30:20 | KMKMH6787      | Lebanese  | Delivered    | Tasty50         |

---

### 📥 Data Import Process

Data was inserted directly via SQL `INSERT` statements into a SQL Server database.  
To replicate the setup:

1. Use `create_orders_table.sql` to create the `orders` table
2. Use `insert_orders_data.sql` to populate it with over **60+ rows**
3. Run the analysis queries as individual `.sql` scripts

---

### 📌 Key Insights

- Identified **top-performing outlets per cuisine** using `ROW_NUMBER()` logic
- Found **daily new customers** by tracking first order dates
- Detected customers acquired in Jan 2025 who made only **one order and churned**
- Flagged customers whose **last order was more than 7 days ago** and whose **first order used a promo**
- Designed logic to **target users after their third order** using modular query with `ROW_NUMBER()`
- Isolated users who have made **only promo-based orders**
- Found that a meaningful percentage of users in Jan 2025 were **organically acquired** (without promo)

---

### 📁 Folder Structure

| File Name                                | Description                                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------|
| `create_orders_table.sql`               | Script to create the `orders` table structure                              |
| `insert_orders_data.sql`                | Script to insert all 60+ order records                                      |
| `question_01_top_outlets_by_cuisine.sql`| Find top 3 outlets per cuisine using `ROW_NUMBER()`                         |
| `question_02_daily_new_customers.sql`   | Count new customer acquisition daily based on first order date              |
| `question_03_one_time_jan_customers.sql`| Customers acquired in Jan 2025 who ordered only once                        |
| `question_04_promo_acquired_dormant.sql`| Customers with first promo order and no recent activity                     |
| `question_05_third_order_trigger.sql`   | Identify customers hitting 3rd order milestone for engagement trigger       |
| `question_06_promo_only_customers.sql`  | Customers who placed multiple orders, all using promo codes                 |
| `question_07_organic_customers_percent.sql` | Calculate % of customers acquired without promo in Jan 2025             |
| `README.md`                             | Documentation of the entire project                                         |

---

### ✅ How to Use

1. Clone or download this repository
2. Open scripts in SQL Server Management Studio (SSMS) or Azure Data Studio
3. Run the `create_orders_table.sql` and `insert_orders_data.sql` files
4. Execute individual question files to view business insights

---

### 👨‍💻 Author

**Madhu K**  
Business Analyst | SQL Developer | Power BI Enthusiast  
📬 [LinkedIn](#)  
🌐 [Portfolio Website](#) *(optional)*

---

### ⭐ Support

If you find this project useful:
- ⭐ Star the repository
- 🛠️ Fork and try extending the logic
- 💬 Reach out for collaborations or feedback!
