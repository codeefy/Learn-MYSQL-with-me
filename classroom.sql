CREATE DATABASE classroom;
USE classroom;

CREATE TABLE Student (
rollno INT PRIMARY KEY ,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR (50),
city VARCHAR (20)
);
CREATE TABLE dept (
id INT PRIMARY KEY ,
name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101,"ENGLISH"),
(102,"IT");
SELECT * FROM  DEPT;

UPDATE dept
SET id=111
WHERE id=101;


CREATE TABLE teacher(
id INT PRIMARY KEY ,
name VARCHAR(50),
dept_id INT NOT NULL,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);


INSERT INTO teacher
VALUES
(101,"Adam",101),
(102,"Eve",102);

SELECT* FROM teacher;


INSERT INTO Student
(rollno,name ,marks,grade,city)
VALUES
(101,"anil",78,"C","pune"),
(102,"rajesh",93,"A","Mumbai"),
(103,"rohit",85,"B","Mumbai"),
(104,"mohit",96,"A","Delhi"),
(105,"pooja",12,"E","Delhi"),
(106,"farah",82 ,"B","Delhi");

SELECT * FROM student;
TRUNCATE TABLE student;

ALTER TABLE student 
CHANGE name full_name varchar(50);

ALTER TABLE student 
DROP COLUMN age;

DELETE FROM student 
where marks<80;



ALTER TABLE student
add COLUMN age INT NOT NULL DEFAULT 19;

SELECT avg(marks) 
FROM student;

SELECT full_name,marks
FROM student 
WHERE marks >89.0000;

SELECT full_name,marks
FROM student 
WHERE marks > (SELECT avg(marks) FROM student);

SELECT rollno
FROM student 
WHERE rollno%2=0;

SELECT full_name,rollno
FROM student 
WHERE rollno IN (SELECT rollno
FROM student 
WHERE rollno%2=0);

SELECT *
FROM student 
WHERE city ="Delhi";

SELECT MAX(marks)
FROM(SELECT *FROM student WHERE city ="Delhi") as temp;

SELECT MAX(marks)
FROm student 
where city="Mumbai";





SELECt name , marks From Student;
SELECT DISTINCT city   FROM student; 
SELECT *FROM student WHERE marks> 80;
SELECT *FROM student WHERE marks>80 and city="Mumbai";
SELECT *FROm student WHERE marks between 80 and 90;
SELECT *FROM student WHERE city in ("Delhi","Mumbai");
SELECT *FROm student WHERE city NOT IN ("Delhi","Mumbai");
SELECT* FROM student where marks >80 LIMIT 3;

SELECt * FROM student 
ORDER BY marks DESC
LIMIT 3;


SELECT AVG(marks) FROM student;
SELECT city ,name, count(rollno)
FROM student 
group by city,name;


SELECT city, avg(marks)
FROM student
 GROUP BY  city
 order by city ASC;
 
 CREATE TAbLE Cust(
 customer_id INT PRIMARY KEY,
 customer varchar (50),
 mode varchar(50),
 city varchar(50)
 );
 
 INSERT INTO cust 
 (customer_id,customer,mode,city)
 VALUES
 (101,"abc","Netbanking","Portland"),
 (102,"ab","creditcard","miami"),
 (103,"pqr","creditcard","seattle") ,
 (104,"pq","Netbanking","Denver"),
 (105,"xyz","creditcard","Newjersy"),
 (106,"xy","Debitcard","Newdelhi"),
 (107,"bcd","Debitcard","Bihar"),
 (108,"ava","Netbanking","India"),
 (109,"patel","Netbanking","Gaya"),
 (110,"krishna","Creditcard","Bathani");
select*from cust;

SELECT Mode , count(customer) FROM cust
group by mode ;
SELECT grade ,count(name) FROM student 
group by grade
order by grade 

SELECT city,count(rollno)
FROM student 
GROUP BY city
HAVING MAX(marks)>90;

SELECT city FROM student 
Where grade="A"
GROUP BY city
HAVING MAX(marks)>=93
ORDER BY city DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE student 
SET grade="O"
where grade="A";


UPDATE student 
SET grade="E"
where marks<40;


UPDATE student 
SET marks=marks+1;

UPDATE student
set marks="12"
where rollno=105;

SELECT *FROM student;

DELETE from Student 
WHERE marks<33;















 
 





