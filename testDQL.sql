-- 1. List all customers who live in Texas (use 
-- JOINs) 

SELECT customer.first_name, customer.last_name,customer.address_id, address.address_id, address.district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district ='Texas'
--1_ A) 5  customers they live in Texas ,jennifer davis, kim cruz,  richard mccrary,  bryan hardison,  Ilan  still

-- 2. Get all payments above $6.99 with the Customer's Full 
-- Name  


SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY  customer.first_name, customer.last_name, amount
HAVING amount > 6.99

-- 2_A) daisy bates...... amount start  from  10.99



-- 3. Show all customers names who have made payments over $175(use 
-- subqueries) 