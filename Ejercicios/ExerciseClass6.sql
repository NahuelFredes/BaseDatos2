use sakila;

-- List all the actors that share the last name. Show them in order
SELECT DISTINCT a1.* 
FROM actor a1 , actor a2
WHERE a1.last_name = a2.last_name
AND a1.actor_id <> a2.actor_id 
ORDER BY a1.last_name 

-- Find actors that don't work in any film
SELECT  DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a, film_actor fa, film f 
WHERE NOT EXISTS(SELECT *
FROM actor a1, film_actor fa1, film f1
WHERE a1.actor_id = fa1.actor_id 
and fa1.film_id = f1.film_id)


-- Find customers that rented only one film
SELECT c.customer_id, c.first_name, c.last_name 
FROM customer c
WHERE (SELECT COUNT(*)
FROM rental r 
WHERE c.customer_id = r.customer_id) = 1 


-- Find customers that rented more than one film
SELECT c.customer_id, c.first_name, c.last_name 
FROM customer c
WHERE (SELECT COUNT(*)
FROM rental r 
WHERE c.customer_id = r.customer_id) > 1


-- List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT  DISTINCT a.actor_id, a.first_name, a.last_name, f.title, f.film_id 
FROM actor a, film_actor fa, film f 
WHERE a.actor_id = fa.actor_id 
and fa.film_id = f.film_id
and f.title = 'BETRAYED REAR' 
OR f.title ='CATCH AMISTAD'


-- List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT  DISTINCT a.actor_id, a.first_name, a.last_name, f.title, f.film_id 
FROM actor a, film_actor fa, film f 
WHERE a.actor_id = fa.actor_id 
and fa.film_id = f.film_id
and f.title = 'BETRAYED REAR' 
and not  f.title ='CATCH AMISTAD'

-- List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT  DISTINCT a.actor_id, a.first_name, a.last_name, f.title, f.film_id 
FROM actor a, film_actor fa, film f 
WHERE a.actor_id = fa.actor_id 
and fa.film_id = f.film_id
and f.title = 'BETRAYED REAR' 
and f.title ='CATCH AMISTAD'

-- List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT  DISTINCT a.actor_id, a.first_name, a.last_name
FROM actor a, film_actor fa, film f 
WHERE a.actor_id = fa.actor_id 
and fa.film_id = f.film_id
and f.title <> 'BETRAYED REAR' 
and f.title <>'CATCH AMISTAD'
