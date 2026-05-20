-- 2. Data Exploration & Cleaning

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

-- how many rows we have in the db? Or how many sales we have?
SELECT COUNT(total_sale)
FROM retail_sales;

-- how many unique customers we have?  155
SELECT COUNT(DISTINCT customer_id)
FROM retail_sales;
-- how many categories we have? 3 
SELECT COUNT(DISTINCT category)
FROM retail_sales;

-- what are the names of the categories? beauty, clothing, electronics
SELECT DISTINCT category
FROM retail_sales;

