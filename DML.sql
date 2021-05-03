DROP TABLE emp_copy;
SELECT * FROM emp_insert;

--1. Employee 테이블의 구조만 복사하여 EMP_INSERT란 빈 테이블을 만드세요.
CREATE TABLE emp_insert
AS SELECT * FROM employee
WHERE 0=1;

--2. 본인을 EMP_INSERT테이블에 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하세요
INSERT INTO emp_insert
VALUES(8010, 'JIHUN', 'STUDENT', NULL, sysdate, 40, NULL, 40);
--3. EMP_INSERT 테이블에 옆사람을 추가하되 TO_DATE함수를 사용해서 입사일을 어제로 입력하세요
INSERT INTO emp_insert
VALUES(8011, 'JUNG', 'TEACHER', NULL, sysdate-1, 1000, NULL, 40);
--4. Employee테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드세요.
CREATE TABLE emp_copy
AS SELECT * 
FROM employee;

SELECT * FROM emp_copy
ORDER BY salary;
--5. 사원번호가 7788인 사원의 부서번호를 10으로 수정하세요.
UPDATE emp_copy 
SET dno=10
WHERE eno=7788;

--6. 사원번호가 7788의 담당업무 및 급여를 사원번호 7499의 담당업무 및 급여와 일치하도록 갱신하세요.
UPDATE emp_copy
SET job = (SELECT job FROM emp_copy WHERE eno=7499),
    salary = (SELECT salary FROM emp_copy WHERE eno=7499)
WHERE eno=7788;

--7. 사원번호 7369와 업무가 동일한 모든사원의 부서번호를 사원 7369의 현재 부서번호로 갱신하세요.
UPDATE emp_copy
SET dno = (SELECT dno
            FROM emp_copy
            WHERE eno=7369)
WHERE job = (SELECT job
                FROM emp_copy
                WHERE eno=7369);
SELECT * FROM emp_copy;

--8. Department 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드세요.
CREATE TABLE dept_copy
AS SELECT * FROM department;

--9. DEPT_COPY 테이블에서 부서명이 RESEARCH인 부서를 제거하세요.
SELECT * FROM dept_copy;

DELETE FROM dept_copy
WHERE dname='RESEARCH';

--10. DEPT_COPY 테이블에서 부서번호가 10이거나 40인 부서를 제거하세요.
DELETE FROM dept_copy
WHERE dno=10 OR dno=40;