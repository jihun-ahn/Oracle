-- 11. ��
-- 1. 20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸�, 
--�μ���ȭ�� ����ϴ� SELECT���� �ϳ��� ��(v_em_dno) �� �����ϼ���. 
CREATE OR REPLACE VIEW v_em_dno
AS 
SELECT eno, ename, dno
FROM employee
WHERE dno=20;

SELECT * FROM v_em_dno;

--2. �̹� ������ ��(v_em_dno)�� ���ؼ� �޿��� ��� ���� ���� ����� �� �ֵ��� �����ϼ���. 
CREATE OR REPLACE VIEW v_em_dno
AS 
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno=20;

SELECT * FROM v_em_dno;

-- 3. ������ ���� �ִ�޿�, �ּұ޿�, �޿� �Ѿ��� �����ִ� ��(EMP_group_job)�� �����ѵ�  ��ȸ�� �غ���.  
CREATE OR REPLACE VIEW emp_group_job ("��� ����","�ִ� �޿�","�ּ� �޿�","�޿� �Ѿ�")
AS
SELECT job, MAX(salary), MIN(salary), SUM(salary)
FROM employee
GROUP BY job;

SELECT * FROM emp_group_job;

--4. �̹� ������ ��(v_em_dno)�� ���ؼ� ���ٰ����� �����͸� �Է°����ϵ��� ������ �ɾ� ���� 
CREATE OR REPLACE VIEW v_em_dno
AS 
SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno=20 WITH CHECK OPTION;

SELECT * FROM v_em_dno;

--5.  �̹� ������ ��(v_em_dno)�� ���ؼ� ���� �־��� �����͸� �Է��غ���. 
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

