#分组数据

SELECT staff_id, COUNT(*) AS num_staff_id
FROM sakila.payment;

SELECT staff_id, COUNT(*) AS num_staff_id
FROM sakila.payment
GROUP BY staff_id;

SELECT staff_id, COUNT(*) AS num_staff_id
FROM sakila.payment
GROUP BY staff_id WITH ROLLUP;

SELECT customer_id, COUNT(*) AS num_customer_id
FROM sakila.payment
WHERE staff_id = '1'
GROUP BY customer_id
ORDER BY amount;

#----------------------------------------------------
#WHERE无分组概念，HAVING为分组用的“WHERE”，HAVING支持所有WHERE操作符
SELECT staff_id, COUNT(*) AS num_staff_id
FROM sakila.payment
GROUP BY staff_id
HAVING COUNT(*) > 8000;

SELECT customer_id, COUNT(*) AS num_customer_id
FROM sakila.payment
WHERE staff_id = '1'
GROUP BY customer_id
#HAVING COUNT(*) >= 15
HAVING num_customer_id >= 15
ORDER BY amount;