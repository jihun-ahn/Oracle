SET SERVEROUTPUT ON;
--PL/SQL
BEGIN
    dbms_output.put_line('Hello World!');  -- ==sysout
END;


DECLARE
    score number(3) := 50;
    
BEGIN
    dbms_output.put_line('철수의 점수 : '||score);
END;


DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
BEGIN
    DBMS_OUTPUT.PUT_LINE('사원 번호                  사원이름');
    DBMS_OUTPUT.PUT_LINE('-----------------');
    
    SELECT eno, ename INTO v_eno, V_ename
    FROM employee
    WHERE ename='KING';
    
    DBMS_OUTPUT.PUT_LINE(v_eno||'                          '||v_ename);
    
END;



DECLARE
    annsal number :=0;
    v_salary employee.salary%type;
    v_commission employee.commission%type;
BEGIN
    SELECT salary ,commission INTO v_salary, v_commission
    FROM employee
    WHERE ename = 'SCOTT';
    
    IF v_commission is NULL THEN
        annsal := v_salary*12;
    ELSE
        annsal := v_salary*12+v_commission;
    END IF;
    DBMS_OUTPUT.PUT_LINE('연봉 : '||annsal);
END;
    
    
--SCOTT사원의 사원 번호와 소속된 부서명을 출력하세요
--부서명은 조건문으로 사용하되 부서번호가 10번이면 '총무부', 20번이면 '연구부', 30번이면 '관리부'
DECLARE
    v_eno employee.eno%type;
    v_ename employee.ename%type;
    v_dno employee.dno%type;
    v_dname varchar2(20);
BEGIN
    SELECT eno, dno, ename INTO v_eno, v_dno, v_ename
    FROM employee
    WHERE ename = 'SCOTT';
    
    IF v_dno = 10 THEN
        v_dname := '총무부';
    ELSIF v_dno = 20 THEN
        v_dname := '연구부';
    ELSIF v_dno = 30 THEN
        v_dname := '관리부';
    END IF;
    DBMS_OUTPUT.PUT_LINE('사원 번호       사원이름             부서명');
        DBMS_OUTPUT.PUT_LINE(v_eno||'              '||v_ename|| '               '||v_dno);
END;


DECLARE
    i number := 0;
    total number :=0;
BEGIN
    LOOP
         i := i + 1;
         total := total + i;
         EXIT WHEN i=10 ;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('합계: '||total);
END;

DECLARE
    v_i number :=0;
    v_sum number :=0;
BEGIN
    for v_i in 1..10 LOOP
        v_sum:=v_sum+v_i;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE('합계: '||v_sum);
END;

DECLARE
    v_i number :=0;
    v_sum number :=0;
BEGIN
    WHILE v_i <10 LOOP
        v_i:=v_i+1;
        v_sum:=v_sum+v_i;
        END LOOP;
     DBMS_OUTPUT.PUT_LINE('합계: '||v_sum);
END;

--5단 출력 반복문 작성
--1. LOOP / 2. FOR / 3. WHILE
--1. LOOP

DECLARE
    v_i number :=0;
    v_dan number :=5;
BEGIN
    LOOP
        v_i:=v_i+1;
         DBMS_OUTPUT.PUT_LINE(v_dan||'*'||v_i||'='||v_dan*v_i);
    EXIT WHEN v_i=9;
    END LOOP;    
END;

--2. FOR
DECLARE
    v_i number :=0;
    v_dan number :=5;
BEGIN
    FOR v_i IN 1..9 LOOP
         DBMS_OUTPUT.PUT_LINE(v_dan||'*'||v_i||'='||v_dan*v_i);
        END LOOP;    
END;

--3. WHILE
DECLARE
    v_i number :=0;
    v_dan number :=5;
BEGIN
    WHILE v_i <9 LOOP
        v_i:=v_i+1;
         DBMS_OUTPUT.PUT_LINE(v_dan||'*'||v_i||'='||v_dan*v_i);
        END LOOP;
    
END;



DECLARE
    v_dept department%rowtype; --튜플을 담기위한 변수
    v_sum number;
    CURSOR c_dept
    IS
    SELECT * FROM department; --1. 커서 선언

BEGIN
   dbms_output.put_line('부서번호       부서명                        지역명');
   dbms_output.put_line('------------------------');
   
   OPEN c_dept; --2. 커서오픈
    LOOP
        FETCH c_dept INTO v_dept; --커서의 내용을 하나씩 패치해서 가져온다
        EXIT WHEN c_dept%notfound;        
        dbms_output.put_line(v_dept.dno||'            '||v_dept.dname||'                    '||v_dept.loc);
    END LOOP;
    CLOSE c_dept;--4.커서 닫기

END;

------------------------------------------------
--향상된 for문처럼 커서도 for로 처리가능

DECLARE
    v_dept department%rowtype; --튜플을 담기위한 변수
    CURSOR c_dept
    IS SELECT * FROM department; --1. 커서 선언
BEGIN
   dbms_output.put_line('부서번호       부서명                        지역명');
   dbms_output.put_line('------------------------');
   FOR v_dept IN c_dept LOOP
         dbms_output.put_line(v_dept.dno||'            '||v_dept.dname||'                    '||v_dept.loc);
    END LOOP;
END;