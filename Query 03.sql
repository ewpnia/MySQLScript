SELECT Concat(district, ' ( ', address, ' ) '), phone
FROM sakila.address
WHERE phone REGEXP '^6'
ORDER BY city_id;

SELECT Concat(RTrim(address), ' ( ', RTrim(postal_code), ' )'), phone
FROM sakila.address
WHERE phone REGEXP '^1'
ORDER BY city_id;

SELECT Concat(Trim(address), ' < ', Trim(postal_code), ' >') AS title, phone
FROM sakila.address
WHERE phone REGEXP '^2' 
AND phone REGEXP '8$'      # 两条正则匹配要分开写
ORDER BY city_id;

SELECT Concat(Trim(address), ' < ', Trim(postal_code), ' >') AS title, phone, city_id
FROM sakila.address
WHERE phone like '2%8'
ORDER BY city_id DESC;