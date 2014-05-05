#等值联结
SELECT *
FROM sakila.payment AS p, sakila.customer AS c, sakila.rental AS r  #表别名
WHERE p.customer_id = c.customer_id 
	AND p.rental_id = r.rental_id
ORDER BY payment_id DESC
LIMIT 10;

#--------------------------------------------------------------------------------------------

#内部联结,约等于自然联结
SELECT *
FROM sakila.payment INNER JOIN sakila.customer
ON sakila.payment.customer_id = sakila.customer.customer_id;  #注意ON

#--------------------------------------------------------------------------------------------

#自联结
SELECT p1.payment_id, p2.rental_id
FROM sakila.payment AS p1, sakila.payment AS p2
WHERE p1.customer_id = p2.staff_id
  AND p2.staff_id - '1';

#--------------------------------------------------------------------------------------------

#外部联结
SELECT p.customer_id, r.staff_id
FROM sakila.payment AS p LEFT OUTER JOIN sakila.rental AS r   #LEFT指包含左边表的所有行
ON p.rental_id = r.rental_id
ORDER BY p.customer_id;

SELECT p.customer_id, r.staff_id
FROM sakila.payment AS p RIGHT OUTER JOIN sakila.rental AS r   #RIGHT指包含右边表的所有行
ON p.rental_id = r.rental_id
ORDER BY p.customer_id;

SELECT p.customer_id, r.staff_id
FROM sakila.payment AS p INNER JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
ORDER BY p.customer_id;

SELECT COUNT(p.customer_id), r.staff_id
FROM sakila.payment AS p LEFT OUTER JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
ORDER BY p.customer_id;

SELECT COUNT(p.customer_id), r.staff_id
FROM sakila.payment AS p RIGHT OUTER JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
ORDER BY p.customer_id;

SELECT COUNT(p.customer_id), r.staff_id
FROM sakila.payment AS p INNER JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
ORDER BY p.customer_id;

SELECT p.customer_id, r.staff_id
FROM sakila.payment AS p LEFT OUTER JOIN sakila.rental AS r   
ON p.rental_id = r.rental_id
GROUP BY r.staff_id
ORDER BY p.customer_id;

SELECT p.customer_id, r.staff_id
FROM sakila.payment AS p INNER JOIN sakila.rental AS r
ON p.rental_id = r.rental_id
GROUP BY r.staff_id
ORDER BY p.customer_id;