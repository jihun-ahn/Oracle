DROP TABLE customer;
--not null - �� �� X
--unique - �ߺ� ������ X
--primary key - �⺻Ű�� �����ؾ��ϸ� null�� x, ���� ���̾�� �Ѵ�. notnull+unique ==>>������ ������Ѵ�. ���̺�� 1��
--foreign key - ������ ���̺� �ִ� ���϶��� ����
--check ���ǿ� �����Ҷ��� ����
--default �ƹ� ���� �Էµ��� �ʾ��� �� ������ �⺻�� ����
--���̺� �����Ҷ� ���������� ����ȵ�
--�⺻Ű�� ������ �� �����Ǿ����� ��� cascade�� ������ ������ �������
CREATE TABLE customer(
--                  CONSTRAINT ���̺��_�÷���_���������̸� ��������
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

--�������� ��ȸ
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

--�⺻Ű �߰�
ALTER TABLE stu_copy
ADD CONSTRAINT stu_copy_stuNo_pk PRIMARY KEY(stuNo);
ALTER TABLE reg_copy
ADD CONSTRAINT reg_copy_enrollid_pk PRIMARY KEY(enrollid);
--�ܷ�Ű �߰�
ALTER TABLE reg_copy
ADD CONSTRAINT reg_copy_stuNo_pk FOREIGN KEY(stuNo) REFERENCES stu_copy(stuNo);

--NOT NULL����
ALTER TABLE stu_copy
MODIFY major CONSTRAINT stu_copy_major_nn NOT NULL;

--�⺻Ű ����(CASCADE : ����� �ܷ� Ű ���� ����)
ALTER TABLE stu_copy
DROP PRIMARY KEY CASCADE;

--NOT NULL ����
ALTER TABLE stu_copy
DROP CONSTRAINT stu_copy_major_nn;
    --CONSTRAINT ���������� �̸�; 

--�������� Ȱ��ȭ ��Ȱ��ȭ
--disable CONSTRAINT ~~
--