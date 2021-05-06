-- ������ ����(����, ����, ����)�� Ʈ������ ����Ǯ�� 
 -- 1. EMPLOYEE ���̺��� ������ �����Ͽ� EMP_INSERT�� �� ���̺��� ���弼��. 
CREATE TABLE emp_insert
AS
SELECT * FROM employee WHERE 100=10;

SELECT * FROM emp_insert;

-- 2. ������ EMP_INSERT���̺� �߰��ϵ� SYSDATE�� �̿��ؼ� �Ի����� ���÷� �Է��ϼ��� 

INSERT INTO emp_insert
VALUES (1,'jeong','teacher',100,sysdate,2000,null,10);

-- 3. EMP_INSERT ���̺� ������� �߰��ϵ� TO_DATE�Լ��� ����ؼ� �Ի����� ������ �Է��ϼ���, 
INSERT INTO emp_insert
VALUES (2,'park','staudet',1,TO_DATE(sysdate-1,'YYYY/MM/DD'),3000,500,10);

-- 4.  Employee���̺��� ������ ������ �����Ͽ� EMP_COPY�� �̸��� ���̺��� ���弼��. 
CREATE TABLE EMP_COPY
AS
SELECT * FROM employee;

SELECT * FROM emp_copy;

-- 5. �����ȣ�� 7788�� ����� �μ���ȣ�� 10���� �����ϼ���. 
UPDATE emp_copy
SET dno=10
WHERE eno=7788;

-- 6. �����ȣ�� 7788�� ������ �� �޿��� �����ȣ 7499�� ��� ������ �޿��� ��ġ�ϵ��� �����ϼ���. 
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

-- 8. Department ���̺��� ������ ������ �����Ͽ� DEPT_COPY�� �̸��� ���̺��� ���弼��. 
CREATE TABLE dept_copy
AS
SELECT * FROM department;

SELECT * FROM dept_copy;

-- 9. DEPT_COPY���̺��� �μ����� RESEARCH�� �μ��� �����ϼ���. 
DELETE FROM dept_copy
WHERE dname='RESEARCH';

-- 10. DEPT_COPY���̺��� �μ���ȣ�� 10�̰ų� 40�� �μ��� �����ϼ���. 
DELETE FROM dept_copy
WHERE dno = 10 OR dno = 40;

DELETE FROM dept_copy
WHERE dno IN (10,40);

