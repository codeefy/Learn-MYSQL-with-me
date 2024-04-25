create DATABASE rkart;
use rkart;
Create Table employee(
id INT PRImary key,
name varchar (100),
salary INT 
);

INSERT INTO employee
(id,name,salary)
VALUES 
(1, "adam",25000),
(2, "bob",30000),
(3, "casey", 40000);

SELECT * FROM employee;

CREATE TABLE emp(
id INT,
salary int default 25000);

INSERT INTO emp 
(id)
VALUES
(120);
 SELECT * FROM emp;
 
 CREATE TABLE city(
 id INT PRIMARY KEY ,
 city VARCHAR(50),
 age INT,
 CONSTRAINT age_check CHECK(age>=18 AND city= "Delhi")
 );
 




