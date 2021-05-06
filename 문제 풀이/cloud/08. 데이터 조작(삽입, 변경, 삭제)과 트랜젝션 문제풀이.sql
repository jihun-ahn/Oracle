-- 데이터 조작(삽입, 변경, 삭제)과 트랜젝션 문제풀이 
 -- 1. EMPLOYEE 테이블의 구조만 복사하여 EMP_INSERT란 빈 테이블을 만드세요. 
CREATE TABLE emp_insert
AS
SELECT * FROM employee WHERE 100=10;

SELECT * FROM emp_insert;

-- 2. 본인을 EMP_INSERT테이블에 추가하되 SYSDATE를 이용해서 입사일을 오늘로 입력하세요 

INSERT INTO emp_insert
VALUES (1,'jeong','teacher',100,sysdate,2000,null,10);

-- 3. EMP_INSERT 테이블에 옆사람을 추가하되 TO_DATE함수를 사용해서 입사일을 어제로 입력하세요, 
INSERT INTO emp_insert
VALUES (2,'park','staudet',1,TO_DATE(sysdate-1,'YYYY/MM/DD'),3000,500,10);

-- 4.  Employee테이블의 구조와 내용을 복사하여 EMP_COPY란 이름의 테이블을 만드세요. 
CREATE TABLE EMP_COPY
AS
SELECT * FROM employee;

SELECT * FROM emp_copy;

-- 5. 사원번호가 7788인 사원의 부서번호를 10으로 수정하세요. 
UPDATE emp_copy
SET dno=10
WHERE eno=7788;

-- 6. 사원번호가 7788의 담당업무 및 급여를 사원번호 7499의 담당 업무및 급여와 일치하도록 갱신하세요. 
UPDATE emp_copy
SET job = (SELECT job
            FROM emp_copy
            WHERE eno=7499),
    salary = (SELECT salary
            FROM emp_copy
            WHERE eno=7499)
WHERE eno=7788;

UPDATE emp_copy
SET (job,salary) = (SELECT job,salary
                    FROM emp_copy
                    WHERE eno=7499)
WHERE eno=7788;

-- 8. Department 테이블의 구조와 내용을 복사하여 DEPT_COPY란 이름의 테이블을 만드세요. 
CREATE TABLE dept_copy
AS
SELECT * FROM department;

SELECT * FROM dept_copy;

-- 9. DEPT_COPY테이블에서 부서명이 RESEARCH인 부서를 제거하세요. 
DELETE FROM dept_copy
WHERE dname='RESEARCH';

-- 10. DEPT_COPY테이블에서 부서번호가 10이거나 40인 부서를 제거하세요. 
DELETE FROM dept_copy
WHERE dno = 10 OR dno = 40;

DELETE FROM dept_copy
WHERE dno IN (10,40);

