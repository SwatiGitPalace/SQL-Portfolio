-- Insert Users
INSERT INTO Users (full_name, email, password_hash, phone_number, user_type) VALUES
('John Doe', 'john@example.com', 'hashed_password', '9876543210', 'Customer'),
('Admin User', 'admin@example.com', 'hashed_password', '9876543211', 'Admin');

-- Insert Categories
INSERT INTO Categories (category_name) VALUES ('Electronics'), ('Clothing'), ('Home Appliances');

-- Insert Products
INSERT INTO Products (product_name, description, price, stock_quantity, category_id) VALUES
('Laptop', 'High-performance laptop', 800.00, 50, 1),
('T-Shirt', 'Cotton T-shirt', 20.00, 200, 2),
('Microwave', '700W Microwave Oven', 100.00, 30, 3);

-- Insert Orders
INSERT INTO Orders (user_id, total_amount, status) VALUES (1, 820.00, 'Pending');

-- Insert Order Items
INSERT INTO Order_Items (order_id, product_id, quantity, subtotal) VALUES (1, 1, 1, 800.00), (1, 2, 1, 20.00);

-- Insert Payments
INSERT INTO Payments (order_id, payment_method, payment_status) VALUES (1, 'Credit Card', 'Completed');

-- Insert Shipments
INSERT INTO Shipments (order_id, tracking_number, shipment_status) VALUES (1, 'TRK123456', 'In Transit');
