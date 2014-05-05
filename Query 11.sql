SELECT actor_id,first_name
FROM sakila.actor
WHERE actor_id >= 60            #ORDER BY不能放在这里之后，只能放在最后
UNION
SELECT actor_id,first_name
FROM sakila.actor
WHERE actor_id <= 150
ORDER BY actor_id;
#UNION默认去除重复的行
#以上这句UNION是有问题的，两个条件没生效，应该是<=和>=两个符号的问题……

SELECT actor_id,first_name
FROM sakila.actor
WHERE actor_id >= 60 
  AND actor_id <= 150
ORDER BY actor_id;

#?????????????????????????????????????
SELECT city_id, country_id
FROM sakila.city
WHERE city_id > 50
UNION ALL
SELECT city_id, country_id
FROM sakila.city
WHERE country_id*2 IN (206, 100, 34)
ORDER BY city_id;

SELECT city_id, country_id
FROM sakila.city
WHERE city_id > 50
  AND country_id*2 > city_id
ORDER BY city_id;

#?????????????????????????????????????
SELECT city_id, country_id
FROM sakila.city
WHERE city_id > 50
UNION
SELECT address_id, address
FROM sakila.address
WHERE city_id IN (44, 104, 91);
#ORDER BY city_id DESC;
