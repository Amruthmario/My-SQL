-- SQL(Stutured Query Language)
-- What is database 
-- it is a collection of schema(tables,views,functions,procedure)

-- What is tabel
-- It is a object which contains data(columns-rows format)

-- How to create a database
-- Syntax:
--       CREATE DATABASE database_name;

-- Agenda:
-- DDL - Data definition language(create,alter,drop,truncate)
-- DML - Data Manupalation language(insert,update,delete)
-- DCL - Data Control language(grant and revoke)
-- TCL - Transaction control language ( commit,rollback,savepoint)
-- DQL - Data query language(select)

create database customer;
USE customer;
-- drop database customer;

-- How to create a table

create table customer(
custid int,
custname varchar(100),
gender char(1),
age int,
city varchar(20),
date_of_birth date
);

-- Data type in MySQL
-- INT -> Integer to store all the numerical values(numbers)
-- CHAR -> Character (Fixed length of character)
-- VARCHAR -> variable character (Not a fixed length of character)
-- DATA -> To store the data
-- Decimal(20,2) -> To store the full number upto 20 digits and decimal with 2 digits (3426648.50)
-- * this indicates all the columns
select * from customer;
-- How to load the data into table - can be done by using insert into query

 
insert into customer values(100,'mario','M',23,'Hyderbad',current_date());

select * from customer;
insert into customer values(200,'amrutha','F',24,'vizg','1999-01-10');

select * from customer;
insert into customer values(100,'Ashwin','M',20,'banglore','2000-01-10'),
(200,'amrutha','F',23,'Hyderabad','1999-02-24'),(300,'teja','M',21,'Nellore','2000-04-24')

select now();
insert into customer(custid,custname,gender,city) values(400,'guna','M','chennai');
select * from customer;
insert into customer(custid,custname,gender,city) values(500,'Charan','M','kochi');
 
 create table test_tables(
 age int 
 );

-- Update statement
select * from customer;

-- Syntax :update <table_name> set colum_name= value where custid=500;

set sql_safe_updates=0;
update customer set age=45,date_of_birth='1999-10-01' where custid=500;

update customer set age=40,date_of_birth='1973-05-05' where custid=400;

update customer set city='Mumbai' where city='chennai';

update customer set city='delhi' where city='Hyderbad' and custid=200;

-- Delete statement 

-- Syntax: delete from <table_name> where condition;
select * from customer;
delete from customer where custid=100;

delete from customer where age >= 40;

delete from customer where city in('banglore','Hyderbad');

