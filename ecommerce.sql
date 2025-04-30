create database ecommerce;
use ecommerce;

CREATE TABLE user_roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

INSERT INTO user_roles (role_name, description)
VALUES
('Admin', 'Full system access'),
('Vendor', 'Manages own store and products'),
('Customer', 'Can browse and place orders'),
('Support Agent', 'Handles customer support queries'),
('Delivery Partner', 'Responsible for delivering orders'),
('Marketing Manager', 'Manages campaigns and promotions'),
('Finance Analyst', 'Handles financial reporting'),
('Product Manager', 'Manages product listings and updates'),
('Inventory Manager', 'Oversees stock levels and supply'),
('Sales Executive', 'Focuses on boosting sales'),
('Content Creator', 'Uploads product content and descriptions'),
('Affiliate', 'Promotes products and earns commissions'),
('Logistics Manager', 'Coordinates order shipments'),
('Quality Control', 'Reviews product quality'),
('Warehouse Staff', 'Handles packaging and storage'),
('Returns Specialist', 'Manages returns and refunds'),
('UI/UX Designer', 'Designs the front-end interface'),
('Technical Support', 'Solves platform-related issues'),
('Security Officer', 'Monitors platform security'),
('Data Analyst', 'Analyzes customer and product data'),
('Regional Manager', 'Oversees operations in a region'),
('CRM Manager', 'Handles customer relationship management'),
('Legal Advisor', 'Ensures platform follows regulations'),
('Category Manager', 'Manages specific product categories'),
('Moderator', 'Monitors user reviews and feedback');

select * from user_roles;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    role_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(255), -- encrypted
    status VARCHAR(20) DEFAULT 'active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES user_roles(role_id) ON DELETE SET NULL
);


INSERT INTO users (role_id, first_name, last_name, email, phone, password)
VALUES
(1, 'Alice', 'Admin', 'alice.admin@example.com', '1234560001', 'hashed_pass1'),
(1, 'Ethan', 'Wright', 'ethan.admin@example.com', '1234560002', 'hashed_pass2'),
(1, 'Nina', 'Stone', 'nina.admin@example.com', '1234560003', 'hashed_pass3'),
(2, 'Bob', 'Vendor', 'bob.vendor@example.com', '2234560001', 'hashed_pass4'),
(2, 'Lucy', 'Taylor', 'lucy.vendor@example.com', '2234560002', 'hashed_pass5'),
(2, 'David', 'Lee', 'david.vendor@example.com', '2234560003', 'hashed_pass6'),
(2, 'Sarah', 'Wilson', 'sarah.vendor@example.com', '2234560004', 'hashed_pass7'),
(2, 'Tom', 'Brown', 'tom.vendor@example.com', '2234560005', 'hashed_pass8'),
(2, 'Megan', 'Clark', 'megan.vendor@example.com', '2234560006', 'hashed_pass9'),
(2, 'Chris', 'Morris', 'chris.vendor@example.com', '2234560007', 'hashed_pass10'),
(3, 'Charlie', 'Customer', 'charlie.customer@example.com', '3234560001', 'hashed_pass11'),
(3, 'Emma', 'Johnson', 'emma.customer@example.com', '3234560002', 'hashed_pass12'),
(3, 'Liam', 'Evans', 'liam.customer@example.com', '3234560003', 'hashed_pass13'),
(3, 'Olivia', 'Carter', 'olivia.customer@example.com', '3234560004', 'hashed_pass14'),
(3, 'Noah', 'Roberts', 'noah.customer@example.com', '3234560005', 'hashed_pass15'),
(3, 'Ava', 'Bailey', 'ava.customer@example.com', '3234560006', 'hashed_pass16'),
(3, 'Mason', 'Hall', 'mason.customer@example.com', '3234560007', 'hashed_pass17'),
(3, 'Isabella', 'Green', 'isabella.customer@example.com', '3234560008', 'hashed_pass18'),
(3, 'Elijah', 'Adams', 'elijah.customer@example.com', '3234560009', 'hashed_pass19'),
(3, 'Sophia', 'Nelson', 'sophia.customer@example.com', '3234560010', 'hashed_pass20'),
(3, 'Lucas', 'Mitchell', 'lucas.customer@example.com', '3234560011', 'hashed_pass21'),
(3, 'Mia', 'King', 'mia.customer@example.com', '3234560012', 'hashed_pass22'),
(3, 'Benjamin', 'Scott', 'benjamin.customer@example.com', '3234560013', 'hashed_pass23'),
(3, 'Charlotte', 'Turner', 'charlotte.customer@example.com', '3234560014', 'hashed_pass24'),
(3, 'James', 'Walker', 'james.customer@example.com', '3234560015', 'hashed_pass25');

