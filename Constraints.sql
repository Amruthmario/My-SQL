use learnings;

-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- CHECK
-- DEFAULT
-- PRIMARY KEY
-- FOREIGN KEY

-- UNIQUE CONSTRAINTS- This check only the uniqueness of the value present in the data list. This allows the null values one or many.

create table unique_table(
custid int unique,
custname varchar(100),
age int,
city varchar(100)
);

insert into unique_table values(100,'siva',30,'chennai');
select * from unique_table;

insert into unique_table values(100,'ram',40,'hyd');  -- ERROR since there is a duplicate value for custid

insert into unique_table values(200,'ram',40,'hyd');

insert into unique_table(custname,age,city) values('guna',56,'banglore'); -- in null we store n number value
select * from unique_table;


-- Not NULL CONSTRAINTS

create table nn_table(
custid int not null,
custname varchar(20),
age int,
city varchar(20) );

insert into nn_table values(100,'siva',60,'chennai');
select * from nn_table;

insert into nn_table(custname,age,city) values('guna',56,'banglore'); -- error since there is no value for custid
insert into nn_table(custid) values(100);



create table nn_unique_table(
custid int unique not null,
custname varchar(20),
age int,
city varchar(20) );

insert into nn_unique_table values(100,'siva',30,'chennai');
select * from nn_unique_table;

insert into nn_unique_table values(100,'ram',40,'hyd');  -- ERROR since there is a duplicate value for custid

insert into nn_unique_table values(200,'ram',40,'hyd');

insert into nn_unique_table(custname,age,city) values('guna',56,'banglore'); -- 
select * from nn_unique_table;
 
-- CHECK 
use learnings;
create table check_table(
custid int,
custname varchar(20),
age int check (age > 0 and age <=100),
city varchar(100) check (city in ('chennai','bangalore','hyd')) 
);

insert into check_table values(1000,'rajini',30,'coimbatore');
select * from check_table;
insert into check_table values(1001,'priya',-1,'pune'); -- ERROR due to age value which is < 0
insert into check_table values(1001,'priya',1,'pune');

insert into check_table values(1001,'hemanth',100,'pune');
select * from check_table;

insert into check_table values(1002,'rohit',70,'Mumbai');


-- DEFAULT CONSTRAINTS = if we are not loading data to any column 
-- we dont to get that null values and want something else. this can be achived from default constraints.

create table default_table(
custid int,
custname varchar(20) ,
age int,
city varchar(20) default 'Hyderabed' );

desc default_table;
insert into default_table values(100,'mahesh',40,'Pune');
select * from default_table;

insert into default_table(custid,custname,age) values(200,'babu',45);
select * from default_table;

alter table default_table modify column custname varchar(100) default 'aparna';
insert into default_table(custid,age) values(100,40);
select * from default_table;

-- PRIMARY KEY: the column is used to identify each record in a table uniquely.
-- in this primary key won't allow null and duplicate.

create table pk_table(
empid int primary key, -- Simple primary key(for single column)
empname varchar(30),
gender char(1),
age int,
city varchar(20) );

insert into pk_table values(1000,'ganga','F',40,'kottapatta');
select * from pk_table;
insert into pk_table values(1001,'vijay','M',60,'vizg'); -- in this we cannot create a another with same id it shows error. so no duplicates are create.

insert into pk_table(empname,gender,age,city) values('surya','M',50,'Rishikonda'); -- error since empid does not have a value.

-- Composite primary key( for two column only)
create table comp_pk_table(
empid int , 
empname varchar(30),
gender char(1),
age int,
city varchar(20),
primary key(empid,empname) -- This composite primary key
 );

insert into comp_pk_table values(1000,'ganga','F',40,'kottapatta');
select * from comp_pk_table;
insert into comp_pk_table values(1001,'vijay','M',60,'vizg'); 

insert into comp_pk_table(empid,empname,gender,age,city) values(1000,'surya','M',50,'Rishikonda'); -- here duplicate is not an issue. 

-- FOREIGN KEY - Having the column, that is the child table. this foreign key is alawys depends on primary key table

create table customer_tables(
cust_id int primary key,
custname varchar(30),
gender char(30),
age int,
city varchar(30) );
 
 select * from customer_table;
 
create table order_tables(
order_id int primary key,
cust_id int,
prodname varchar(100),
amount decimal(20,2),
foreign key(cust_id) references customer_table(cust_id)
 );

insert into customer_table values(1000,'bala','M',40,'BAngalore'),(1001,'subbu','M',50,'kochi'),(1002,'karn','M',20,'Hyderbad');

