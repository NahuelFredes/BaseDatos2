USE sakila;

-- Add a new customer
-- To store 1
-- For address use an existing address. The one that has the biggest address_id in 'United States'
INSERT INTO customer
(store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(1, 'Nahuel', 'Fredes', 'nahuelfredes2018@gmail.com', 
(SELECT MAX(address_id) FROM address 
JOIN city c USING(city_id)
JOIN country c1 USING(country_id)
WHERE c1.country = 'United States'),
1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)


-- Add a rental
-- Make easy to select any film title. I.e. I should be able to put 'film tile' in the where, and not the id.
-- Do not check if the film is already rented, just use any from the inventory, e.g. the one with highest id.
-- Select any staff_id from Store 2.
INSERT INTO rental (inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(
		(SELECT inventory_id
		FROM inventory
		JOIN film USING(film_id)
		WHERE title = 'BREAKING HOME' limit 1 ),
		(SELECT customer_id
		FROM customer limit 1 ), 
		CURRENT_TIMESTAMP, 
		(SELECT staff_id
		FROM staff
		WHERE staff.store_id = 2), 
		CURRENT_TIMESTAMP
		)


-- Update film year based on the rating
-- For example if rating is 'G' release date will be '2001'
-- You can choose the mapping between rating and year.
-- Write as many statements are needed.
UPDATE film
SET release_year = (CASE WHEN rating = 'PG' THEN 2020
                         WHEN rating = 'G' THEN 2021
                         WHEN rating = 'R' THEN 2005 END)
WHERE rating IN('PG','G','R')


-- Return a film
-- Write the necessary statements and queries for the following steps.
-- Find a film that was not yet returned. And use that rental id. Pick the latest that was rented for example.
-- Use the id to return the film.
SELECT * FROM film f 
JOIN inventory i USING(film_id)
JOIN rental r USING(inventory_id)
WHERE r.return_date IS NULL
ORDER BY r.rental_date DESC
LIMIT 1


-- Try to delete a film
-- Check what happens, describe what to do.
-- Write all the necessary delete statements to entirely remove the film from the DB.
-- NO SE PUDE BORAR UNA FILM DIRECTAMENTE YA QUE TIENE RELACIONES CON FILAS DE OTRAS TABLAS, 
-- PARA ELLO ES NECESARIO ELIMINAR TODAS LAS FILAS RELACIONADAS
DELETE FROM film
WHERE film_id=1

DELETE FROM film_actor
WHERE film_id=1

DELETE FROM film_category
WHERE film_id=1

DELETE FROM inventory
WHERE film_id=1


-- Rent a film
-- Find an inventory id that is available for rent (available in store) pick any movie. Save this id somewhere.
-- Add a rental entry
-- Add a payment entry
-- Use sub-queries for everything, except for the inventory id that can be used directly in the queries.
SET @ID =(SELECT inventory_id
			FROM inventory
			WHERE inventory_id NOT IN (SELECT inventory_id
										FROM rental
										WHERE return_date IS NOT NULL))


INSERT INTO rental
(rental_id, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(99999,@ID, 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP)

INSERT INTO payment
(customer_id, staff_id, rental_id, amount, last_update)
VALUES(1, 1, 99999, 999,  CURRENT_TIMESTAMP)




