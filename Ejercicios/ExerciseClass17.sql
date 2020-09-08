USE sakila;

-- Create two or three queries using address table in sakila db:
-- include postal_code in where (try with in/not it operator)
-- eventually join the table with city/country tables.
-- measure execution time.
-- Then create an index for postal_code on address table.
-- measure execution time again and compare with the previous ones.
-- Explain the results
SELECT *
FROM address a
JOIN city c USING (city_id)
inner join country c2 USING (country_id)
WHERE postal_code IN ('40301','52625');
# 4ms

SELECT *
from address a
JOIN city c USING (city_id)
JOIN country c2 USING (country_id)
WHERE postal_code IN ('59025','89668','28396');
# 4ms

CREATE INDEX postalCode 
ON address(postal_code);
# 3ms


-- Run queries using actor table, searching for first and last name columns independently. Explain the differences and why is that happening?
/*2*/
SELECT first_name FROM film 
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
WHERE first_name LIKE('A%');
/*6ms*/
SELECT last_name FROM film 
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
where last_name LIKE('A%');
/*2ms*/


-- Compare results finding text in the description on table film with LIKE and in the film_text using MATCH ... AGAINST. Explain the results.
SELECT *
FROM film_text
WHERE description LIKE '%Epic%'
AND description LIKE '%Drama%';
# 6 rows - 5ms


SELECT * 
FROM film_text
WHERE MATCH(title, description) against('Epic,Drama');
# 142 rows - 4ms

# Full text search usa un index, mientras que like tiene que escanear registros en toda la tabla
# Like te trae menos rows por que es mas precisa
# LIKE "% The%" AND LIKE "% Matrix" seleccionará "The Matrix" pero no "Matrix Reloaded", mientras que full text search ignorará "The" y devolverá ambos.