USE sakila;
  
-- Create a view named list_of_customers, it should contain the following columns:
-- customer id
-- customer full name,
-- address
-- zip code
-- phone
-- city
-- country
-- status (when active column is 1 show it as 'active', otherwise is 'inactive')
-- store id

CREATE OR REPLACE
VIEW list_of_customers AS
SELECT
	c.customer_id,
	CONCAT(c.first_name, " ", c.last_name) AS Customer,
	a.address,
	a.postal_code AS zip_code,
	a.phone,
	ci.city,
	co.country,
	c.store_id,
	CASE
		WHEN c.active = 1 THEN "Active"
		ELSE "Inactive"
	END AS Status
FROM
	customer c
INNER JOIN address a
		USING(address_id)
INNER JOIN city ci
		USING(city_id)
INNER JOIN country co
		USING(country_id)

 
 
-- Create a view named film_details, it should contain the following columns: film id, title, description, category, price, length, rating, actors - as a string of all the actors separated by comma. Hint use GROUP_CONCAT

CREATE OR REPLACE
VIEW film_details AS
SELECT
	f.film_id,
	f.title,
	f.description,
	c.name,
	f.rental_rate AS Price,
	f.length,
	f.rating,
	GROUP_CONCAT(CONCAT_WS(' ', a.first_name, a.last_name)) AS Actors
FROM
	film f ,
	film_actor fa ,
	film_category fc ,
	actor a ,
	category c
WHERE
	f.film_id = fa.film_id
	AND fa.actor_id = a.actor_id
	AND f.film_id = fc.film_id
	AND fc.category_id = c.category_id 
GROUP BY f.film_id, c.name
  
  
-- Create view sales_by_film_category, it should return 'category' and 'total_rental' columns.

CREATE OR REPLACE
VIEW sales_by_film_category AS
SELECT
	c.name,
	COUNT(r.rental_id) AS total_rental
FROM
	payment p
JOIN rental r
		USING(rental_id)
JOIN inventory i
		USING(inventory_id)
JOIN film f
		USING(film_id)
JOIN film_category fc
		USING(film_id)
JOIN category c
		USING(category_id)
GROUP BY c.name
  

  
-- Create a view called actor_information where it should return, actor id, first name, last name and the amount of films he/she acted on.

CREATE OR REPLACE
VIEW actor_information AS
SELECT
	a.actor_id,
	a.first_name,
	a.last_name,
	COUNT(fa.film_id) AS Films_Acted
FROM
	actor a
JOIN film_actor fa
		USING(actor_id)
GROUP BY a.actor_id
  
  