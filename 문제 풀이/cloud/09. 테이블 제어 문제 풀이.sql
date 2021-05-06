-- 1.
DESC dept;
CREATE TABLE dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(13)
);
-- 2.
DESC emp;
CREATE TABLE emp(
    eno number(4),
    ename varchar2(10),
    dno number(2)
);
-- 3.
ALTER TABLE emp
MODIFY ename varchar2(25);

DESC emp;

-- 4.
CREATE TABLE employee2(
    EMP_ID,
    NAME,
    SAL,
    DEPT_ID
)
AS
SELECT eno,ename,salary,dno FROM employee;
SELECT * FROM employee2;

-- 5.
DROP TABLE emp CASCADE CONSTRAINTS;

-- 6.
RENAME employee2 to emp;

SELECT * FROM emp;

-- 7. 
ALTER TABLE dept
DROP COLUMN dname;

DESC dept;

-- 8.
ALTER TABLE dept
SET UNUSED(loc);

-- 9.
ALTER TABLE dept
DROP UNUSED COLUMNS;
