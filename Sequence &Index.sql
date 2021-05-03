--1. ��� ���̺��� �����ȣ�� �ڵ����� ���� �ǵ��� �������� �����Ͻÿ�.
--   (���۰�: 1, ������:1 �ִ밪:100000)
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;

--2. �����ȣ�� �������κ��� �߱� �޾Ƽ� ������ ���̺� �����͸� �Է��ϼ���.
--1) ����̸�: Julia, �Ի���: sysdate)
--2) ����̸�: Alice�Ի���: 2020/12/31
SELECT * FROM employee;

INSERT INTO employee
VALUES(EMP_SEQ.nextval,'Julia','','',sysdate,'','','');

INSERT INTO employee
VALUES(EMP_SEQ.nextval,'Alice','','','2020/12/31','','','');

--3. EMP01 ���̺��� �̸� Į���� �ε����� �����ϵ� �ε��� �̸��� IDX_EMP01_EName�� �����ϼ���.
CREATE TABLE emp01(
    empNo number(4),
    ename varchar2(10),
    hiredate date
);

CREATE INDEX IDX_EMP01_EName
ON emp01(ename);