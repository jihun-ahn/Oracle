--1.����ǥ����õȴ��DEPT ���̺��������ϼ���.
CREATE TABLE dept(
    DNO number(2),
    DNAME varchar2(14),
    LOC varchar2(13)
);
--2. ���� ǥ�� ��õȴ�� EMP ���̺��� �����ϼ���.
CREATE TABLE emp(
    ENO number(4),
    ENAME varchar2(10),
    DNO Number(2)
);

--3. �� �̸��� ������ �� �ֵ��� EMP ���̺��� �����ϼ���.(ENAMEĮ��)
SELECT * FROM emp;
ALTER TABLE emp 
MODIFY ename varchar2(25);

desc emp;

--4. EMPLOYEE ���̺��� �����ؼ� EMPLOYEE2�� �̸��� ���̺��� �����ϵ� �����ȣ, �̸�, �޿�, �μ���ȣ Į���� �����ϰ� 
--   ���λ�����Į����������EMP_ID, NAME, SAL, DEPT_ID�������ϼ���.
CREATE TABLE employee2
AS SELECT eno "EMP_ID", ename "NAME", salary "SAL", dno "DEPT_ID"
FROM employee;

--���� ���
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

--5. ** EMP ���̺��������ϼ��� **
DROP TABLE emp CASCADE CONSTRAINTS;

--6. EMPLOYEE2���̺����̸���EMP�κ����ϼ���
RENAME employee2 TO emp;

--7. DEPT ���̺���DNAME Į���������ϼ���
ALTER TABLE dept
DROP COLUMN dname;

--8. DEPT ���̺���LOCĮ����UNUSED��ǥ���ϼ���.
ALTER TABLE dept
SET UNUSED(loc);

--9. UNUSED Į������������ϼ���.
ALTER TABLE dept
DROP UNUSED COLUMNS;

DESC dept;
SELECT * FROM dept;