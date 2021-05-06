--1. Employee ���̺��� ������ �����Ͽ� EMP_SAMPLE�� �̸��� ���̺��� ���弼��.
--   ��� ���̺��� �����ȣ Į���� ���̺� ������ primary key ���� ������ �����ϵ� ���� ���� �̸��� my_emp_pk �� �����ϼ���.
CREATE TABLE emp_sample
AS SELECT * FROM employee
WHERE 0=1;

ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno);

--2. department ���̺��� ������ �����Ͽ� dept_sample �̶� ���̺��� ���弼��.
--   dept_sample�� �μ���ȣ Į���� ���̺� ������ primary key ���� ������ �����ϵ� ���� ���� �̸��� my_dept_pk �� �����ϼ���.
CREATE TABLE dept_sample
AS SELECT * FROM department
WHERE 0=1;

ALTER TABLE dept_sample
ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno);

--3.��� ���̺��� �μ���ȣ Į���� ���� �����ʴ� �μ��� ����� �������� �ʵ��� �ܷ�Ű ���������� �����ϵ� 
--  �������� �̸��� my_emp_dept_fk �� �����ϼ���.
SELECT * FROM dept_sample;
ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY(dno) REFERENCES dept_sample(dno);

--4. ��� ���̺��� Ŀ�̼� �÷��� 0���� ū ������ �Է��� �� �ֵ��� ���������� �����ϼ���.
ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_range CHECK(commission>0);