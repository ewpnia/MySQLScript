#创建视图
CREATE VIEW test.productcustomers AS
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
  AND orderitems.order_num = orders.order_num;


SELECT *
FROM test.productcustomers;

#--------------------------------------------------------
#视图用于重新格式化检索出来的数据

SELECT Concat(district, ' ( ', address, ' ) '), phone
FROM sakila.address
WHERE phone REGEXP '^6'
ORDER BY city_id;

CREATE VIEW test.addresslocaltions AS
SELECT Concat(district, ' ( ', address, ' ) '), phone
FROM sakila.address
WHERE phone REGEXP '^6'
ORDER BY city_id;

SELECT * 
FROM test.addresslocaltions;

#---------------------------------------------------------

CREATE VIEW test.address_not_null AS
SELECT address_id, address, city_id, postal_code, phone
FROM sakila.address
WHERE address IS NOT NULL;

SELECT *
FROM test.address_not_null;

#-----------------------------------------------------------

SELECT payment_id,rental_id,amount, rental_id * amount AS total_amount
FROM sakila.payment
ORDER BY payment_id
LIMIT 20;

CREATE VIEW test.order_payment AS
SELECT payment_id,rental_id,amount, rental_id * amount AS total_amount
FROM sakila.payment
ORDER BY payment_id;

SELECT *
FROM test.order_payment
WHERE total_amount > 5000;

#视图可使用INSERT、UPDATE、DELETE更新
#视图定义中有如下操作时，不能更新：
#使用了GROUP BY 和 HAVING、
#联结
#子查询
#并
#聚集函数（Min()、Count()、Sum()等）
#DISTINCT
#导出（计算）列

#因此，视图一般只用于检索SELECT

SHOW CREATE VIEW test.addresslocaltions;

DROP VIEW address_not_null;