select * from users;
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Devices such as mobile phones, laptops, etc.'),
('Clothing', 'Apparel including shirts, pants, dresses, etc.'),
('Home & Kitchen', 'Furniture, appliances, and kitchenware.'),
('Books', 'Books and educational materials.'),
('Toys', 'Toys and games for children.');

select * from categories;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
ALTER TABLE products ADD COLUMN category_id INT;
ALTER TABLE products
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES categories(category_id)
ON DELETE SET NULL;



INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES
('Smartphone', 'Latest model with 6GB RAM and 128GB storage', 699.99, 50, 1),
('Laptop', '15-inch laptop with i7 processor and 16GB RAM', 1200.00, 30, 1),
('T-shirt', 'Cotton T-shirt available in different sizes', 19.99, 100, 2),
('Jeans', 'Comfortable denim jeans for casual wear', 39.99, 70, 2),
('Blender', 'High-power blender for smoothies and soups', 89.99, 40, 3),
('Dining Table', 'Wooden dining table for 4 people', 250.00, 20, 3),
('Novel: The Great Adventure', 'A thrilling adventure novel', 14.99, 200, 4),
('Educational Toy Set', 'Toy set for learning and creativity', 29.99, 100, 5),
('Board Game', 'Family-friendly board game', 24.99, 60, 5);


SELECT * FROM products;

SELECT p.name AS product_name, c.category_name AS category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
LIMIT 0, 5000;



DESCRIBE categories;


SELECT u.first_name, u.last_name, ur.role_name 
FROM users u 
JOIN user_roles ur ON u.role_id = ur.role_id;


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 500.00, 'pending'),
(2, 1200.00, 'shipped'),
(3, 800.00, 'completed'),
(4, 300.00, 'pending'),
(5, 1500.00, 'completed'),
(6, 450.00, 'shipped'),
(7, 700.00, 'pending'),
(8, 1100.00, 'completed'),
(9, 350.00, 'pending'),
(10, 600.00, 'shipped');

select * from orders; 
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);






SELECT product_id, name FROM products;


INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 100.00),  -- Smartphone
(1, 3, 1, 300.00),  -- T-shirt
(2, 2, 3, 400.00),  -- Laptop
(2, 4, 2, 100.00),  -- Jeans
(3, 5, 2, 200.00),  -- Blender
(3, 6, 1, 400.00),  -- Dining Table
(4, 7, 1, 300.00),  -- Novel: The Great Adventure
(5, 8, 1, 1500.00), -- Educational Toy Set
(6, 9, 2, 225.00);  -- Board Game
SELECT * FROM order_items;

SELECT o.order_id, 
       SUM(oi.quantity * oi.price) AS total_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

ALTER TABLE orders ADD COLUMN status VARCHAR(20) DEFAULT 'Pending';

desc orders;

UPDATE orders
SET status = 'Shipped'
WHERE order_id = 1;

SELECT SUM(oi.quantity) AS total_products_sold
FROM order_items oi;

SELECT SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi;

SELECT MAX(p.price) AS max_price, 
       MIN(p.price) AS min_price
FROM products p;

SELECT AVG(p.price) AS average_price
FROM products p;

SELECT COUNT(*) AS expensive_product_count
FROM products
WHERE price > 500;

