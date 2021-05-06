--10���� �����ؼ� 5�� �����ϴ� ������ ����
CREATE SEQUENCE seq_sample
START WITH 10
INCREMENT BY 5;

SELECT seq_sample.currval FROM dual;
SELECT seq_sample.nextval FROM dual;

ALTER SEQUENCE seq_sample
INCREMENT BY 2;

--------------------------------------------------
CREATE TABLE member(
    mNumber number,
    mId varchar2(20) NOT NULL,
    mPwd varchar2(20) NOT NULL,
    mName varchar2(20) NOT NULL,
    
    CONSTRAINT member_mId_uk UNIQUE(mId),
    CONSTRAINT member_mNumber_pk PRIMARY KEY(mNumber)
    
);
CREATE SEQUENCE seq_member;

SELECT * FROM member;

INSERT INTO member
VALUES(seq_member.nextval,'qwer','1234','ȫ�浿');
INSERT INTO member
VALUES(seq_member.nextval,'asdf','1234','Ȳ�浿');
INSERT INTO member
VALUES(seq_member.nextval,'zxcv','1234','��浿');
INSERT INTO member
VALUES(seq_member.nextval,'poiu','1234','�ڱ浿');
INSERT INTO member
VALUES(seq_member.nextval,'lkjh','1234','�̱浿');

ALTER SEQUENCE seq_member
NOCACHE;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('MEMBER');

CREATE INDEX idx_member_mName
ON member(mName);
--�ε��� �����ϴ� �ð��ҿ�, 10%������ �߰������ʿ�, �����ͺ����۾��� �������� ��������