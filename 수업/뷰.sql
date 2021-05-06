--ºä
SELECT * FROM employee;

CREATE VIEW emp_second
AS SELECT * FROM employee;

SELECT * FROM emp_second;

CREATE VIEW emp_gad
AS SELECT eno, ename, salary, commission FROM employee;

SELECT * FROM emp_gad;

CREATE OR REPLACE VIEW v_emp_complex
AS
SELECT *
FROM employee NATURAL JOIN department;

SELECT view_name, text 
FROM user_views;

CREATE TABLE member3(
    mNum number(2) PRIMARY KEY,
    mId varchar2(10) NOT NULL,
    mPwd varchar2(10) NOT NULL
);
INSERT INTO member3
VALUES(1, 'qwer', '1234');
CREATE OR REPLACE VIEW v_member
AS
SELECT mId FROM member3;

CREATE OR REPLACE FORCE VIEW emp_notable
AS SELECT eno, ename, dno, job
FROM emp_notable
WHERE job = 'MANAGER';

SELECT * FROM emp_notable;


CREATE OR REPLACE VIEW emp_job_chk
AS SELECT eno, ename, dno, job
FROM employee
WHERE job = 'MANAGER' WITH CHECK OPTION;

SELECT * FROM emp_job_chk;

INSERT INTO emp_job_chk
VALUES(8002, 'BILL', 10, 'PRESIDENT');


CREATE OR REPLACE VIEW emp_job_readonly
AS SELECT eno, ename, dno, job
FROM employee
WHERE job = 'MANAGER' WITH READ ONLY;

INSERT INTO emp_job_readonly
VALUES(8005, 'lisa su', 20, 'MANAGER');