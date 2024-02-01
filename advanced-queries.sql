SELECT * FROM actor

--Find the first and last name of customers who spent more than 175
-- introduce HAVING (WHERE but with Aggregates)


--QUERY 1 find customer_id's with sum amounts greater 175
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175

--QUERY 2 find full name for each of those return id's from QUERY 1

SELECT first_name, last_name
FROM customer
WHERE customer_id = 144

-- COMBINE using a SUBQUERY

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment.customer_id
    HAVING SUM(amount) > 175
)

SELECT first_name, last_name, SUM(amount)
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name
HAVING SUM(amount) > 175


SELECT *
FROM staff


