--  Retrieve all customers in a specific city -- 
SELECT 
    *
FROM
    customers
WHERE
    city = 'New York';

-- Retrieve all products in a specific category (e.g., category_id = 1) -- 
SELECT 
    *
FROM
    categories
WHERE
    category_id = '1';

-- Get all orders with a total amount greater than $500 -- 
SELECT 
    *
FROM
    orders
WHERE
    total_amount > 500;

-- Get all customers created in the last 30 days -- 
SELECT 
    *
FROM
    customers
WHERE
    created_at > NOW() - INTERVAL 30 DAY;

-- Retrieve the total number of products in each category -- 
SELECT 
    category_id, COUNT(product_id) AS total_products
FROM
    products
GROUP BY category_id;

-- Get the details of the largest order (by total amount) -- 
SELECT 
    order_id, customer_id, total_amount
FROM
    orders
ORDER BY total_amount DESC;
 
-- Get the total quantity of each product sold (in orderItems) --
SELECT 
    product_id, SUM(quantity) AS total_quantity
FROM
    orderitems
GROUP BY product_id;

-- Retrieve customers along with their total number of orders -- 
SELECT 
    customer_id, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY customer_id;

-- Get all products with a price greater than the average product price -- 
SELECT 
    product_id, price
FROM
    products
WHERE
    price > (SELECT 
            AVG(price)
        FROM
            products);

-- List the number of products in each category, sorted by category name -- 
SELECT 
    c.category_name, COUNT(p.product_id) AS total_products
FROM
    categories c
        JOIN
    products p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY c.category_name;

-- Retrieve all order details along with customer information -- 
SELECT 
    o.order_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    o.total_amount
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id;

-- Get all products with their category names -- 
SELECT 
    p.product_id, p.product_name, c.category_id, p.price
FROM
    products p
        JOIN
    categories c ON p.category_id = c.category_id;

-- List all items in an order with the product names and quantities -- 
SELECT 
    p.product_id, p.product_name, o.quantity
FROM
    orderitems o
        JOIN
    products p ON o.product_id = p.product_id
WHERE
    o.order_id = '1';

-- Retrieve all orders, including customer names and total amounts, for orders with a total amount greater than $500 -- 
SELECT 
    c.customer_id,
    o.order_id,
    o.total_amount,
    c.first_name,
    c.last_name
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    total_amount > 500;

-- List all products along with the total number of times they were ordered (sorted by most ordered)-- 
SELECT 
    p.product_name, SUM(quantity) AS total_orders
FROM
    products p
        JOIN
    orderitems o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC;

-- Retrieve customer details and their total spending (sum of all orders) --
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spending
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- listing customers who never placed order --  
SELECT 
    c.customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    c.phone,
    c.email
FROM
    customers c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id;

-- Find the average order amount -- 
SELECT 
    AVG(total_amount) AS average_amount
FROM
    orders;

-- Find the customers who have placed more than 2 orders --
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

--  List all orders that include a product priced above $600 -- 
SELECT 
    c.customer_id, c.first_name, c.last_name, o.total_amount
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.customer_id
        JOIN
    orderitems oi ON o.order_id = oi.order_id
WHERE
    oi.price > 600;

-- Get all products where stock is below a certain threshold (e.g., less than 10) -- 
SELECT 
    product_id, product_name, stock
FROM
    products
WHERE
    stock < 10; 
