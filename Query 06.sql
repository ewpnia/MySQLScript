#汇总数据
#AVG()返回某列平均值,只支持单列,忽略列值为NULL的行

SELECT * FROM sakila.payment;

SELECT AVG(amount) AS avg_price
FROM sakila.payment;

SELECT AVG(amount) AS avg_price
FROM sakila.payment
WHERE staff_id = 2;

#------------------------------------------

SELECT COUNT(*) AS num_address  #有NULL的行也会计数
FROM sakila.address;

SELECT COUNT(address2) AS num_address_2     #不会计算有NULL值的行
FROM sakila.address;

SELECT MAX(amount) AS max_amount #对非数据返回最后一行，忽略NULL行
FROM sakila.payment;

SELECT MIN(amount) AS min_amount #对非数据返回最前面的行，忽略NULL行
FROM sakila.payment;

#------------------------------------------

SELECT SUM(amount) AS sum_price
FROM sakila.payment
WHERE staff_id = 2;

SELECT SUM(amount * rental_id) AS sum_price_2 #忽略NULL行
FROM sakila.payment
WHERE staff_id = 2;

#------------------------------------------

SELECT AVG(DISTINCT amount) AS avg_price , AVG(amount) AS avg_price_all #不声明DISTINCT时默认为ALL
FROM sakila.payment
WHERE staff_id = 2;

SELECT DISTINCT amount 
FROM sakila.payment
WHERE staff_id = 2;

#COUNT(DISTINCT *)  、COUNT(DISTINCT)非法

SELECT COUNT(*) AS num_address,
	MIN(city_id) AS min,
	MAX(city_id) AS max,
	AVG(city_id) AS avg
FROM sakila.address;