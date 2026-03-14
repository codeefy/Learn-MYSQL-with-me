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
set first_name='Rohan',grade=4
where id ='STD10254'-- update multiple column at once 

delete from students where id ='STD10253' -- remove only one record 
delete from students; -- remove all data from table















