-- 12 �������� �ε���
-- ���̺� ���� ����ô�.
--�Ʒ�ǥ������ؼ����̺������弼��.-
--���̺��(emp01)
--�÷���     �ڷ���      ũ��
--empno     number     4
--ename     varchar2   10
--hiredate  date

CREATE TABLE emp01(
    empno number(4),
    ename varchar2(10),
    hiredate date
);
SELECT * FROM emp01;

--1. ��� ���̺��� �����ȣ�� �ڵ����� �����ǵ��� �������� �����Ͻÿ�. 
--(���۰�: 1, ������:1 �ִ밪:100000)
CREATE SEQUENCE emp_seq
   START WITH 1
   INCREMENT BY 1
   MAXVALUE 100000;



-- 2. �����ȣ�� �������κ��� �߱޹޾Ƽ� ������ ���̺� �����͸� �Է��ϼ���.
-- 1)����̸�: Julia, �Ի���: sysdate
-- 2)����̸�: Alice�Ի���: 2020/12/31

INSERT INTO emp01
VALUES (emp_seq.nextval,'Julia',sysdate);
INSERT INTO emp01
VALUES (emp_seq.nextval,'Alice',TO_DATE('2020/12/31','YYYY/MM/DD'));

SELECT * FROM emp01;

-- EMP01 ���̺��� �̸� Į���� �ε����� �����ϵ� �ε��� �̸��� idx_emp01_ename�� �����ϼ���.
CREATE INDEX idx_emp01_ename
ON emp01(ename);

-- �ε��� Ȯ�ι�
SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('EMP01');



