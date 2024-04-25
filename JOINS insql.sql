CREATE DATABASE clg;
use clg; 

CREATE TABLE stu(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO stu (id,name ) 
VALUES
(101,"adam"),
(102,"bob"),
(103,"casey");

CREATE TABLE course (
id INT PRIMARY KEY ,
course VARCHAR (50)
);

INSERT INTO course (id,course)
VALUES
(102,"english"),
(105,"math"),
(103,"science"),
(107,"CS");

SELECT * FROM stu;
SELECT * FROM course;


SELECT * 
FROM stu as s
INNER JOIN course  as c
ON s.id=c.id;

SELECT * 
FROM stu as s
LEFT JOIN course  as c
ON s.id=c.id
UNION
SELECT * 
FROM stu as s
RIGHT JOIN course  as c
ON s.id=c.id;

SELECT * 
FROM stu as s
LEFT JOIN course as c
ON s.id = c.id 
WHERE c.id IS NULL 
UNION
SELECT * 
FROM stu as s
RIGHT JOIN course as c
ON s.id = c.id 
WHERE s.id IS NULL ;

CREATE TABLE employee(
id INT PRIMARY KEY ,
name VARCHAR (50),
manager_id INT 
);

INSERT INTO employee
(id,name,manager_id )
VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);

SELECT * FROM employee;

SELECT a.name as manager_name , b.name
FROM employee as a 
join employee as b 
ON a.id =b.manager_id ;




