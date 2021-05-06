-- �پ��� �Լ� ���� Ǯ��
SELECT * FROM employee;
-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����ϼ���.,
SELECT substr(hiredate,1,4) AS �⵵,
substr(hiredate,6,2) AS ��
FROM employee;

-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����ϼ���
SELECT *
FROM employee
WHERE substr(hiredate,6,2)='04';

--3. MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����ϼ���
SELECT * 
FROM employee
WHERE mod(eno,2)=0;

-- 4. �Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� �����Ͽ� ����ϼ���.
SELECT hiredate, TO_CHAR(hiredate,'YY/MM/DD DY')
FROM employee;


-- 5. ���� ��ĥ�� ������ �� ����ϼ���. 
-- ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ���� ��ġ��Ű�ÿ�.
SELECT ROUND(sysdate-TO_DATE('2021/01/01','YYYY/MM/DD'),1)
FROM dual;



-- 6. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL ��ſ� 0�� ����ϼ���.
SELECT eno, ename, NVL2(manager,manager,0) AS "��� ��ȣ"
FROM employee;



-- 7. DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �ϼ���.
-- ������'ANAIYST'�� ����� 200,
-- 'SALESMAN'�� ����� 180,
-- 'MANAGER'�� ����� 150, 
-- 'CLERK'�� ��� �� 100�� �λ��ϼ���.

SELECT eno, ename, job, salary,
    DECODE(job,'ANALYST',salary+200,
                 'SALESMAN',salary+180,
                 'MANAGER',salary+150,
                 'CLERK',salary+100,
                 salary) AS "�λ�� �޿�"
FROM employee;










