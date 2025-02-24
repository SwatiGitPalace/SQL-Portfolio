-- Step 1: Create the Database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Step 2: Create Tables

-- Users Table (Customers & Admins)
CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    user_type VARCHAR(10) CHECK (user_type IN ('Customer', 'Admin')),
    created_at DATETIME DEFAULT GETDATE()
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Products Table
CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category_id INT,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    order_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Order Items Table (Many-to-Many Relationship between Orders & Products)
CREATE TABLE Order_Items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT UNIQUE,
    payment_date DATETIME DEFAULT GETDATE(),
    payment_method VARCHAR(50) CHECK (payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'Net Banking')),
    payment_status VARCHAR(20) CHECK (payment_status IN ('Pending', 'Completed', 'Failed')),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);

-- Shipments Table
CREATE TABLE Shipments (
    shipment_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT UNIQUE,
    tracking_number VARCHAR(50),
    shipping_date DATETIME DEFAULT GETDATE(),
    delivery_date DATETIME,
    shipment_status VARCHAR(20) CHECK (shipment_status IN ('In Transit', 'Delivered', 'Failed')),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);
