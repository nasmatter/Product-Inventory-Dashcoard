
-- Create database and use it
CREATE DATABASE IF NOT EXISTS inventory_db;
USE inventory_db;

-- Drop existing tables if any
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Users;


CREATE TABLE Users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
	user_name VARCHAR(50) NOT NULL,
    user_email VARCHAR(100) NOT NULL UNIQUE,
    user_password VARCHAR(50) NOT NULL,
    user_role VARCHAR(50) DEFAULT 'staff'
);


CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);


CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_description TEXT,
    category_id INT,
    product_quantity_in_stock INT DEFAULT 0,
    product_price DECIMAL(10, 2) NOT NULL,
    product_created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
        ON DELETE SET NULL
);


CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    quantity_changed INT NOT NULL,
    transaction_type ENUM('IN', 'OUT') NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
);


-- Insert Users

INSERT INTO Users(user_name, user_email, user_password, user_role) VALUES
('Alice Smith', 'alices@gmail.com', 'abc12345', 'Admin'),
('Bob Johnson', 'bobj@gmail.com', 'ab1234567', 'Staff'),
('Kloey Kimms', 'kloeyk@gmail.com', 'nnnnnnnn' , 'Staff' ),
('Elija Peter', 'elijapj@gmail.com', 'a9999' , 'Staff');

DESCRIBE Users;
SELECT * FROM Users;

-- Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Stationery'),
('Groceries');

-- Products
INSERT INTO Products (product_name, product_description, category_id, product_quantity_in_stock, product_price) VALUES
('Wireless Mouse', 'Bluetooth mouse with ergonomic design', 1, 150, 599.00),
('Notebook', 'A5 size 80-page ruled notebook', 2, 300, 29.50),
('Organic Rice 5kg', 'Premium jasmine rice', 3, 80, 250.00);

-- Transactions
INSERT INTO Transactions (product_id, user_id, quantity_changed, transaction_type) VALUES
(1, 1, 50, 'IN'),
(2, 2, 100, 'IN'),
(3, 1, 40, 'IN'),
(1, 2, 10, 'OUT'),
(3, 2, 5, 'OUT');

