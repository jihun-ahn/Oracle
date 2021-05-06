--1. 20�� �μ��� �Ҽӵ� ����� �����ȣ�� �̸�, �μ� ��ȣ�� ����ϴ� SELECT���� �ϳ��� ��(v_em_dno) �� �����ϼ���.
CREATE VIEW v_em_dno
AS SELECT eno, ename, dno
FROM employee
WHERE dno=20;

SELECT * FROM v_em_dno;
--2. �̹� ������ ��(v_em_dno)�� ���ؼ� �޿��� ������ ���� ����� �� �ֵ��� �����ϼ���.
CREATE OR REPLACE VIEW v_em_dno
AS SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno=20; 

--3. ������ ���� �ִ�޿�, �ּұ޿�, �޿� �Ѿ��� �����ִ� ��(EMP_group_job)�� ������ ���� ��ȸ �غ���.
CREATE OR REPLACE VIEW emp_group_job
AS SELECT job, MAX(salary) "�ִ� �޿�", MIN(salary) "�ּ� �޿�", SUM(salary) "�޿� �Ѿ�"
FROM employee
GROUP BY job;

SELECT * FROM emp_group_job;

--4. �̹� ������ ��(v_em_dno)�� ���ؼ� ���ٰ����� �����͸� �Է°����ϵ��� ������ �ɾ� ����.
CREATE OR REPLACE VIEW emp_group_job
AS SELECT job, MAX(salary) "�ִ� �޿�", MIN(salary) "�ּ� �޿�", SUM(salary) "�޿� �Ѿ�"
FROM employee
GROUP BY job
WITH CHECK OPTION;


--5. ���� �����͸� �� (v_em_dno) �� ���ؼ� �Է��� �� �� ��(EMP_group_job)�� ���ؼ� ��ȸ �غ���.

INSERT INTO v_em_dno
VALUES(5100, 'Belita', 10 ,1500 ,'CLERK');
INSERT INTO v_em_dno
VALUES(5200, 'Erica', 20, 2300, 'ANALYST');
INSERT INTO v_em_dno
VALUES(5300, 'Kali', 30, 1750, 'SALESMAN');
INSERT INTO v_em_dno
VALUES(5400, 'Mia', 20, 950, 'ANALYST');
INSERT INTO v_em_dno
VALUES(5500, 'Zinna', 10, 1050, 'CLERK');

SELECT * FROM emp_group_job;

--6. �̹� ������ ��(v_em_dno)�� ���ؼ� �б� ���� �Ӽ��� �ο��غ���
CREATE OR REPLACE VIEW v_em_dno
AS SELECT eno, ename, dno, salary, job
FROM employee
WHERE dno=20 WITH READ ONLY;

--7. ���, ����̸�, �μ���ȣ�� �μ� �̸��� �����ִ� �並 (emp_dept) �����ϼ���.
CREATE OR REPLACE VIEW emp_dept
AS SELECT eno, ename, dno, job
FROM employee;

--8. ������ ��� �並 ��ȸ�ϼ���.
SELECT view_name, text 
FROM user_views;


--9. ������ ��(v_em_dno,emp_group_job,emp_dept)�� �����ϼ���
DROP VIEW v_em_dno;
DROP VIEW emp_group_job;
DROP VIEW emp_dept;

SELECT * FROM employee;





