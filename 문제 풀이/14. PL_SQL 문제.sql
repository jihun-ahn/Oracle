--1. IF���� ����Ͽ� KING ����� �μ���ȣ�� ���ͼ� �μ���ȣ�� ���ͼ� �μ� ��ȣ�� ���� �μ����� ����ϼ���.
DECLARE
    v_dno number :=0;
    v_dname department.dname%type;
BEGIN
    SELECT dno INTO v_dno
    FROM employee
    WHERE ename = 'KING';
    
    
    IF v_dno = 10 THEN
        v_dname := '';
    END IF;    
END;

--2. BASIC LOOP������ 1���� 10������ �ڿ����� ���� ���Ͽ� ����ϼ���.
DECLARE
    v_i number:=0;
    v_sum number:=0;
BEGIN
    LOOP
        v_i := v_i + 1;
        v_sum := v_sum + v_i;
    EXIT WHEN v_i>9;
    END LOOP;
    
    dbms_output.put_line('1���� 10���� �ڿ����� �� : '||v_sum);
END;

--3. FOR LOOP������ 1���� 10������ �ڿ����� ���� ���Ͽ� ����ϼ���.
DECLARE
    v_i number:=0;
    v_sum number:=0;
BEGIN
    FOR v_i IN 1..10 LOOP
        v_sum := v_sum + v_i;
    END LOOP;
    dbms_output.put_line('1���� 10���� �ڿ����� �� : '||v_sum);
END;

--4. WHILE LOOP������ 1���� 10������ �ڿ����� ���� ���Ͽ� ����ϼ���.
DECLARE
    v_i number:=0;
    v_sum number:=0;
BEGIN
    WHILE v_i <10 LOOP
        v_i := v_i + 1;
        v_sum := v_sum + v_i;
    END LOOP;
    dbms_output.put_line('1���� 10���� �ڿ����� �� : '||v_sum);
END;

--5. ��� ���̺��� Ŀ�̼��� NULL�ƴ� ������ �����ȣ, �̸�, �޿��� �̸� �������� ������������ ������ ����� ����ϼ���.
SELECT eno, ename, salary 
FROM employee
WHERE commission IS NOT NULL
ORDER BY ename ASC;

--6. ������ ���� ���̺�(Student)�� ����� �����͸� �Է��Ѵ�.
CREATE TABLE student(
    sid number PRIMARY KEY,
    sname nvarchar2(5) NOT NULL,
    kscore number(3) CHECK(kscore>=0 AND kscore<=100),
    escore number(3) CHECK(escore>=0 AND escore<=100),
    mscore number(3) CHECK(mscore>=0 AND mscore<=100)
);
DESC student;

CREATE SEQUENCE seq_stu_id;
DROP TABLE student;
INSERT INTO student
VALUES(seq_stu_id.nextval, '��浿', 78, 64, 82);
INSERT INTO student
VALUES(seq_stu_id.nextval, '��浿', 85, 71, 64);
INSERT INTO student
VALUES(seq_stu_id.nextval, '�⵿̱', 74, 69, 57);
INSERT INTO student
VALUES(seq_stu_id.nextval, '�ڱ浿', 74, 77, 95);
INSERT INTO student
VALUES(seq_stu_id.nextval, 'ȫ�浿', 68, 95, 84);

SELECT * FROM student;

DECLARE
    v_stu student%rowtype;
    CURSOR c_stu
    IS SELECT * FROM student;
    v_sum number;
    v_avg number(5);
BEGIN
    dbms_output.put_line('�л� �̸�           ����                ���');
    dbms_output.put_line('---------------------');
    
    FOR v_stu IN c_stu LOOP
    v_sum := v_stu.kscore+v_stu.escore+v_stu.mscore;
    v_avg := v_sum/3;
    dbms_output.put_line(v_stu.sname||'               '||v_sum||'                 '||v_avg);
    END LOOP;
    
    
    v_sum:=0;
    FOR v_stu IN c_stu LOOP
    v_sum := v_sum + v_stu.kscore;
    END LOOP;
    v_avg := v_sum/seq_stu_id.currval;
    
    
    dbms_output.put_line('���� ����        ���� ���');
    dbms_output.put_line('---------------------');
    dbms_output.put_line(v_sum||'                '||v_avg);
    dbms_output.put_line('---------------------');
    
    v_sum:=0;
    FOR v_stu IN c_stu LOOP
    v_sum := v_sum + v_stu.escore;
    END LOOP;
    v_avg := v_sum/seq_stu_id.currval;
    
    
    dbms_output.put_line('���� ����         ���� ���');
    dbms_output.put_line('---------------------');
    dbms_output.put_line(v_sum||'                '||v_avg);
    dbms_output.put_line('---------------------');
    v_sum:=0;
    FOR v_stu IN c_stu LOOP
    v_sum := v_sum + v_stu.mscore;
    END LOOP;
    v_avg := v_sum/seq_stu_id.currval;
    
    
    dbms_output.put_line('���� ����        ���� ���');
    dbms_output.put_line('---------------------');
    dbms_output.put_line(v_sum||'               '||v_avg);
    dbms_output.put_line('---------------------');
END;

