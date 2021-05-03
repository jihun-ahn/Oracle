--1. Employee 테이블의 구조를 복사하여 EMP_SAMPLE란 이름의 테이블을 만드세요.
--   사원 테이블의 사원번호 칼럼에 테이블 레벨로 primary key 제약 조건을 지정하되 제약 조건 이름은 my_emp_pk 로 지정하세요.
CREATE TABLE emp_sample
AS SELECT * FROM employee
WHERE 0=1;

ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_pk PRIMARY KEY(eno);

--2. department 테이블의 구조를 복사하여 dept_sample 이란 테이블을 만드세요.
--   dept_sample의 부서번호 칼럼에 테이블 레벨로 primary key 제약 조건을 지정하되 제약 조건 이름은 my_dept_pk 로 지정하세요.
CREATE TABLE dept_sample
AS SELECT * FROM department
WHERE 0=1;

ALTER TABLE dept_sample
ADD CONSTRAINT my_dept_pk PRIMARY KEY(dno);

--3.사원 테이블의 부서번호 칼럼에 존재 하지않는 부서의 사원이 배정되지 않도록 외래키 제약조건을 지정하되 
--  제약조건 이름은 my_emp_dept_fk 로 지정하세요.
SELECT * FROM dept_sample;
ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY(dno) REFERENCES dept_sample(dno);

--4. 사원 테이블의 커미션 컬럼에 0보다 큰 값만을 입력할 수 있도록 제약조건을 지정하세요.
ALTER TABLE emp_sample
ADD CONSTRAINT my_emp_range CHECK(commission>0);