insert into order_tables values(1,1000,'TV',75000.2);

------------------------------------------------------------------------------------------------------------------------------------- end 

use learnings;

-- PRIMARY KEY
--  Primary key column is used to identify each record in a table uniquely

CREATE TABLE pk_table(
empid INT primary key,    -- Simple primary key 
empname varchar(100),
gender char(1),
age int,
city varchar(20)
);

INSERT INTO pk_table VALUES(1000,'Durga','F',30,'Chennai');
SELECT * FROM pk_table;
INSERT INTO pk_table VALUES(1000,'Vijay','M',49,'Chennai'); -- ERROR since empid = 1000 is duplicate
INSERT INTO pk_table VALUES(1001,'Vijay','M',49,'Chennai');
SELECT * FROM pk_table;
INSERT INTO pk_table(empname,gender,age,city) VALUES('Guna','M',38,'Bangalore');  -- ERROR since empid does not have a value
INSERT INTO pk_table(empid,empname,gender,age,city) VALUES(1002,'Guna','M',38,'Bangalore'); 
SELECT * FROM pk_table;

CREATE TABLE comp_pk_table(
empid INT ,    
empname varchar(100),
gender char(1),
age int,
city varchar(20),
PRIMARY KEY (empid,empname)  -- composite primary key
);


INSERT INTO comp_pk_table VALUES(1000,'Durga','F',30,'Chennai');
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1000,'Vijay','M',49,'Chennai'); 
INSERT INTO comp_pk_table VALUES(1001,'Vijay','M',49,'Chennai');
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1000,'Durga','F',30,'Pune');  -- ERROR since 1000-Durga exists already
SELECT * FROM comp_pk_table;

INSERT INTO comp_pk_table(empname,gender,age,city) VALUES('Guna','M',38,'Bangalore');  -- ERROR since empid does not have a value
INSERT INTO comp_pk_table(empid,empname,gender,age,city) VALUES(1002,'Guna','M',38,'Bangalore'); 
SELECT * FROM comp_pk_table;


-- FOREIGN KEY- Maintain integrity with the data.

create table customer_table (
cust_id INT PRIMARY KEY,
custname VARCHAR(20),
gender CHAR(1),
age INT,
city VARCHAR(20)
);

SELECT * FROM customer_table;

create table ordering_table(
order_id INT primary key,
cust_id INT,
prod_name VARCHAR(100),
amount DECIMAL(20,2),
FOREIGN KEY (cust_id) REFERENCES customer_table(cust_id)
);

INSERT INTO customer_table VALUES(1000,'Bala','M',30,'Bangalore'),(1001,'Prabha','M',35,'Hyderabad'),(1002,'Saran','M',25,'Chennai'); -- parent table

INSERT INTO order_table VALUES(1,1000,'TV',750000.50);
SELECT * FROM order_table;
INSERT INTO order_table VALUES(2,1003,'Mobile',250000);  -- ERROR since 1003 is not present in the parent table
INSERT INTO order_table VALUES(2,1001,'Mobile',250000); 
SELECT * FROM order_table;
INSERT INTO order_table VALUES(3,1002,'Laptop',70000); 
SELECT * FROM order_table;
INSERT INTO order_table VALUES(4,1000,'Desktop',550000.50);
SELECT * FROM order_table;

DELETE FROM customer_table WHERE cust_id=1001; -- ERROR
DELETE FROM order_table WHERE cust_id=1001; -- child table 
DELETE FROM customer_table WHERE cust_id=1001;

SELECT * FROM customer_table;


CREATE TABLE parenet_table(
id INT PRIMARY KEY,
name VARCHAR(100)
);

RENAME TABLE parenet_table TO parent_table;

INSERT INTO parent_table VALUES(1,'Amazon'),(2,'Walmart'),(3,'Intuit'),(4,'Samsung'),(5,'Ford');

SELECT * FROM parent_table;



CREATE TABLE emp_table(
emp_id INT PRIMARY KEY,
comp_id INT,
name VARCHAR(100),
FOREIGN KEY (comp_id) REFERENCES parent_table(id) ON DELETE CASCADE ON UPDATE CASCADE -- Delete cascade means it deletes dependent rows in child table. 
);

INSERT INTO emp_table VALUES(1000,1,'Rakesh'),(1001,2,'Madhan'),(3,4,'Venkatesh');

SELECT * FROM emp_table;

DELETE FROM parent_table WHERE id=5;

UPDATE parent_table SET id=20 WHERE name='Walmart';


