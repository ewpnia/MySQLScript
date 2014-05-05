SELECT * FROM sakila.address;

SELECT *
FROM sakila.address
WHERE postal_code REGEXP '.00'
ORDER BY address_id;

SELECT *
FROM sakila.address
WHERE postal_code REGEXP '.00|.44'
ORDER BY address_id;

SELECT *
FROM sakila.address
WHERE address REGEXP '[MJL] Parkway';

SELECT *
FROM sakila.address
WHERE address REGEXP '[HOF] Street';

SELECT *
FROM sakila.address
WHERE address REGEXP '[a-z] Street';

SELECT *
FROM sakila.address
WHERE address REGEXP '\\(';

SELECT *
FROM sakila.address
WHERE address REGEXP '\\(La Corua?\\)';

SELECT *
FROM sakila.address
WHERE address REGEXP '[[:digit:]]{4}';