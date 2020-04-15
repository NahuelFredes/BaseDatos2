USE sakila;

-- Show title and special_features of films that are PG-13
SELECT title, special_features , rating
FROM film
where rating = 'PG-13';

-- Get a list of all the different films duration.
SELECT length
FROM film;

-- Show title, rental_rate and replacement_cost of films that have replacement_cost from 20.00 up to 24.00
SELECT title, rental_rate , replacement_cost 
FROM film 
WHERE replacement_cost BETWEEN 20.00 and 24.00
ORDER BY replacement_cost;

-- Show title, category and rating of films that have 'Behind the Scenes' as special_features
SELECT title, rating , special_features , name
FROM film f , film_category fc, category c
WHERE  f.film_id = fc.film_id 
and fc.category_id = c.category_id 
and special_features LIKE '%Behind the Scenes';

-- Show first name and last name of actors that acted in 'ZOOLANDER FICTION'
SELECT first_name , last_name , title
FROM actor a , film_actor fa , film f
WHERE a.actor_id = fa.actor_id 
and fa.film_id = f.film_id
and f.title = 'ZOOLANDER FICTION'

-- Show the address, city and country of the store with id 1
SELECT address , city , country , store_id 
FROM store s, address a, city ci, country co
WHERE s.address_id = a.address_id 
and a.city_id = ci.city_id 
and ci.country_id = co.country_id 
and store_id = 1;

-- Show pair of film titles and rating of films that have the same rating.
SELECT  f1.title ,f1.rating 
FROM film f1 , film f2
WHERE f1.rating = f2.rating 
and  f1.film_id <> f2.film_id;

-- Get all the films that are available in store id 2 and the manager first/last name of this store (the manager will appear in all the rows).
SELECT DISTINCT f.title , s1.store_id , first_name , last_name
FROM film f, inventory i , store s1 , staff s2
WHERE f.film_id = i.film_id 
and i.store_id = s1.store_id 
and s1.manager_staff_id = s2.staff_id 
and s1.store_id = 2;





