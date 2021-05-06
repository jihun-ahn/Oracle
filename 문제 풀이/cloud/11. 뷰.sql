-- 11. 뷰
-- 1. 20번 부서에 소속된 사원의 사원번호와 이름, 
--부서번화를 출력하는 SELECT문을 하나의 뷰(v_em_dno) 로 정의하세요. 
CREATE OR REPLACE VIEW v_em_dno
AS 
SELECT eno, ename, dno
FROM employee
WHERE dno=20;

SELECT * FROM v_em_dno;

--2. 이미 생성된 뷰(v_em_dno)에 대해서 급여와 담당 업무 역시 출력할 수 있도록 수정하세요. 
CREATE OR REPLACE VIEW v_em_dno
AS 
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno=20;

SELECT * FROM v_em_dno;

-- 3. 담당업무 별로 최대급여, 최소급여, 급여 총액을 보여주는 뷰(EMP_group_job)를 생성한뒤  조회를 해본다.  
CREATE OR REPLACE VIEW emp_group_job ("담당 업무","최대 급여","최소 급여","급여 총액")
AS
SELECT job, MAX(salary), MIN(salary), SUM(salary)
FROM employee
GROUP BY job;

SELECT * FROM emp_group_job;

--4. 이미 생성된 뷰(v_em_dno)를 통해서 접근가능한 데이터만 입력가능하도록 제약을 걸어 본다 
CREATE OR REPLACE VIEW v_em_dno
AS 
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno=20 WITH CHECK OPTION;

SELECT * FROM v_em_dno;

--5.  이미 생성된 뷰(v_em_dno)에 대해서 다음 주어진 데이터를 입력해본다. 
--eno    ename   dno   salary   job
--5100   Belita   10    1500    CLERK
--5200   Erica    20    2300    ANALYST
--5300   Kali     30    1750    SALESMAN
--5400   Mia      20    950     ANALYST
--5500   Zinna    10    1050    CLERK

INSERT INTO v_em_dno
VALUES(5100,'Belita',10,1500,'CLERK');

INSERT INTO v_em_dno
VALUES(5200,'Erica',20,2300,'ANALYST');

INSERT INTO v_em_dno
VALUES(5300,'Kali',30,1750,'SALESMAN');

INSERT INTO v_em_dno
VALUES(5400,'Mia',20,950,'ANALYST');

INSERT INTO v_em_dno
VALUES(5500,'Zinna',10,1050,'CLERK');

SELECT * FROM employee;

SELECT * FROM v_em_dno;

SELECT * FROM emp_group_job;

