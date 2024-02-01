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

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment.customer_id
    HAVING SUM(amount) > 175
)

--3-A) 7 customers

-- 4. List all customers that live in Nepal (use the city 
-- table)

SELECT  customer.first_name, customer.last_name,   country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

--4-A) there is only one customer who line in Nepal' kevin schuler'


-- 5. Which staff member had the most 
-- transactions?

SELECT staff_id, COUNT(*) as transaction_count
FROM payment
GROUP BY staff_id
ORDER BY transaction_count DESC
LIMIT 1;

--5-A) staff_ id 2 has most transctions

--6. How many movies of each rating are there?

SELECT rating, COUNT(*)
FROM film
GROUP BY  rating

--6-A) PG-13 = 223, G = 178,R=195, NC-17  = 210, PG= 194






--7.Show all customers who have made a single payment above $6.99 (Use Subqueries) 
SELECT first_name,last_name
FROM customer
WHERE customer_id IN(
     SELECT customer_id
     FROM payment
     WHERE amount > 6.99
     GROUP BY customer_id
     HAVING COUNT(*) = 1
)



--8. How many free rentals did our stores give away?
SELECT *
FROM rental

SELECT *
FROM film

--i don't know