SELECT *
FROM forpython.fruits
WHERE (ID > 4 OR PRICE > 11) AND Color != 'yellow';

SELECT *
FROM sakila.actor
WHERE actor_id IN (1,20,16);

SELECT *
FROM sakila.actor
WHERE actor_id NOT IN (1,88,15,67,35);

SELECT * 
FROM sakila.actor
WHERE first_name LIKE 'J%';

SELECT *
FROM sakila.actor
WHERE first_name LIKE 'J___';

SELECT * 
FROM sakila.actor
WHERE first_name REGEXP 'JOE';

SELECT * 
FROM sakila.actor
WHERE first_name LIKE 'JOE';