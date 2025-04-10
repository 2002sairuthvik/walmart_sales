
-- Walmart Project Queries - MySQL
use walmart_db;

SELECT * FROM walmart_sales;

-- DROP TABLE walmart_sales;

-- Count total records
SELECT COUNT(*) as total_records FROM walmart_sales;

-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_of_payments
FROM walmart_sales
GROUP BY payment_method;

-- Count distinct branches
SELECT COUNT(DISTINCT branch) as distinct_branches
FROM walmart_sales;

-- Find the minimum quantity sold
SELECT MIN(quantity) as minimum_amount_of_qty_sold
FROM walmart_sales;

-- Business Problem Q1: Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(quantity) AS no_qty_sold
FROM walmart_sales
GROUP BY payment_method;

-- Project Question #2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
SELECT branch, category, avg_rating
FROM (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS ranking
    FROM walmart_sales
    GROUP BY branch, category
) AS ranked
WHERE ranking = 1;

-- Q3: Identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(date) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranking
    FROM walmart_sales
    GROUP BY branch, day_name
) AS rb1
WHERE ranking = 1;

-- Q4: Calculate the total quantity of items sold per payment method
SELECT 
    payment_method,
    SUM(quantity) AS no_qty_sold
FROM walmart_sales
GROUP BY payment_method;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city
SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM walmart_sales
GROUP BY city, category;

-- Q6: Calculate the total profit for each category
SELECT 
    category,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart_sales
GROUP BY category
ORDER BY total_profit DESC;

-- Q7: Determine the most common payment method for each branch
WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranking
    FROM walmart_sales
    GROUP BY branch, payment_method
)
SELECT branch, payment_method AS preferred_payment_method , total_trans
FROM cte
WHERE ranking = 1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT
    branch,
  CASE
    WHEN TIME(time) BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
    WHEN TIME(time) BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
    else  'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walmart_sales
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH rev_22 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart_sales
    WHERE YEAR(date) = 2022
    GROUP BY branch
),
rev_23 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart_sales
    WHERE YEAR(date) = 2023
    GROUP BY branch
)
SELECT 
    rev_22.branch,
    rev_22.revenue AS revenue_2022,
    rev_23.revenue AS revenue_2023,
    round(((rev_23.revenue - rev_22.revenue) / rev_22.revenue) * 100,2) AS revenue_decrease_ratio
FROM rev_22
JOIN rev_23 ON rev_22.branch = rev_23.branch
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;
