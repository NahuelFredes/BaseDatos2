USE sakila;

-- Get the amount of cities per country in the database. Sort them by country, country_id.
SELECT country_id , country, (SELECT COUNT(*)
							  FROM city c1
							  WHERE c1.country_id = c2.country_id) AS city_amount
							  
FROM country c2
ORDER BY country, country_id 


-- Get the amount of cities per country in the database. Show only the countries with more than 10 cities, order from the 
-- highest amount of cities to the lowest
SELECT country_id , country, (SELECT COUNT(*)
							  FROM city c1
							  WHERE c1.country_id = c2.country_id) AS city_amount
							  
FROM country c2
HAVING city_amount > 10
ORDER BY city_amount DESC 


-- Generate a report with customer (first, last) name, address, total films rented and the total money spent renting films.
-- Show the ones who spent more money first .
SELECT c1.first_name, c1.last_name, a1.address, COUNT(*)AS total_films_rented,(SELECT SUM(amount)
																	  	FROM payment p1 
																	  	WHERE p1.customer_id = c1.customer_id ) as total_money_spent
FROM rental r1, customer c1, address a1
WHERE c1.customer_id = r1.customer_id
AND c1.address_id = a1.address_id 
GROUP BY c1.customer_id, c1.first_name, c1.last_name
ORDER BY total_money_spent DESC;


-- Which film categories have the larger film duration (comparing average)?
-- Order by average in descending order
SELECT c1.name ,AVG(f1.length) AS duration_average 
FROM film f1 ,film_category f2,category c1
WHERE f1.film_id = f2.film_id 
AND f2.category_id = c1.category_id 
GROUP BY c1.name
HAVING AVG(f1.length) > (SELECT AVG(f3.length) FROM film f3)
ORDER BY duration_average DESC


-- Show sales per film rating
SELECT f1.rating, SUM(p1.amount) AS SALES 
FROM film f1, inventory i1 ,rental r1 ,payment p1
WHERE p1.rental_id = r1.rental_id 
AND r1.inventory_id = i1.inventory_id 
AND i1.film_id = f1.film_id 
GROUP BY f1.rating;
