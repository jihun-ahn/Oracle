-- 12 시퀀스와 인덱스
-- 테이블 부터 만듭시다.
--아래표를사용해서테이블을만드세요.-
--테이블명(emp01)
--컬럼명     자료형      크기
--empno     number     4
--ename     varchar2   10
--hiredate  date

CREATE TABLE emp01(
    empno number(4),
    ename varchar2(10),
    hiredate date
);
SELECT * FROM emp01;

--1. 사원 테이블의 사원번호가 자동으로 생성되도록 시퀀스를 생성하시오. 
--(시작값: 1, 증가값:1 최대값:100000)
CREATE SEQUENCE emp_seq
   START WITH 1
   INCREMENT BY 1
   MAXVALUE 100000;



-- 2. 사원번호를 시퀀스로부터 발급받아서 오른쪽 테이블에 데이터를 입력하세요.
-- 1)사원이름: Julia, 입사일: sysdate
-- 2)사원이름: Alice입사입: 2020/12/31

INSERT INTO emp01
VALUES (emp_seq.nextval,'Julia',sysdate);
INSERT INTO emp01
VALUES (emp_seq.nextval,'Alice',TO_DATE('2020/12/31','YYYY/MM/DD'));

SELECT * FROM emp01;

-- EMP01 테이블의 이름 칼럼을 인덱스로 설정하되 인덱스 이름을 idx_emp01_ename로 지정하세요.
CREATE INDEX idx_emp01_ename
ON emp01(ename);

-- 인덱스 확인법
SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('EMP01');



