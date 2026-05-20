CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    referred_by INT
);
table customers;
INSERT INTO customers(name, referred_by) VALUES
('Alice', NULL),
('Bob', 1),
('Charlie', 1),
('David', 2),
('Eva', 2),
('Frank', 3);

-- 1
SELECT c1.name AS "customer_name", c2.name AS "referrer_name"
FROM customers c1
LEFT JOIN customers c2 on c1.referred_by = c2.id;

-- 2
SELECT name AS "Customer_Name"
FROM customers
WHERE referred_by IS NULL;

-- 3
SELECT c1.name AS "customer_name", count(c2.id) AS "Count"
FROM customers c1
LEFT JOIN customers c2 ON c1.id = c2.referred_by
GROUP BY c1.name;

-- 4
SELECT c1.name AS "customer_name", count(c2.id) AS "Count"
FROM customers c1
JOIN customers c2 ON c1.id = c2.referred_by
GROUP BY c1.name;


