--1. 사원 테이블의 사원번호가 자동으로 생성 되도록 시퀀스를 생성하시오.
--   (시작값: 1, 증가값:1 최대값:100000)
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000;

--2. 사원번호를 시퀀스로부터 발급 받아서 오른쪽 테이블에 데이터를 입력하세요.
--1) 사원이름: Julia, 입사일: sysdate)
--2) 사원이름: Alice입사입: 2020/12/31
SELECT * FROM employee;

INSERT INTO employee
VALUES(EMP_SEQ.nextval,'Julia','','',sysdate,'','','');

INSERT INTO employee
VALUES(EMP_SEQ.nextval,'Alice','','','2020/12/31','','','');

--3. EMP01 테이블의 이름 칼럼을 인덱스로 설정하되 인덱스 이름을 IDX_EMP01_EName로 지정하세요.
CREATE TABLE emp01(
    empNo number(4),
    ename varchar2(10),
    hiredate date
);

CREATE INDEX IDX_EMP01_EName
ON emp01(ename);