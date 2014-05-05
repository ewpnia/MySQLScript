SELECT *
FROM sakila.payment
LIMIT 10;

SELECT payment_id,rental_id,amount, rental_id * amount AS total_amount
FROM sakila.payment
ORDER BY payment_id
LIMIT 20;

SELECT 2*6;

SELECT Trim('  ab v  ');

SELECT NOW();