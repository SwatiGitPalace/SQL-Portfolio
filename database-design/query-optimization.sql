-- Index for faster user search
CREATE INDEX idx_users_email ON Users(email);

-- Index for quick order lookups
CREATE INDEX idx_orders_user ON Orders(user_id);

-- Optimized query to fetch orders with details
SELECT 
    o.order_id, u.full_name, p.product_name, oi.quantity, o.total_amount, s.shipment_status
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
JOIN Shipments s ON o.order_id = s.order_id
WHERE o.status = 'Pending';
