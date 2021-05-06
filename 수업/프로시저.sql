SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE kingsjob
IS
    v_job employee.job%type;
BEGIN
    SELECT job INTO v_job
    FROM employee
    WHERE ename = 'KING';
    
    dbms_output.put_line('KING의 업무는 : '||v_job);
END;

EXECUTE kingsjob;

SELECT * FROM user_source
WHERE name=upper('kingsjob');

--IN 매개변수
--이름을 입력받아서 급여를 출력하는 프로시저

CREATE OR REPLACE PROCEDURE name_to_salary(
v_ename IN employee.ename%type)
IS
    v_salary employee.salary%type;
    
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE ename=v_ename;
    
    dbms_output.put_line(v_ename||'의 급여는 : '||v_salary);
END;

EXECUTE name_to_salary('KING');
EXECUTE name_to_salary('SCOTT');

--OUT 매개변수
--이름을 입력받아서 급여를 프로시저 밖으로 꺼내는 프로시저를 만들어봅시다.
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

--INOUT 매개변수
--사원 이름을 입력받아서 상사의 이름을 출력하는 프로시저를 만들어봅시다.
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
    dbms_output.put_line(v_ename||'의 상사 이름 : '||v_manager);
END;

EXECUTE test2;

--함수
--특정 사람의 이름을 입력받아서 급여를 반환하는 함수를 만들어봅시다.
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

SELECT ename, f_ename_to_salary('ADAMS') AS "급여"
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
--삽입 트리거
CREATE OR REPLACE TRIGGER trigger_insert_sample1
    AFTER INSERT
    ON dept_origin
    for each row
BEGIN
    IF inserting THEN
        dbms_output.put_line('트리거 발생');
        INSERT INTO dept_copy
        VALUES(:new.dno, :new.dname, :new.loc,'삽입');
        
    --ELSIF deleting THEN
    --    ~~
    END IF;
END;

INSERT INTO dept_origin
VALUES(10, '총무부', '서울시');

ALTER TABLE dept_copy
add modType nchar(2);


SELECT * FROM dept_copy;

--변경,삭제트리거
CREATE OR REPLACE TRIGGER trigger_UD_sample
    AFTER UPDATE OR DELETE
    ON dept_origin
    FOR EACH ROW
DECLARE
    v_modType nchar(2);
BEGIN
    IF updating THEN
        dbms_output.put_line('업데이트 트리거 발생');
        v_modType:= '수정';
    ELSIF deleting THEN
        dbms_output.put_line('삭제 트리거 발생');
        v_modType:= '삭제';
    END IF;
    
    INSERT INTO dept_copy
    VALUES(:old.dno, :old.dname, :old.loc,v_modType);
END;

UPDATE dept_origin
SET dno=20, dname='인사부',loc='수원시'
WHERE dno=10;

SELECT * FROM dept_origin;
SELECT * FROM dept_copy;