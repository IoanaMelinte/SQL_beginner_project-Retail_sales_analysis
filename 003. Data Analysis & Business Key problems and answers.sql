-- 3. Data Analysis & Business Key problems and answers

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
