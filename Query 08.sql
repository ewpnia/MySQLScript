SELECT customer_id , payment_id
FROM sakila.payment
WHERE staff_id = '2';

#以下脚本有问题，跟上面的一句效果不一样
SELECT payment_id
FROM sakila.payment
WHERE customer_id IN (	SELECT customer_id
						FROM sakila.payment
						WHERE staff_id = '2'	);

SELECT payment_id,(	SELECT COUNT(*)
						FROM sakila.payment,sakila.customer
						WHERE sakila.payment.customer_id = sakila.customer.customer_id ) AS num_rental_id
FROM sakila.payment
ORDER BY rental_id;