SELECT AVG(price) AS avg_price
FROM products
WHERE price < 1000;


SELECT COUNT(*) AS non_cat_1_2_products
FROM products
WHERE category_id NOT IN (1, 2);

SELECT COUNT(*) AS orders_in_range
FROM orders
WHERE order_id BETWEEN 3 AND 7;

SELECT SUM(quantity) AS high_price_quantity
FROM order_items
WHERE price > 300;

SELECT COUNT(*) AS gmail_users
FROM users
WHERE email LIKE '%@gmail.com';

SELECT COUNT(*) AS users_without_role
FROM users
WHERE role_id IS NULL;

SELECT COUNT(*) AS filtered_orders
FROM orders
WHERE status IN ('Completed', 'Shipped');

SELECT COUNT(*) AS excluded_category_products
FROM products
WHERE category_id NOT IN (1, 3);

SELECT COUNT(*) AS midrange_products
FROM products
WHERE price > 100 AND price < 1000;

SELECT COUNT(*) AS completed_or_pending
FROM orders
WHERE status = 'Completed' OR status = 'Pending';

SELECT product_id, name, price
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT product_id, name, price
FROM products
ORDER BY name
LIMIT 5 OFFSET 5;

CREATE TABLE products_backup AS
SELECT * FROM products;

SELECT user_id, first_name, created_at
FROM users
ORDER BY created_at DESC;

SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id;

SELECT o.order_id, u.first_name, u.last_name
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id;

SELECT u.user_id, u.first_name, o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

SELECT o.order_id, u.first_name, u.last_name
FROM orders o
RIGHT JOIN users u ON o.user_id = u.user_id;

SELECT u.user_id, u.first_name, o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id

UNION

SELECT u.user_id, u.first_name, o.order_id
FROM users u
RIGHT JOIN orders o ON u.user_id = o.user_id;

SELECT name 
FROM products 
WHERE product_id IN (
    SELECT product_id 
    FROM order_items 
    WHERE quantity > 2
);

SELECT 
    user_id, 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM users u
WHERE EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.user_id = u.user_id AND o.total_amount > 1000
);

SELECT 
    product_id, 
    SUM(quantity) AS total_quantity
FROM (
    SELECT * FROM order_items
) AS temp
GROUP BY product_id;

SELECT 
    user_id, 
    CONCAT(first_name, ' ', last_name) AS full_name,
    (
        SELECT COUNT(*) 
        FROM orders o 
        WHERE o.user_id = u.user_id
    ) AS total_orders
FROM users u;

SELECT * 
FROM products 
WHERE category_id = (
    SELECT category_id 
    FROM categories 
    WHERE category_name = 'Electronics'
);

DELIMITER $$

CREATE PROCEDURE GetUserOrderCount(IN input_user_id INT)
BEGIN
    SELECT 
        u.user_id,
        CONCAT(u.first_name, ' ', u.last_name) AS full_name,
        COUNT(o.order_id) AS total_orders
    FROM users u
    LEFT JOIN orders o ON u.user_id = o.user_id
    WHERE u.user_id = input_user_id
    GROUP BY u.user_id;
END $$

DELIMITER ;

CALL GetUserOrderCount(1);

DELIMITER $$

CREATE FUNCTION GetOrderTotal(orderId INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(quantity * price) 
    INTO total
    FROM order_items 
    WHERE order_id = orderId;

    RETURN IFNULL(total, 0);
END $$

DELIMITER ;

SELECT GetOrderTotal(2) AS total_amount;

ALTER TABLE users ADD COLUMN updated_at DATETIME;

DELIMITER $$

CREATE TRIGGER before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END $$

DELIMITER ;
ALTER TABLE users ADD COLUMN updated_at DATETIME;

SHOW TRIGGERS;

SELECT 
    (quantity * price) + 50 AS total_order_value_with_shipping
FROM order_items
WHERE order_id = 1;

SELECT 
    quantity * price AS total_price
FROM order_items
WHERE order_id = 1;

