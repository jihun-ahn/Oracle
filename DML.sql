DROP TABLE emp_copy;
SELECT * FROM emp_insert;

--1. Employee ���̺��� ������ �����Ͽ� EMP_INSERT�� �� ���̺��� ���弼��.
CREATE TABLE emp_insert
AS SELECT * FROM employee
WHERE 0=1;

--2. ������ EMP_INSERT���̺� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ���
INSERT INTO emp_insert
VALUES(8010, 'JIHUN', 'STUDENT', NULL, sysdate, 40, NULL, 40);
--3. EMP_INSERT ���̺� ������� �߰��ϵ� TO_DATE�Լ��� ����ؼ� �Ի����� ������ �Է��ϼ���
INSERT INTO emp_insert
VALUES(8011, 'JUNG', 'TEACHER', NULL, sysdate-1, 1000, NULL, 40);
--4. Employee���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ���弼��.
CREATE TABLE emp_copy
AS SELECT * 
FROM employee;

SELECT * FROM emp_copy
ORDER BY salary;
--5. �����ȣ�� 7788�� ����� �μ���ȣ�� 10���� �����ϼ���.
UPDATE emp_copy 
SET dno=10
WHERE eno=7788;

--6. �����ȣ�� 7788�� ������ �� �޿��� �����ȣ 7499�� ������ �� �޿��� ��ġ�ϵ��� �����ϼ���.
UPDATE emp_copy
SET job = (SELECT job FROM emp_copy WHERE eno=7499),
    salary = (SELECT salary FROM emp_copy WHERE eno=7499)
WHERE eno=7788;

--7. �����ȣ 7369�� ������ ������ ������� �μ���ȣ�� ��� 7369�� ���� �μ���ȣ�� �����ϼ���.
UPDATE emp_copy
SET dno = (SELECT dno
            FROM emp_copy
            WHERE eno=7369)
WHERE job = (SELECT job
                FROM emp_copy
                WHERE eno=7369);
SELECT * FROM emp_copy;

--8. Department ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺��� ���弼��.
CREATE TABLE dept_copy
AS SELECT * FROM department;

--9. DEPT_COPY ���̺��� �μ����� RESEARCH�� �μ��� �����ϼ���.
SELECT * FROM dept_copy;

DELETE FROM dept_copy
WHERE dname='RESEARCH';

--10. DEPT_COPY ���̺��� �μ���ȣ�� 10�̰ų� 40�� �μ��� �����ϼ���.
DELETE FROM dept_copy
WHERE dno=10 OR dno=40;