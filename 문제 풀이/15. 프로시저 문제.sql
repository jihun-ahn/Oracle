--1. ������̺��� Ŀ�̼��� NULL�� �ƴ� ������ 
--   ��� ��ȣ�� �̸�, �޿����������� �������� ������ ����� ��Ÿ���� ���� ���ν����� �����ϼ���.

CREATE OR REPLACE PROCEDURE not_null_commission
IS
    v_eno employee.eno%TYPE;
    v_ename employee.ename%TYPE;
    v_salary employee.salary%TYPE;
BEGIN
    SELECT eno, ename, salary INTO v_eno, v_ename, v_salary
    FROM employee
    WHERE commission IS NOT NULL
    ORDER BY salary;
      
END;

--2. ���� ���ν����� �����Ͽ� Ŀ�̼� �÷��� �ϳ� �� ����ϰ� �̸��� �������� ������������ �����ϼ���.
CREATE OR REPLACE PROCEDURE not_null_commission
IS
    v_eno employee.eno%TYPE;
    v_ename employee.ename%TYPE;
    v_salary employee.salary%TYPE;
    v_commission employee.commission%TYPE;
BEGIN
    SELECT eno, ename, salary, commission INTO v_eno, v_ename, v_salary, v_commission
    FROM employee
    WHERE commission IS NOT NULL
    ORDER BY ename;
END;
SELECT * FROM user_source
WHERE name = 'NOT_NULL_COMMISSION';

DROP PROCEDURE not_null_commission;