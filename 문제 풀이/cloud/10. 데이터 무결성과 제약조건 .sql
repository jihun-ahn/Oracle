-- ������ ���Ἲ�� ��������
-- 1. Employee���̺��� ������ �����Ͽ� EMP_SAMPLE�� �̸��� ���̺��� ���弼��  
-- ������̺��� ��� ��ȣĮ���� ���̺� ������ primary key ���������� �����ϵ� ���������̸��� my_emp_pk�� �����ϼ���.
CREATE TABLE EMP_SAMPLE
AS
SELECT * FROM employee WHERE 10=11;

SELECT * FROM emp_sample;

ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno);

SELECT table_name,constraint_name,status
FROM SYS.user_constraints
WHERE table_name IN('EMP_SAMPLE');

--2.department ���̺��� ������ �����Ͽ� dept_sample�̶� ���̺��� ���弼��.
-- dept_sample�� �μ���ȣ Į���� primarykey���������� �����ϵ� �������� �̸��� my_dept_pk �� �����ϼ���.
CREATE TABLE dept_sample
AS
SELECT * FROM department WHERE 10=21;

SELECT * FROM dept_sample;

ALTER TABLE dept_sample
ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno);

SELECT table_name,constraint_name,status
FROM SYS.user_constraints
WHERE table_name IN('DEPT_SAMPLE');

--3. ��� ���̺��� �μ���ȣ Į���� �������� �ʴ� �μ��� ����� �������� �ʵ��� 
-- �ܷ�Ű ���������� �����ϵ� ���������̸��� my_emp_dept_fk �� �����ϼ���. 
ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY(dno) REFERENCES dept_sample(dno);

--4. ������̺��� Ŀ�̼� �÷��� 0���� ū ������ �Է��� �� �ֵ��� ���������� �����ϼ��� 
ALTER TABLE emp_sample
ADD CONSTRAINT emp_commission_min CHECK(commission>0);





