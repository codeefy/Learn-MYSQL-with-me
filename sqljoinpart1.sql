CREATE TABLE IF NOT EXISTS STUDENTS
(
    ID VARCHAR(20) PRIMARY KEY,
    FIRST_NAME VARCHAR(100) NOT NULL,
    LAST_NAME VARCHAR(100) NOT NULL,
    GENDER VARCHAR(10) CHECK (GENDER IN ('M', 'F', 'Male', 'Female')),
    AGE INT,
    DOB DATE,
    GRADE FLOAT,
    IS_ACTIVE BOOLEAN,
    CONSTRAINT CH_STUDENTS_AGE CHECK (AGE > 0)
);

INSERT INTO STUDENTS(ID,FIRST_NAME,LAST_NAME,GENDER,AGE,DOB,GRADE,IS_ACTIVE)
VALUES('MSE25002','ROHIT','RAJ','Male',16,'2003-02-01',9.5,TRUE);
VALUES ('STD10251','Minnaminnie','Cleft','Female',8,TO_DATE('2012-02-23', 'YYYY-MM-DD'), 3, TRUE); -- Mention the column names.

INSERT INTO STUDENTS

VALUES ('STD10252','Effie','Emlyn','Female',8,TO_DATE('2012-03-28', 'YYYY-MM-DD'), 3, TRUE); -- Do not mention column names.

INSERT INTO STUDENTS VALUES

        ('STD10253','Kerry','Aysik','Female',8,TO_DATE('2012-01-09', 'YYYY-MM-DD'), 3, TRUE),

        ('STD10254','Jo','Mansfield','Male',8,TO_DATE('2012-03-26', 'YYYY-MM-DD'), 3, TRUE),

        ('STD10255','Elianore','Macon','Female',8,TO_DATE('2012-04-01', 'YYYY-MM-DD'), 3, FALSE); -- Insert multiple records.
select*from students;

ALTER TABLE STUDENTS DROP COLUMN GRADE; -- Drop a column.
ALTER TABLE STUDENTS ADD COLUMN REGISTER_NO VARCHAR(100); -- Add new column.

ALTER TABLE STUDENTS ALTER COLUMN IS_ACTIVE TYPE VARCHAR(1); -- Change data type of a column.

ALTER TABLE STUDENTS RENAME COLUMN IS_ACTIVE TO ACTIVE; -- Rename a column.

ALTER TABLE STUDENTS ADD CONSTRAINT UNQ_STD UNIQUE (REGISTER_NO); -- Add new constraint

ALTER TABLE STUDENTS DROP CONSTRAINT UNQ_STD; -- Drop a constraint.

ALTER TABLE STUDENTS RENAME TO STUDENTS123; -- Rename a table.

drop table students -- remove database table
TRUNCATE TABLE STUDENTS  --remove all the data from a table at once.

--update query 
update students
set first_name='james'
where id='MSE25005';-- update the single column

update students 
set first

CREATE TABLE department (dept_id VARCHAR(20) PRIMARY KEY, dept_name VARCHAR(50));
CREATE TABLE manager (manager_id VARCHAR(20) PRIMARY KEY, manager_name VARCHAR(50), dept_id VARCHAR(20));
CREATE TABLE employee (emp_id VARCHAR(20) PRIMARY KEY, emp_name VARCHAR(50), salary INTEGER, dept_id VARCHAR(20), manager_id VARCHAR(20));
CREATE TABLE projects (project_id VARCHAR(20), project_name VARCHAR(50), team_member_id VARCHAR(20));

INSERT INTO department VALUES ('D1','IT'),('D2','HR'),('D3','Finance'),('D4','Admin');

INSERT INTO manager VALUES ('M1','Prem','D3'),('M2','Shripadh','D4'),('M3','Nick','D1'),('M4','Cory','D1');

INSERT INTO employee VALUES ('E1','Rahul',15000,'D1','M1'),('E2','Manoj',15000,'D1','M1'),('E3','James',55000,'D2','M2'),('E4','Michael',25000,'D2','M2'),('E5','Ali',20000,'D10','M3'),('E6','Robin',35000,'D10','M3');

INSERT INTO projects VALUES ('P1','Data Migration','E1'),('P1','Data Migration','E2'),('P1','Data Migration','M3'),('P2','ETL Tool','E1'),('P2','ETL Tool','M4');




SELECT * FROM employee;-- D1,D2,D10
SELECT * FROM department; -- D1,D2,D3,D4
SELECT * FROM manager;
SELECT * FROM projects;
--drop table projects;

-- fetch the employee name and department they belong to 
-- inner join/join 
-- it will give the record that common in both table 

select e.emp_name,d.dept_name from employee e 
join department d on e.dept_id=d.dept_id

-- Left join 
-- fetch the employee name and the department name they belong to 
-- left join = inner join+any additional information present in Left table 
select e.emp_name,d.dept_name 
from employee e -- this is left table 
left join department --(this is Right table) 
d on e.dept_id=d.dept_id; 
-- this is basically running a inner query first then it is pulling the extra information that is present in the left table 
-- even if you notice ali and robin belong to D10 but in department table there is no D10 that why its giving null value for them 

-- Right Join 
--Right join =inner join + any extra information present in the right table 
select e.emp_name,d.dept_name 
from employee e -- this is left table 
Right join department --(this is Right table) 
d on e.dept_id=d.dept_id; 

--now fetch details of ALl emp,their manager,their department and the project they work on 
select e.emp_name,d.dept_name,m.manager_name--,p.project_name 
from employee e 
left join department d on e.dept_id=d.dept_id
join manager m on e.manager_id=m.manager_id
left join projects p on p.team_member_id=e.emp_id

-- when we are running the multiple join query we need to know how join works 
-- in this case when i applied the last left join it consider the above three lines query is left table and then it match the record on right table here is projects 
-- dont get confused with that the last left join which i applied on the last line it only consider the above line query no its not its consider whole line of code as left table 

-- full outer join /full join 
--full join = Inner join 
--           + all remaining records from the left table (returns null value for any columns fetch)
--           + all remaining records from the Right table (return null value for any column fetch)
select e.emp_name,d.dept_name
from employee e
full join department d on e.dept_id=d.dept_id
-- if you see the output the first four is inner join then left join and then right join that all full join 
-- left join ==> left outer join both are same 
-- Right join ==> Right outer join both are same 

-- Cross Join=> it will return cartesian product 
select e.emp_name,d.dept_name
from employee e -- 6 record 
cross join department d; -- 4
-- it will join every record from left table to every single record with the right table .
-- it will not join two table 
create table company(
company_id varchar(100) primary key,
company_name varchar(50),
location varchar(50)
)
insert into company values ('C001','techTFQ Solutions','Pune');
select * from company

-- write a query to fetch the employee name and their corresponding department name 
-- Also make sure to display the company name and the company location corresponding to each employee
select e.emp_name,d.dept_name,c.company_name,c.location
from employee e 
inner join department d on e.dept_id=d.dept_id
cross join company c ;
-- cross join is required when two table has no matching column but you need to fetch the record 
-- Natural Join 
select e.emp_name,d.dept_name
from employee e                
natural join department d ;
-- here it will performed like inner join 
-- in sql natural join do a inner join if there are column sharing the same name from both the table but if the column name has no same name from both the table it will do a cross join 
-- now we are going to change the dept_id name to id
alter table department rename column dept_id to id;
-- now if i perform natural join it will behave like cross join 
select e.emp_name,d.dept_name
from employee e                
natural join department d ;
-- not recommendaed to use natural join 

-- Self join=> join a table to it self (important)



























