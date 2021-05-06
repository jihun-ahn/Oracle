--1.다음표에명시된대로DEPT 테이블을생성하세요.
CREATE TABLE dept(
    DNO number(2),
    DNAME varchar2(14),
    LOC varchar2(13)
);
--2. 다음 표에 명시된대로 EMP 테이블을 생성하세요.
CREATE TABLE emp(
    ENO number(4),
    ENAME varchar2(10),
    DNO Number(2)
);

--3. 긴 이름을 저장할 수 있도록 EMP 테이블을 수정하세요.(ENAME칼럼)
SELECT * FROM emp;
ALTER TABLE emp 
MODIFY ename varchar2(25);

desc emp;

--4. EMPLOYEE 테이블을 복사해서 EMPLOYEE2란 이름의 테이블을 생성하되 사원번호, 이름, 급여, 부서번호 칼럼만 복사하고 
--   새로생성된칼럼명을각각EMP_ID, NAME, SAL, DEPT_ID로지정하세요.
CREATE TABLE employee2
AS SELECT eno "EMP_ID", ename "NAME", salary "SAL", dno "DEPT_ID"
FROM employee;

--같은 결과
CREATE TABLE employee2
(
    EMP_ID,
    NAME,
    SAL,
    DEPT_ID
)AS
SELECT eno, ename, salary, dno
FROM employee;


SELECT * FROM employee2;

--5. ** EMP 테이블을삭제하세요 **
DROP TABLE emp CASCADE CONSTRAINTS;

--6. EMPLOYEE2테이블의이름을EMP로변경하세요
RENAME employee2 TO emp;

--7. DEPT 테이블에서DNAME 칼럼을제거하세요
ALTER TABLE dept
DROP COLUMN dname;

--8. DEPT 테이블에서LOC칼럼을UNUSED로표시하세요.
ALTER TABLE dept
SET UNUSED(loc);

--9. UNUSED 칼럼을모두제거하세요.
ALTER TABLE dept
DROP UNUSED COLUMNS;

DESC dept;
SELECT * FROM dept;