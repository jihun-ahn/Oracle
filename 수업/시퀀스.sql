--10부터 시작해서 5씩 증가하는 시퀀스 생성
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
VALUES(seq_member.nextval,'qwer','1234','홍길동');
INSERT INTO member
VALUES(seq_member.nextval,'asdf','1234','황길동');
INSERT INTO member
VALUES(seq_member.nextval,'zxcv','1234','고길동');
INSERT INTO member
VALUES(seq_member.nextval,'poiu','1234','박길동');
INSERT INTO member
VALUES(seq_member.nextval,'lkjh','1234','이길동');

ALTER SEQUENCE seq_member
NOCACHE;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN('MEMBER');

CREATE INDEX idx_member_mName
ON member(mName);
--인덱스 생성하는 시간소요, 10%정도의 추가공간필요, 데이터변경작업이 많을수록 성능저하