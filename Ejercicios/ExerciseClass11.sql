USE sakila;

-- Find all the film titles that are not in the inventory.
SELECT f.title
FROM film f 
LEFT JOIN inventory i USING(film_id)
WHERE i.film_id IS NULL


-- Find all the films that are in the inventory but were never rented.
-- Show title and inventory_id.
-- This exercise is complicated.
-- hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null
SELECT f.title, i.inventory_id
FROM film f
JOIN inventory i USING(film_id)
LEFT JOIN rental r USING(inventory_id)
WHERE r.inventory_id IS NULL


-- Generate a report with:
-- customer (first, last) name, store id, film title,
-- when the film was rented and returned for each of these customers
-- order by store_id, customer last_name
SELECT c.first_name , c.last_name, s.store_id,f.title,r.rental_date ,r.return_date 
FROM customer c
JOIN store s USING(store_id)
JOIN rental r USING(customer_id)
JOIN inventory i USING(inventory_id)
JOIN film f using(film_id)
WHERE r.return_date IS NOT NULL


-- Show sales per store (money of rented films)
-- show store's city, country, manager info and total sales (money)
-- (optional) Use concat to show city and country and manager first and last name
SELECT ct.city, co.country, sa.first_name, sa.last_name, SUM(p.amount) as Sales
FROM store s 
JOIN address a USING(address_id)
JOIN city ct USING(city_id)
JOIN country co USING(country_id)
JOIN staff sa ON sa.staff_id = s.manager_staff_id
JOIN payment p ON sa.staff_id = p.staff_id
GROUP BY s.store_id


-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(*) AS peliculas 
FROM actor a 
JOIN film_actor USING(actor_id)
JOIN film USING(film_id)
GROUP BY a.actor_id 
HAVING peliculas = (SELECT MAX(Countt) FROM
(SELECT COUNT(*) AS Countt
    FROM actor
    JOIN film_actor using (actor_id)
	JOIN film using(film_id)
    GROUP BY actor.actor_id 
)AS X)

