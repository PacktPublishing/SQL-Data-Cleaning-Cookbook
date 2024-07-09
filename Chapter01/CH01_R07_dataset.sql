DROP TABLE IF EXISTS ch01_r07_customers;
DROP TABLE IF EXISTS ch01_r07_orders;
DROP TABLE IF EXISTS ch01_r07_products;
DROP TABLE IF EXISTS ch01_r07_order_details;
DROP TABLE IF EXISTS ch01_r07_reviews;


-- Create Table customers
CREATE TABLE ch01_r07_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- Create Table orders
CREATE TABLE ch01_r07_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    amount DECIMAL(10, 2)
);

-- Create Table products
CREATE TABLE ch01_r07_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create Table order_details
CREATE TABLE ch01_r07_order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

-- Create Table reviews
CREATE TABLE ch01_r07_reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    review_text TEXT
);

-- Insert sample data into customers
INSERT INTO ch01_r07_customers (customer_id, customer_name, email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(5, 'John', 'john@example.com');

-- Insert sample data into orders
INSERT INTO ch01_r07_orders (order_id, order_date, customer_id, amount) VALUES
(1, '2023-06-01', 1, 150.00),
(2, '2023-06-02', 2, 200.00),
(3, '2023-06-03', 3, 250.00),
(4, '2023-07-03', 3, 410.00),
(5, '2023-07-03', 4, 410.00);

-- Insert sample data into products
INSERT INTO ch01_r07_products (product_id, product_name, price) VALUES
(1, 'Product A', 50.00),
(2, 'Product B', 75.00),
(3, 'Product C', 100.00),
(4, 'Product D', 30.00);

-- Insert sample data into order_details
INSERT INTO ch01_r07_order_details (order_detail_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 1);

-- Insert sample data into reviews
INSERT INTO ch01_r07_reviews (review_id, product_id, customer_id, review_text) VALUES
(1, 1, 1, 'Great product!'),
(2, 2, 2, 'Very satisfied!'),
(3, 3, 3, 'Highly recommend!');