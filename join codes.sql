use learnings;

-- JOINS: c is donated for join

-- INNER JOIN
-- OUTER JOIN
-- 	LEFT JOIN
--  RIGHT JOIN
--  FULL JOIN
-- SELF JOIN

CREATE TABLE CUSTOMER_TBL(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(100),
city VARCHAR(20)
);


INSERT INTO CUSTOMER_TBL VALUES(1000,'Ramesh','Chennai');
INSERT INTO CUSTOMER_TBL VALUES(1001,'Malini','Bangalore');
INSERT INTO CUSTOMER_TBL VALUES(1002,'Raghul','Hyderabad');
INSERT INTO CUSTOMER_TBL VALUES(1003,'Arun','Pune');
INSERT INTO CUSTOMER_TBL VALUES(1004,'Shivani','Delhi');

select * from customer_tbl;

CREATE TABLE TANSACTION_TBL(
trans_id INT PRIMARY KEY,
cust_id INT,
product_name VARCHAR(50),
amount INT
);

INSERT INTO TANSACTION_TBL VALUES(1,1000,'Laptop',75000);
INSERT INTO TANSACTION_TBL VALUES(2,1000,'Mobile',50000);
INSERT INTO TANSACTION_TBL VALUES(3,1001,'TV',65000);
INSERT INTO TANSACTION_TBL VALUES(4,1001,'Fridge',50000);
INSERT INTO TANSACTION_TBL VALUES(5,1002,'Desktop',55000);
INSERT INTO TANSACTION_TBL VALUES(6,1003,'Washing Machine',55000);
INSERT INTO TANSACTION_TBL VALUES(7,1003,'MicroOven',30000);
INSERT INTO TANSACTION_TBL VALUES(8,1003,'Laptop',210000);
INSERT INTO TANSACTION_TBL VALUES(9,1002,'Laptop',100000);
INSERT INTO TANSACTION_TBL VALUES(10,1100,'TV',70000);


-- INNER JOIN

SELECT * FROM CUSTOMER_TBL c INNER JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT c.cust_name, c.city,t.product_name,t.amount FROM CUSTOMER_TBL c INNER JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT c.cust_name, c.city,t.product_name,t.amount FROM CUSTOMER_TBL c INNER JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id
WHERE t.amount>50000;

-- LEFT JOIN
SELECT * FROM CUSTOMER_TBL c LEFT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id; -- left join or left outer join.
SELECT * FROM CUSTOMER_TBL c LEFT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id WHERE t.trans_id IS NULL;

-- RIGHT JOIN

SELECT * FROM CUSTOMER_TBL c RIGHT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id;

SELECT * FROM CUSTOMER_TBL c RIGHT JOIN TANSACTION_TBL t ON c.cust_id=t.cust_id WHERE c.cust_id IS NULL;


-- FULL JOIN (condition less join)

SELECT * FROM customer_tbl c JOIN TANSACTION_TBL t;

-- SELF JOIN

CREATE TABLE employee_table(
emp_id INT,
ename VARCHAR(100),
salary INT,
mgr_id int);


INSERT INTO employee_table VALUES(1,'Ramesh',10000,5);
INSERT INTO employee_table VALUES(2,'Guna',12000,5);
INSERT INTO employee_table VALUES(3,'Sridhar',20000,5);
INSERT INTO employee_table VALUES(4,'Pankaj',25000,5);
INSERT INTO employee_table VALUES(5,'Mohan',15000,6);
INSERT INTO employee_table VALUES(6,'Siva',14000,6);

SELECT * from employee_table;

SELECT e1.ename as emp_name , e1.salary as emp_salary, e2.ename as mgr_name,e2.salary as mgr_salary 	
FROM employee_table e1 JOIN employee_table e2	
ON e1.mgr_id=e2.emp_id WHERE e1.salary > e2.salary;

SELECT e1.ename , e1.salary ,  e2.ename , e2.salary   -- , mgr_name,e2.salary , mgr_salary 	
FROM employee_table e1 JOIN employee_table e2	
ON e1.mgr_id=e2.emp_id WHERE e1.salary > e2.salary;

use learnings;

SELECT * FROM CUSTOMER_TBL;
RENAME TABLE TANSACTION_TBL TO TRANSACTION_TBL;
SELECT * FROM TRANSACTION_TBL;

CREATE TABLE ORDER_STATUS(
status_id INT,
trans_id INT,
deliver_status VARCHAR(20)
);

INSERT INTO ORDER_STATUS VALUES(1000,1,'Delivered'),
								(1001,2,'Delivered'),
                                (1001,3,'Delivered'),
                                (1001,4,'Delivered'),
                                (1001,5,'Delivered'),
                                (1001,6,'In-transiant'),
                                (1001,7,'Not Delivered'),
                                (1001,8,'Returned'),
                                (1001,9,'Not Delivered'),
                                (1001,10,'Returned');
                                
SELECT * FROM ORDER_STATUS;

ALTER TABLE ORDER_STATUS RENAME COLUMN deliver_status TO delivery_status;

-- cust_name, product_name, amount, delivery_status


SELECT c.cust_name, t.product_name, t.amount, o.delivery_status
FROM CUSTOMER_TBL c INNER JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id
INNER JOIN ORDER_STATUS o ON t.trans_id=o.trans_id;

SELECT c.cust_name,t.product_name, t.amount , o.delivery_status 
FROM CUSTOMER_TBL c LEFT JOIN TRANSACTION_TBL t ON c.cust_id=t.cust_id 
LEFT JOIN ORDER_STATUS o ON t.trans_id=o.trans_id;