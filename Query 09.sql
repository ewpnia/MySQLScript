SELECT *
FROM sakila.payment,sakila.customer
WHERE sakila.payment.customer_id = sakila.customer.customer_id
ORDER BY payment_id DESC
LIMIT 10;

SELECT DISTINCT *
FROM sakila.payment,sakila.customer
WHERE sakila.payment.customer_id = sakila.customer.customer_id
ORDER BY payment_id DESC;

SELECT *
FROM sakila.payment INNER JOIN sakila.customer
ON sakila.payment.customer_id = sakila.customer.customer_id
ORDER BY payment_id DESC
LIMIT 10;


#以下SQL语句有问题，COUNT()中不能带多列,且COUNT()中不能带SQL语句
SELECT COUNT(SELECT *
			FROM sakila.payment,sakila.customer
			WHERE sakila.payment.customer_id = sakila.customer.customer_id) AS count_1,
		COUNT(SELECT *
			FROM sakila.payment INNER JOIN sakila.customer
			ON sakila.payment.customer_id = sakila.customer.customer_id) AS count_2;

SELECT COUNT(payment_id) AS count_1
FROM sakila.payment,sakila.customer
WHERE sakila.payment.customer_id = sakila.customer.customer_id;

SELECT COUNT(payment_id) AS count_1
FROM sakila.payment INNER JOIN sakila.customer
ON sakila.payment.customer_id = sakila.customer.customer_id;


SELECT *
FROM sakila.payment, sakila.customer, sakila.rental
WHERE sakila.payment.customer_id = sakila.customer.customer_id 
	AND sakila.payment.rental_id = sakila.rental.rental_id
ORDER BY payment_id DESC
LIMIT 10;