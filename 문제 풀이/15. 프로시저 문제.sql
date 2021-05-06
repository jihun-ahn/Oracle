--1. 사원테이블에서 커미션이 NULL이 아닌 상태의 
--   사원 번호와 이름, 급여를기준으로 오름차순 정렬한 결과를 나타내는 저장 프로시저를 생성하세요.

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

--2. 저장 프로시저를 수정하여 커미션 컬럼을 하나 더 출력하고 이름을 기준으로 내림차순으로 정렬하세요.
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