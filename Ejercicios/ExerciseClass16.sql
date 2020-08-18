USE sakila;

-- Needs the employee table (defined in the triggers section) created and populated.
CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
)


-- 1- Insert a new employee to , but with an null email. Explain what happens.
INSERT  INTO `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`,age) VALUES 
(101110,'Murphy','Diane','x5800',NULL,'1',NULL,'President',15)
-- SQL Error [1048] [23000]: Column 'email' cannot be null CUANDO CREAMOS LA TABLA PONEMOS QUE EMAIL NO PUEDA SER NULL ASI QUE NOS DA ESTE MENSAJE DE ERROR

-- 2- Run the first the query
UPDATE employees SET employeeNumber = employeeNumber - 20
-- Nos sale un aviso de que no estamos usando un WHERE asi que posiblemente perdamos datos. Y resta 20 en employeeNumber de todas las rows

-- What did happen? Explain. Then run this other
UPDATE employees SET employeeNumber = employeeNumber + 20
-- El mismo aviso de antes, pero ahora suma 20 en employeeNumber de todas las rows


-- 3- Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.
ALTER TABLE employees
ADD age INT

ALTER TABLE employees
   ADD CONSTRAINT myCheckConstraint CHECK(age BETWEEN 16 AND 70);

  

-- 4- Describe the referential integrity between tables film, actor and film_actor in sakila db.
-- FILM_ACTOR ES UNA TABLA INTERMEDIA QUE PERMITE UNA RELACION MUCHOS A MUCHOS ENTRE FILM Y ACTOR. ESTA CONTIENE 2 FOREIGN_KEY(S) UNA PARA CADA TABLA QUE REFERENCIA

  

-- 5- Create a new column called lastUpdate to table employee and use trigger(s) to keep the date-time updated on inserts and updates operations.
-- Bonus: add a column lastUpdateUser and the respective trigger(s) to specify who was the last MySQL user that changed the row (assume multiple users, other than root, can connect to MySQL and change this table).
ALTER TABLE employees
ADD lastUpdate DATETIME;

ALTER TABLE employees 
ADD lastUpdateUser VARCHAR(50);

DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees
    SET action = 'update',
     lastUpdate = NOW(),
     lastUpdateUser = CURRENT_USER();
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_employee_update BEFORE
INSERT
	ON
	employees FOR EACH ROW BEGIN
INSERT
	INTO
	employees SET
	action = 'update',
	lastUpdate = NOW(),
	lastUpdateUser = CURRENT_USER();
END$$
DELIMITER ;
-- 6- Find all the triggers in sakila db related to loading film_text table. What do they do? Explain each of them using its source code for the explanation.
