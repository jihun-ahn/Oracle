DROP TABLE customer;
--not null - 널 값 X
--unique - 중복 데이터 X
--primary key - 기본키가 존재해야하며 null값 x, 고유 값이어야 한다. notnull+unique ==>>정보가 없어야한다. 테이블당 1개
--foreign key - 참조할 테이블에 있는 값일때만 저장
--check 조건에 부합할때만 저장
--default 아무 값도 입력되지 않았을 때 저장할 기본값 지정
--테이블 복사할때 제약조건은 복사안됨
--기본키를 삭제할 때 참조되어있을 경우 cascade로 연결을 강제로 끊어야함
CREATE TABLE customer(
--                  CONSTRAINT 테이블명_컬럼명_제약조건이름 제약조건
    id varchar2(20),
    pwd varchar2(20) CONSTRAINT customer_pwd_nn NOT NULL,
    name varchar2(20) CONSTRAINT customer_name_nn NOT NULL,
    jumsu number(3) CONSTRAINT customer_jumsu_range CHECK(0<=jumsu AND 100>=jumsu),
    CONSTRAINT customer_id_pk PRIMARY KEY(id)
);

SELECT * FROM customer;

INSERT INTO customer VALUES ('asdf','1234','park', 75);
INSERT INTO customer VALUES ('qwer','5678','kim', 123);
INSERT INTO customer VALUES ('zxcv','1598','hong', -65);

--제약조건 조회
SELECT table_name, constraint_name
FROM SYS.user_constraints
WHERE table_name IN('CUSTOMER');
-------------------------------------------------------
DROP TABLE student;
DROP TABLE registration;
CREATE TABLE student(
    stuNo varchar2(20),
    name varchar2(20) CONSTRAINT student_name_nn NOT NULL,
    major varchar2(20),
    
    CONSTRAINT student_id_pk PRIMARY KEY(stuNo)
);

CREATE TABLE registration(
    enrollid varchar2(20) CONSTRAINT reg_enrollid_pk PRIMARY KEY,
    stuNo varchar2(20),
    subject varchar2(20) CONSTRAINT reg_subject_nn NOT NULL,
    
    CONSTRAINT reg_stuNo_fk FOREIGN KEY(stuNo) REFERENCES student(stuNo)
);

INSERT INTO student
VALUES('S01','ko','Math');
INSERT INTO student
VALUES('S02','hong','Physics');
INSERT INTO student
VALUES('S03','Lisa su','Computer Science');

SELECT * FROM student;

INSERT INTO registration
VALUES('E01','S01','Algorithm');
INSERT INTO registration
VALUES('E02','S03','Linear Algebra');
INSERT INTO registration
VALUES('E03','S05','Constitutional Law');

SELECT * FROM registration;

-------------------------------------------
CREATE TABLE stu_copy
AS
SELECT * FROM student;

SELECT * FROM stu_copy;

CREATE TABLE reg_copy
AS
SELECT * FROM registration;

SELECT * FROM reg_copy;

SELECT table_name, constraint_name
FROM SYS.user_constraints
WHERE table_name IN('STU_COPY');

--기본키 추가
ALTER TABLE stu_copy
ADD CONSTRAINT stu_copy_stuNo_pk PRIMARY KEY(stuNo);
ALTER TABLE reg_copy
ADD CONSTRAINT reg_copy_enrollid_pk PRIMARY KEY(enrollid);
--외래키 추가
ALTER TABLE reg_copy
ADD CONSTRAINT reg_copy_stuNo_pk FOREIGN KEY(stuNo) REFERENCES stu_copy(stuNo);

--NOT NULL변경
ALTER TABLE stu_copy
MODIFY major CONSTRAINT stu_copy_major_nn NOT NULL;

--기본키 제거(CASCADE : 연결된 외래 키 까지 삭제)
ALTER TABLE stu_copy
DROP PRIMARY KEY CASCADE;

--NOT NULL 제거
ALTER TABLE stu_copy
DROP CONSTRAINT stu_copy_major_nn;
    --CONSTRAINT 제약조건의 이름; 

--제약조건 활성화 비활성화
--disable CONSTRAINT ~~
--