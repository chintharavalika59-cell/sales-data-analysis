USE project_customer_segmentation;
DESCRIBE customer;
SELECT * FROM customer LIMIT 5;
SELECT 

#1. How is the shopping distribution according to gender?
SELECT
    gender,
    COUNT(*) AS total_transactions
FROM shopping_trends
GROUP BY gender;SELECT

#2. Which gender did we sell more products to?
SELECT
    gender,
    SUM(quantity) AS total_products
FROM shopping_trends
GROUP BY gender
ORDER BY total_products DESC;

#3. Which gender generated more revenue?
SELECT
    gender,
    SUM(quantity * price) AS total_revenue
FROM shopping_trends
GROUP BY gender
ORDER BY total_revenue DESC;

#4. Distribution of purchase categories relative to other columns
SELECT
    category,
    gender,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM shopping_trends
GROUP BY category, gender
ORDER BY category;

#5. How is the shopping distribution according to age?
SELECT
    age,
    COUNT(*) AS total_transactions
FROM shopping_trends
GROUP BY age
ORDER BY age;

#6. Which age category did we sell more products to?
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_category,
    SUM(quantity) AS total_products
FROM shopping_trends
GROUP BY age_category
ORDER BY total_products DESC;

#7. Which age category generated more revenue?
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_category,
    SUM(quantity * price) AS total_revenue
FROM shopping_trends
GROUP BY age_category
ORDER BY total_revenue DESC;

#8. Distribution of purchase categories relative to age
SELECT
    category,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_category,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM shopping_trends
GROUP BY category, age_category
ORDER BY category;

#9. Does the payment method have a relation with other columns?
SELECT
    payment_method,
    gender,
    COUNT(*) AS total_transactions
FROM shopping_trends
GROUP BY payment_method, gender;

#Compare payment methods with product categories:
SELECT
    payment_method,
    category,
    COUNT(*) AS total_transactions,
    SUM(quantity * price) AS total_revenue
FROM shopping_trends
GROUP BY payment_method, category;

#Compare payment methods with age groups:
SELECT
    payment_method,
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_category,
    COUNT(*) AS total_transactions
FROM shopping_trends
GROUP BY payment_method, age_category;

#10. How is the distribution of payment methods?
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_products,
    SUM(quantity * price) AS total_revenue
FROM shopping_trends
GROUP BY payment_method
ORDER BY total_transactions DESC;


