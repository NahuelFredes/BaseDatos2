use sakila;

-- Find the films with less duration, show the title and rating.
SELECT f1.film_id, f1.title, f1.`length` 
FROM film f1
WHERE f1.`length` <= ALL(SELECT f2.`length` 
						FROM film f2)
ORDER BY f1.`length` 


-- Write a query that returns the tiltle of the film which duration is the lowest.
-- If there are more than one film with the lowest durtation, the query returns an empty resultset.
SELECT f1.film_id, f1.title, f1.`length` 
FROM film f1
WHERE f1.`length` < ALL(SELECT f2.`length` 
						FROM film f2)
ORDER BY f1.`length` 

-- Generate a report with list of customers showing the lowest payments done by each of them. 
-- Show customer information, the address and the lowest amount, provide both solution using ALL and/or ANY and MIN.
SELECT c1.customer_id , c1.first_name , c1.last_name,
(SELECT DISTINCT p1.amount
	FROM payment p1
	WHERE p1.customer_id = c1.customer_id
	AND p1.amount <= ALL (SELECT p1.amount
							FROM payment p1
							WHERE p1.customer_id = c1.customer_id )) AS lowest_payment
FROM customer c1
ORDER BY lowest_payment 
 


SELECT c1.customer_id, 
       c1.first_name, 
       c1.last_name, 
       MIN(p1.amount) lowest_payment 
  FROM customer c1, payment p1 
 WHERE c1.customer_id = p1.customer_id 
 GROUP BY c1.customer_id, c1.first_name, c1.last_name 
 ORDER BY lowest_payment DESC, customer_id DESC 

 
 
-- Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.
 SELECT c1.customer_id, 
		c1.first_name, 
        c1.last_name, 
	 	CONCAT((SELECT MIN(amount) 
	      FROM payment p1
	     WHERE p1.customer_id = c1.customer_id),'_____',
	     (SELECT MAX(amount) 
	      FROM payment p2
	     WHERE p2.customer_id = c1.customer_id)) AS `lowest_payment and highest_payment`	     
 FROM customer c1
 GROUP BY c1.customer_id, c1.first_name, c1.last_name 
 ORDER BY `lowest_payment and highest_payment` DESC, customer_id DESC 
 
 