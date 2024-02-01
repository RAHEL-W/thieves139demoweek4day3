SELECT * FROM users

-- INNER JOIN
SELECT full_name, order_id
FROM users
JOIN orders 
ON users.user_id = orders.user_id


--LEFT JOIN
SELECT *
FROM orders
LEFT JOIN users
ON orders.user_id = users.user_id

--RIGHT JOIN
SELECT *
FROM users
RIGHT JOIN orders
ON users.user_id = orders.user_id

--FULL JOIN 
SELECT * 
FROM users
FULL OUTER JOIN orders
ON users.user_id = orders.user_id

--MULTI JOIN 
SELECT users.user_id, users.full_name, orders.order_id, items.item_name, orders.order_date
FROM users
JOIN orders
ON users.user_id = orders.user_id
JOIN order_items
ON orders.order_id = order_items.order_id
JOIN items
ON order_items.item_id = items.item_id
WHERE full_name = 'Christian S.'
ORDER BY order_id 



