--�����Լ�
SELECT * FROM employee;
--#1 SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����ϼ���.
SELECT SUBSTR(hiredate, 1, 4), substr(hiredate, 6, 2) FROM employee;
--#2 SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ���������ϼ���. 
--SUBSTR(���ڿ�, ������ġ, ����) ������ġ���� ���̸�ŭ ���ڿ��� ��ȯ
SELECT ename, hiredate FROM employee WHERE SUBSTR(hiredate, 6, 2)=04;
--#3 MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����ϼ���.
--(MOD(����1, ����2) ����1�� ����2�� ���� ������)
SELECT ename, eno FROM employee WHERE MOD(eno,2)=0;
--#4 �Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� �����Ͽ� ����ϼ���.??
SELECT hiredate, to_char(hiredate, 'YY/MM/DD DY') FROM employee;
--���� ��ĥ�� �������� ����ϼ���. ���� ��¥���� ���� 1��1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ���� ��ġ��Ű�ÿ�.
SELECT sysdate-to_date('2021/01/01') FROM dual;
--#6 ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL ��ſ� 0�� ����ϼ���.    NVL(��, ��ü��) ���� null�̸� ��ü ������
SELECT NVL(manager, 0) FROM employee;
--#7 DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �ϼ���. ������ 'ANAIYST'�� ����� 200,'SALESMAN'�� ����� 180, 'MANAGER'�� �����150,'CLERK'�� ����� 100�� �λ��ϼ���.
SELECT ename, job, salary, DECODE(job, 'ANALYST', salary+200,
                                                                     'SALESMAN', salary+180,
                                                                     'MANAGER', salary+150,
                                                                     'CLERK', salary+100)
FROM employee;
                                                                    
-----------------------------------------------------------
--�׷��Լ�
SELECT * FROM employee;
--#1 ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��ձ޿��� ����ϼ���. 
--Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ� ��տ����ؼ��� ������ �ݿø� �ϼ���.
SELECT MAX(salary) "�ְ��(Maximun)", MIN(salary)"������(Minimun)", SUM(salary) "�Ѿ�(Sum)", ROUND(AVG(salary)) "��� �޿�(Average)" FROM employee;

--#2 �� ������ �������� �޿� �ְ��, ������, ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��� �޿�(Average)�� �����ϰ� ��տ� ���ؼ��� ������ �ݿø� �ϼ���.
SELECT job, MAX(salary) "�ְ��(Maximun)", MIN(salary)"������(Minimun)", SUM(salary) "�Ѿ�(Sum)", ROUND(AVG(salary)) "��� �޿�(Average)" FROM employee GROUP BY job;

--#3 Count(*)�Լ��� �̿��ؼ� �������� ������ ����� ���� ����ϼ���
SELECT job, COUNT(*) FROM employee GROUP BY job;

--#4 �������� ���� �����ϼ���. Į���� ��Ī��COUNT(MANAGER)�� ����ϼ���.
SELECT COUNT(DISTINCT(manager)) AS "������ ��" FROM employee;

--#5 �޿� �ְ��, �޿� �������� ������ ����ϼ���.Į���� ��Ī DIFFERENCE�� �����ϼ���
SELECT MAX(salary)-MIN(salary) "DIFFERENCE" FROM employee;

--#6 ���޺� ����� ���� �޿��� ����ϼ���. �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000�̸��� �׷��� ���ܽ�Ű�� �޿��� ���� ������������ �����Ͽ� ����ϼ���.
SELECT job, MIN(salary) FROM employee WHERE manager IS NOT NULL GROUP BY job HAVING NOT(MIN(salary)<2000) ORDER BY MIN(salary) DESC;

--#7 �� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�, 
--Į���� ��Ī�� �μ���ȣ(DNO), �����(Number of PeoPle), ��� �޿�(Salary)�� �����ϰ� ��ձ޿��� �Ҽ��� 2° �ڸ����� �ݿø� �ϼ���.

SELECT dno "�μ���ȣ(DNO)", COUNT(*) "�����(Number of PeoPle)", ROUND(AVG(salary), 1) "��� �޿�(Salary)" FROM employee GROUP BY dno;

--#8 �� �μ��� ���� �μ���ȣ �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�.
--Į���� ��Ī�� �μ���ȣ�̸�(DName), ������(Location), �����(Number of PeoPle), ��ձ޿�(Salary)�� �����ϰ� ��ձ޿��� ������ �ݿø��ϼ���.
SELECT dno, 
               DECODE(dno, 10, 'ACCOUNTING',
                                       20, 'RESEARCH',
                                       30, 'SALES',
                                       40, 'OPERATIONS') AS "�μ���ȣ �̸�",
               DECODE(dno, 10, 'NEW YORK',
                                       20, 'DALLAS',
                                       30, 'CHICAGO',
                                       40, 'BOSTON') AS "������",
               count(*) "�����(Number of PeoPle)",
               ROUND(AVG(salary)) "��ձ޿�(Salary)"
FROM employee
GROUP BY dno
ORDER BY dno;
--����
SELECT e.dno,
               d.dname AS "�μ���ȣ �̸�",
               d.loc AS"������",
               count(e.ename) "�����(Number of PeoPle)",
               ROUND(AVG(e.salary)) "��ձ޿�(Salary)"
FROM employee e, department d
WHERE e.dno=d.dno
GROUP BY e.dno, d.dname, d.loc;


--#9 ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �޿� �� �μ� 10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�.
-- �� Į���� ��Ī�� ���� job, �μ�10,�μ�20,�μ�30, �Ѿ����� �����ϼ���.
SELECT job, dno, DECODE(dno, 10, sum(salary)) "�μ�10",
                               DECODE(dno, 20, sum(salary)) "�μ�20",
                               DECODE(dno, 30, sum(salary)) "�μ�30",
                               SUM(salary) "�Ѿ�"
FROM employee
GROUP BY dno, ROLLUP(job)
ORDER BY dno, job;