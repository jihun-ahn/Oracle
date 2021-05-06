SELECT * FROM employee;
INSERT INTO employee (eno, ename, job, manager, hiredate, salary, commission, dno)
VALUES(8001, 'ALICE', 'CLERK', 7788, sysdate, 1200, null, 10);

INSERT INTO employee
VALUES (8002, 'KATHERINE', 'SALESMAN', 7698, sysdate, 1750, 800, 30);

DESC employee;

INSERT INTO employee
VALUES (8003);

INSERT INTO employee (eno, ename, job)
VALUES (8004, 'Charles', null) ;

INSERT INTO employee (eno, ename, job)
VALUES (8005, 'GABE', ' ');

INSERT INTO employee (eno, hiredate)
VALUES (8006, '20030121');

INSERT INTO employee (eno, hiredate)
VALUES (8007, to_date('20050214', 'YYYY/MM/DD'));

INSERT INTO employee (eno, hiredate)
VALUES (8008, '20050214');

drop table emp2;
CREATE TABLE emp2
AS SELECT * FROM employee;

INSERT INTO emp2
SELECT * FROM employee;

SELECT * FROM emp2;

INSERT INTO emp2(eno, ename)
SELECT eno, ename FROM employee;

CREATE TABLE emp3
AS SELECT * FROM employee WHERE 4=7;

SELECT * FROM emp3;

CREATE TABLE emp4
AS SELECT * FROM employee;

SELECT * FROM emp4;

UPDATE emp4
SET ename='RUNA', job='MANAGER' WHERE eno=8003;

UPDATE emp4
SET salary ;


DROP table emp4;

COMMIT;

--이름이 없는 사원의 소속을 OPERATIONS로 옮기고 PRESIDENT의 직속 부하 직원으로 배치해 봅시다.
UPDATE emp4
SET dno = (SELECT dno
                    FROM department
                    WHERE dname = 'OPERATIONS'),
MANAGER = (SELECT eno
                        FROM emp4
                        WHERE job='PRESIDENT')
WHERE ename is null;

-----------------------------------------
CREATE TABLE emp5
AS SELECT * FROM employee;

SELECT * FROM emp5;

DELETE FROM emp5;

DROP TABLE emp5;

DELETE FROM emp5 WHERE ename='ALICE';

DELETE FROM emp5 WHERE dno=(SELECT dno 
                                                            FROM department 
                                                            WHERE dname = 'RESEARCH');
                                                            
------------------------------------------------

CREATE TABLE depart2
AS SELECT * FROM department;

SELECT * FROM depart2;

DELETE FROM depart2 WHERE dno=10;

COMMIT;
ROLLBACK;

--------------------------------------------
CREATE TABLE dept2(
        dno NUMBER(2),
        dname VARCHAR2(14), 
        loc VARCHAR2(13)
);

DESC dept2;

SELECT * FROM dept2;

CREATE TABLE dept3
AS SELECT * FROM department;

SELECT * FROM dept3;

CREATE TABLE dept4
AS SELECT eno, ename, salary, salary*12 AS "ani_sal"
FROM employee
WHERE dno=20;

SELECT * FROM dept4;

ALTER TABLE dept4
ADD (birth date);

DESC emp04;

ALTER TABLE dept4
MODIFY ename varchar2(30);

ALTER TABLE dept4
RENAME COLUMN ename TO studentName;

ALTER TABLE dept4
DROP COLUMN birth;

RENAME dept4 TO emp04;

DROP TABLE emp04;

select * from dept3;

SELECT * FROM emp04;

TRUNCATE TABLE dept3;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

SELECT OWNER, TABLE_NAME FROM DBA_TABLES;