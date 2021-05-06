SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE kingsjob
IS
    v_job employee.job%type;
BEGIN
    SELECT job INTO v_job
    FROM employee
    WHERE ename = 'KING';
    
    dbms_output.put_line('KING�� ������ : '||v_job);
END;

EXECUTE kingsjob;

SELECT * FROM user_source
WHERE name=upper('kingsjob');

--IN �Ű�����
--�̸��� �Է¹޾Ƽ� �޿��� ����ϴ� ���ν���

CREATE OR REPLACE PROCEDURE name_to_salary(
v_ename IN employee.ename%type)
IS
    v_salary employee.salary%type;
    
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename=v_ename;
    
    dbms_output.put_line(v_ename||'�� �޿��� : '||v_salary);
END;

EXECUTE name_to_salary('KING');
EXECUTE name_to_salary('SCOTT');

--OUT �Ű�����
--�̸��� �Է¹޾Ƽ� �޿��� ���ν��� ������ ������ ���ν����� �����ô�.
CREATE OR REPLACE PROCEDURE name_to_salary2(
    v_ename IN employee.ename%type,
    v_salary OUT employee.salary%type)
IS
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename=v_ename;
END;
VARIABLE v_salary number;
EXECUTE name_to_salary2('SCOTT', :v_salary);
PRINT v_salary;

--INOUT �Ű�����
--��� �̸��� �Է¹޾Ƽ� ����� �̸��� ����ϴ� ���ν����� �����ô�.
CREATE OR REPLACE PROCEDURE ename_to_manager(
    v_ename IN OUT employee.ename%TYPE)
IS
BEGIN
    SELECT ename INTO v_ename
    FROM employee
    WHERE eno = (SELECT manager
                    FROM employee
                    WHERE ename = v_ename);
END;

DESC employee;
VARIABLE v_ename varchar2(10);
EXECUTE ename_to_manager(:v_ename);
PRINT v_ename;

CREATE OR REPLACE PROCEDURE test2
IS
    v_ename employee.ename%TYPE;
    v_manager employee.ename%TYPE;
BEGIN
    v_ename:='ADAMS';
    v_manager:=ename_to_manager(v_ename);
    dbms_output.put_line(v_ename||'�� ��� �̸� : '||v_manager);
END;

EXECUTE test2;

--�Լ�
--Ư�� ����� �̸��� �Է¹޾Ƽ� �޿��� ��ȯ�ϴ� �Լ��� �����ô�.
CREATE OR REPLACE FUNCTION f_ename_to_salary(
    v_ename IN employee.ename%TYPE
)
    RETURN number
IS
    v_salary number;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename = v_ename;
    
    RETURN v_salary;
END;

VARIABLE v_salary2 number;
EXECUTE :v_salary2:=f_ename_to_salary('ADAMS');
PRINT v_salary2;
SELECT * FROM employee;

SELECT ename, f_ename_to_salary('ADAMS') AS "�޿�"
FROM employee
WHERE ename = 'ADAMS';

CREATE TABLE dept_origin
AS
SELECT * FROM department
WHERE 0=1;
DROP TABLE dept_copy;
CREATE TABLE dept_copy
AS
SELECT * FROM department
WHERE 0=1;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;
--���� Ʈ����
CREATE OR REPLACE TRIGGER trigger_insert_sample1
    AFTER INSERT
    ON dept_origin
    for each row
BEGIN
    IF inserting THEN
        dbms_output.put_line('Ʈ���� �߻�');
        INSERT INTO dept_copy
        VALUES(:new.dno, :new.dname, :new.loc,'����');
        
    --ELSIF deleting THEN
    --    ~~
    END IF;
END;

INSERT INTO dept_origin
VALUES(10, '�ѹ���', '�����');

ALTER TABLE dept_copy
add modType nchar(2);


SELECT * FROM dept_copy;

--����,����Ʈ����
CREATE OR REPLACE TRIGGER trigger_UD_sample
    AFTER UPDATE OR DELETE
    ON dept_origin
    FOR EACH ROW
DECLARE
    v_modType nchar(2);
BEGIN
    IF updating THEN
        dbms_output.put_line('������Ʈ Ʈ���� �߻�');
        v_modType:= '����';
    ELSIF deleting THEN
        dbms_output.put_line('���� Ʈ���� �߻�');
        v_modType:= '����';
    END IF;
    
    INSERT INTO dept_copy
    VALUES(:old.dno, :old.dname, :old.loc,v_modType);
END;

UPDATE dept_origin
SET dno=20, dname='�λ��',loc='������'
WHERE dno=10;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;