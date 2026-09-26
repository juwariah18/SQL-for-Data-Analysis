-- ASSIGNMENT: Query a sample database to find top customers, average order values

CREATE DATABASE IF NOT EXISTS week2_analysis;
USE week2_analysis;
SHOW TABLES;
DESCRIBE `week2_sql-assignment.csv - sales_data`;

SELECT *
FROM `week2_sql-assignment.csv - sales_data`;

SELECT *
FROM `week2_sql-assignment.csv - sales_data`
LIMIT 10;

SELECT
    COUNT(*) AS total_records
FROM `week2_sql-assignment.csv - sales_data`;

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(customer_name IS NULL) AS missing_customer_name,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(category IS NULL) AS missing_category,
    SUM(sub_category IS NULL) AS missing_sub_category,
    SUM(product_name IS NULL) AS missing_product_name,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(unit_price IS NULL) AS missing_unit_price,
    SUM(total_price IS NULL) AS missing_total_price,
    SUM(region IS NULL) AS missing_region
FROM `week2_sql-assignment.csv - sales_data`;

SELECT DISTINCT
    order_date
FROM `week2_sql-assignment.csv - sales_data`
ORDER BY order_date;

SELECT
    order_id,
    order_date AS excel_date,
    DATE_ADD('1899-12-30', INTERVAL order_date DAY) AS converted_date
FROM `week2_sql-assignment.csv - sales_data`
LIMIT 20;

SELECT
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`;

SELECT
    COUNT(order_id) AS total_orders
FROM `week2_sql-assignment.csv - sales_data`;

-- AVERAGE ORDER VALUE

SELECT
    ROUND(AVG(total_price), 2) AS average_order_value
FROM `week2_sql-assignment.csv - sales_data`;

SELECT
    SUM(quantity) AS total_quantity_sold
FROM `week2_sql-assignment.csv - sales_data`;

SELECT
    MIN(total_price) AS minimum_order_value,
    MAX(total_price) AS maximum_order_value
FROM `week2_sql-assignment.csv - sales_data`;

SELECT
    category,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY category
ORDER BY total_sales DESC;

SELECT
    category,
    SUM(quantity) AS total_quantity
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY category
ORDER BY total_quantity DESC;

SELECT
    sub_category,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY sub_category
ORDER BY total_sales DESC;

SELECT
    sub_category,
    SUM(quantity) AS total_quantity
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY sub_category
ORDER BY total_quantity DESC;

SELECT
    region,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY region
ORDER BY total_sales DESC;

SELECT
    region,
    SUM(quantity) AS total_quantity
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY region
ORDER BY total_quantity DESC;

SELECT
    customer_name,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_purchase
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY customer_name
ORDER BY total_purchase DESC;

-- TOP CUSTOMERS

SELECT
    customer_name,
    COUNT(order_id) AS total_orders,
    SUM(total_price) AS total_purchase
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY customer_name
ORDER BY total_purchase DESC
LIMIT 10;

SELECT
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY product_name
ORDER BY total_sales DESC;

SELECT
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT *
FROM `week2_sql-assignment.csv - sales_data`
ORDER BY total_price DESC
LIMIT 10;

SELECT *
FROM `week2_sql-assignment.csv - sales_data`
ORDER BY total_price ASC
LIMIT 10;

SELECT
    region,
    category,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY region, category
ORDER BY total_sales DESC;

SELECT
    category,
    sub_category,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY category, sub_category
ORDER BY total_sales DESC;

SELECT
    category,
    ROUND(AVG(unit_price), 2) AS average_unit_price
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY category
ORDER BY average_unit_price DESC;

SELECT
    region,
    SUM(total_price) AS regional_sales,
    ROUND(
        SUM(total_price) * 100 /
        (
            SELECT SUM(total_price)
            FROM `week2_sql-assignment.csv - sales_data`
        ),
        2
    ) AS sales_percentage
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY region
ORDER BY regional_sales DESC;

SELECT
    category,
    SUM(total_price) AS category_sales,
    ROUND(
        SUM(total_price) * 100 /
        (
            SELECT SUM(total_price)
            FROM `week2_sql-assignment.csv - sales_data`
        ),
        2
    ) AS sales_percentage
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY category
ORDER BY category_sales DESC;

SELECT
    DATE_ADD('1899-12-30', INTERVAL order_date DAY) AS order_date,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY order_date
ORDER BY order_date;

SELECT
    YEAR(
        DATE_ADD('1899-12-30', INTERVAL order_date DAY)
    ) AS year,
    MONTH(
        DATE_ADD('1899-12-30', INTERVAL order_date DAY)
    ) AS month,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY year, month
ORDER BY year, month;

SELECT
    YEAR(
        DATE_ADD('1899-12-30', INTERVAL order_date DAY)
    ) AS year,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY year
ORDER BY year;

SELECT
    DATE_ADD('1899-12-30', INTERVAL order_date DAY) AS order_date,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY order_date
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    DATE_ADD('1899-12-30', INTERVAL order_date DAY) AS order_date,
    SUM(total_price) AS total_sales
FROM `week2_sql-assignment.csv - sales_data`
GROUP BY order_date
ORDER BY total_sales ASC
LIMIT 10;

SELECT
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity_sold,
    SUM(total_price) AS total_sales,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MIN(total_price) AS minimum_order_value,
    MAX(total_price) AS maximum_order_value
FROM `week2_sql-assignment.csv - sales_data`;


SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_name) AS unique_customers,
    COUNT(DISTINCT category) AS unique_categories,
    COUNT(DISTINCT sub_category) AS unique_sub_categories,
    COUNT(DISTINCT product_name) AS unique_products,
    COUNT(DISTINCT region) AS unique_regions
FROM `week2_sql-assignment.csv - sales_data`;