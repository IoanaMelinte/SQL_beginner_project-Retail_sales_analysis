# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `p1_retail_db`

This beginner SQL project explores retail sales data using MySQL.  
The analysis focuses on data cleaning, exploratory analysis, and business-driven SQL queries to better understand customer behavior, sales performance, and product trends.

## Objectives

1. Clean and validate retail sales data
2. Perform exploratory data analysis (EDA)
3. Analyze customer and sales behavior
4. Solve business-related analytical questions using SQL


## Project Structure

- `001. Database setup.sql` → database and table creation
- `002. Data cleaning & data exploration.sql` → null checks and data cleaning process
- `003. Data Analysis & Business Key problems and answers` → business questions and analytical queries

### 1. Dataset

**Database Creation**: The project starts by creating a database named `p1_retail_db`.
**Table Creation**: A table named `retail_sales` is created to store the sales data. 

The table structure includes columns for:
- `tranzactions_id` → unique transaction identifier, primary key
- `sale_date` → transaction date
- `sale_time` → transaction time
- `customer_id` → unique customer identifier
- `gender` → customer gender
- `age` → customer age
- `category` → product category
- `quantity` → quantity of products sold
- `price_per_unit` → price per individual product
- `cogs` → cost of goods sold
- `total_sale` → total transaction value


```sql
-- Creating the database
CREATE DATABASE p1_retail_db;

-- Selecting the database
USE p1_retail_db; 

-- Creating the table
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

```

### 2. Data Exploration & Cleaning

The cleaning process includes:
- checking for null or missing values
- removing incomplete records
- validating category and customer-related fields

```sql
-- DATA CLEANING
-- displaying the data from the table
SELECT *
FROM retail_sales;

-- checking null values for each column in order to delete the missing data
SELECT *
FROM retail_sales
WHERE tranzactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
   
-- deleting the null values

DELETE FROM retail_sales
WHERE tranzactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- DATA EXPLORATIONS

--  how many sales are in the database?
SELECT COUNT(total_sale)
FROM retail_sales;

-- how many unique customers are in the database?
SELECT COUNT(DISTINCT customer_id)
FROM retail_sales;

-- how many categories are in the database?  
SELECT COUNT(DISTINCT category)
FROM retail_sales;

-- what are the names of the categories?
SELECT DISTINCT category
FROM retail_sales;

```
### 3. Data Analysis & Business Key problems and answers

```sql
SELECT *
FROM retail_sales;

-- 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05 in order to analyze daily sales performance and identify unusual business activity.
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- 2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 2 in the month of Nov-2022 in order to identify bulk purchases and high-demand products.
SELECT *
FROM retail_sales
WHERE category = 'Clothing' AND quantity > 2 AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- 3. Write a SQL query to calculate the total sales (total_sale) for each category in order to determine which product categories generate the highest revenue.
SELECT  category, SUM(total_sale)
FROM retail_sales
GROUP BY category;

-- 4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category in order to better understand the target customer demographic.
SELECT category, ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category ='Beauty';

-- 5. Write a SQL query to find all transactions where the total_sale is greater than 1000 in order to identify high-value transactions and premium customers.
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- 6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category in each category in order to analyze purchasing behavior across customer segments.
SELECT category, gender, COUNT(tranzactions_id) AS no_of_transactions
FROM retail_sales
GROUP BY 1,2
ORDER BY gender DESC;

-- 7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year in order to detect seasonal sales trends and support forecasting.

SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, ROUND(AVG(total_sale),2) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY year, avg_sale DESC;

-- 8. Write a SQL query to find the top 5 customers based on the highest total sales in order to identify the most valuable customers and support retention strategies.
SELECT customer_id, SUM(total_sale) AS highest_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY highest_sales DESC
LIMIT 5;

-- 9. Write a SQL query to find the number of unique customers who purchased items from each category in order to measure category popularity and customer reach.
SELECT category, COUNT( DISTINCT customer_id)
FROM retail_sales
GROUP BY category;

-- 10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17) in order to identify peak business hours and optimize operational planning.
SELECT CASE
	WHEN sale_time < '12:00:00' THEN 'Morning'
	WHEN sale_time BETWEEN '12:00:01' AND '17:00:00'  THEN 'Afternoon'
	ELSE 'Evening'
END AS shift,
COUNT(*) AS orders_per_shift
FROM retail_sales
GROUP BY shift;
```


## Key Findings

- Clothing and Electronics generated strong sales activity across the dataset.
- Several high-value transactions exceeded 1000 in total sales.
- Monthly sales analysis revealed noticeable variations in purchasing behavior.
- Customer purchasing behavior varied across product categories and genders.
- Order distribution by shift highlighted peak operational hours.


## Conclusion

This project demonstrates foundational SQL skills applied to real-world business analysis scenarios.  
The analysis combines data cleaning, aggregation, filtering, and customer-focused insights to support data-driven decision making.

## Credits / Acknowledgments

This project was inspired by the "SQL Data Analysis Portfolio Project #01/10 | Beginner to Advanced Guide for Aspiring Data Analysts" YouTube tutorial by Najir H./Zero Analyst Youtube channel, and was further expanded with additional business analysis, insights, and personal modifications for learning purposes.

## Skills used
- SQL
- MySQL
- Visual Studio Code
- Data Cleaning
- Data Exploration
- Aggregations
- GROUP BY
- CASE Statements
- Filtering and Sorting
- Business Data Analysis
- Customer and Sales Analysis

