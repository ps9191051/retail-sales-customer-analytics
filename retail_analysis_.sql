-- Retail Sales & Customer Analytics
-- Database: retail_analytics
-- Analysis period: 2025
-- Stack: MySQL

USE retail_analytics;

-- Q1. Total Revenue
SELECT SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01';

-- Q2. Monthly Revenue Trend
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- Q3. Revenue by Category
SELECT p.category,
       SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Q4. Top 10 Customers by Revenue
SELECT c.customer_id, c.customer_name,
       SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Q5. Orders per Customer
SELECT c.customer_id, c.customer_name,
       COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
  ON c.customer_id = o.customer_id
 AND o.order_date >= '2025-01-01'
 AND o.order_date < '2026-01-01'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- Q6. Average Revenue per Customer
SELECT AVG(customer_revenue) AS avg_revenue_per_customer
FROM (
    SELECT c.customer_id,
           SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS customer_revenue
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    INNER JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
    GROUP BY c.customer_id
) AS customer_sales;

-- Q7. Top 10 Products by Units Sold
SELECT p.product_id, p.product_name,
       SUM(oi.quantity) AS total_quantity
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 10;

-- Q8. Top 10 Products by Revenue
SELECT p.product_id, p.product_name,
       SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Q9. Revenue by Region
SELECT l.region,
       SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
INNER JOIN locations l ON o.location_id = l.location_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY l.region
ORDER BY total_revenue DESC;

-- Q10. Discount vs Sales & Revenue
SELECT o.discount,
       SUM(oi.quantity) AS total_units_sold,
       SUM(oi.quantity * p.selling_price * (1 - o.discount)) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date >= '2025-01-01' AND o.order_date < '2026-01-01'
GROUP BY o.discount
ORDER BY o.discount;
