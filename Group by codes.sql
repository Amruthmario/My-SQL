-- GROUP BY
use employees;
SELECT * FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES WHERE Department='Manufacturing';

SELECT COUNT(*) FROM EMPLOYEES;

SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY Department; -- order is used for alphabat manner.

SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY count(*); 

SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY count(*) ASC; -- ASC is ascending order.


SELECT Department, count(*) 
FROM Employees
GROUP BY Department
ORDER BY count(*) DESC; -- DESC is descnding order.

SELECT Department, Status, Count(*)
FROM Employees
GROUP BY Department, Status
ORDER BY Department;


SELECT Department, Status, Count(*)
FROM Employees
GROUP BY Department, Status
ORDER BY Department,Status DESC;


SELECT Department, Status, Count(*)
FROM Employees
GROUP BY Department, Status
ORDER BY Department,count(*) DESC; 

SELECT Department, max(salary),min(salary)
FROM Employees
WHERE JobRating != 5
GROUP BY Department 
-- HAVING min(salary)>10000
having max(salary)>10000
ORDER BY Department ;


-- AUTO INCREMENT-- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table. 
-- Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

CREATE TABLE country (
country_id INT PRIMARY KEY auto_increment,
country_name VARCHAR(100)
);

INSERT INTO country(country_name) VALUES('India'),
						  ('Pakistan'),
                          ('Sri Lanka'),
                          ('Nepal'),
                          ('Bangaladesh'),
                          ('China'),
                          ('Russia');


SELECT * FROM COUNTRY;

INSERT INTO COUNTRY(country_name) VALUES('Finland'),('Dubai');

SELECT * FROM COUNTRY;

INSERT INTO COUNTRY(country_name) VALUES('Poland');

SELECT * FROM COUNTRY;

INSERT INTO COUNTRY VALUES(100,'Japan');

SELECT * FROM COUNTRY;

INSERT INTO COUNTRY(country_name) VALUES('Australia');

SELECT * FROM COUNTRY;

-- SUB QUERY = A subquery is a SELECT statement within another statement
-- All subquery forms and operations that the SQL standard requires are supported, as well as a few features that are MySQL-specific.

SELECT * FROM CUSTOMER_TBL;

SELECT * FROM TRANSACTION_TBL;

SELECT * FROM CUSTOMER_TBL
WHERE cust_id NOT IN (
SELECT distinct cust_id FROM TRANSACTION_TBL);

SELECT * FROM Employees;

SELECT First, Last, Department, Status
FROM Employees
WHERE salary = (
SELECT MAX(Salary) FROM Employees);

-- DELETE Vs Truncate Vs Drop
-- truncate means TRUNCATE TABLE empties a table completely. It requires the DROP privilege. 
-- Logically, TRUNCATE TABLE is similar to a DELETE statement that deletes all rows, or a sequence of DROP TABLE and CREATE TABLE statements.
SELECT * FROM CUSTOMER;
use customer;
SET SQL_SAFE_UPDATES=0;
DELETE FROM CUSTOMER WHERE custid=1003;  -- (delete a particular records)

DELETE FROM CUSTOMER;   -- (Delete entire table data)

DELETE FROM CUSTOMER WHERE gender='F';
use learnings;
SELECT * FROM pk_table;
TRUNCATE TABLE pk_table;  -- (Delete whole table data)

SELECT * FROM default_table;
DROP TABLE default_table;  -- (Delete both data as well as table)
