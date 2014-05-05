#文本处理函数
SELECT *
FROM sakila.film;

SELECT rental_duration,Lower(title),Upper(description) AS description_upcase
FROM sakila.film
ORDER BY rental_duration;

SELECT Length(title) ,title
FROM sakila.film
ORDER BY Length(title);

SELECT title, description
FROM sakila.film
WHERE Soundex(title) = Soundex('beng');


#日期时间处理函数
SELECT *
FROM sakila.payment;

SELECT *
FROM sakila.payment
WHERE payment_date LIKE '2005-06-17%';

SELECT payment_id,payment_date,Date(payment_date)
FROM sakila.payment
WHERE Date(payment_date) = '2005-06-17';  #Date（）函数返回yyyy-mm-dd部分

SELECT payment_id,payment_date,Time(payment_date)
FROM sakila.payment
WHERE Time(payment_date) = '11:11:14';

SELECT *
FROM sakila.payment
WHERE Year(payment_date) = 2005 AND Month(payment_date) = 5 #有Day()、Hour()、Minute()、Second()
LIMIT 10;

SELECT CurDate(), CurTime(), Now();

SELECT payment_id,payment_date,DayOfWeek(payment_date)   #返回日期对应的星期几
FROM sakila.payment
LIMIT 10;


