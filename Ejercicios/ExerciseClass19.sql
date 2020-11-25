-- Create a user data_analyst
CREATE USER data_analyst IDENTIFIED BY 'password';

SELECT user FROM mysql.user;


-- Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.
GRANT SELECT,UPDATE,DELETE ON *.* TO 'data_analyst' WITH GRANT OPTION;


-- Login with this user and try to create a table. Show the result of that operation.
docker exec -it mysql /bin/bash
mysql -udata_analyst -ppassword

mysql> create table new_table;
ERROR 1142 (42000): CREATE command denied to user 'data_analyst'@'localhost' for table 'new_table'

-- Try to update a title of a film. Write the update script.

UPDATE sakila.film
SET title='Nuevo titulo', last_update=CURRENT_TIMESTAMP
WHERE film_id=1


-- With root or any admin user revoke the UPDATE permission. Write the command
REVOKE  UPDATE ON *.*  FROM data_analyst;


-- Login again with data_analyst and try again the update done in step 4. Show the result.
ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'@'localhost' for table 'film'