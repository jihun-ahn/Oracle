-- �׷� �Լ� ���� Ǯ��
SELECT * FROM employee;
-- 1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����ϼ���. 
-- Į���� ��Ī�� �ְ��(Maximun) ������(Minimun), �Ѿ�(Sum), ��ձ޿�(Average)�������ϰ�
-- ��տ� ���ؼ��� ������ �ݿø��ϼ���.
SELECT max(salary) AS "�ְ��", 
       min(salary) AS "������",
       sum(salary) AS "�Ѿ�", 
       ROUND(avg(salary)) AS "���"
FROM employee;

-- 2. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����ϼ���. 
-- Į���� ��Ī���ְ��(Maximun), ������(Minimun), �Ѿ�(Sum), ��ձ޿�(Average)�� �����ϰ� 
-- ��տ� ���ؼ��� ������ �ݿø��ϼ���
SELECT job AS "���� ����",
       max(salary) AS "�ְ��", 
       min(salary) AS "������",
       sum(salary) AS "�Ѿ�", 
       ROUND(avg(salary)) AS "���"
FROM employee
GROUP BY job;

-- 3. Count(*)�Լ��� �̿��ؼ� �������� ������ ����� ���� ����ϼ���
SELECT job, count(job)
FROM employee
GROUP BY job;

-- 4. �������� ���� �����ϼ���. Į���� ��Ī�� COUNT(MANAGER)�� ����ϼ���.
SELECT COUNT(DISTINCT(MANAGER)) AS "������ ��" FROM employee;


-- 5. �޿� �ְ��, �޿� �������� ������ ����ϼ���.
-- Į���� ��Ī DIFFERENCE�� �����ϼ���
SELECT max(salary)-min(salary) AS "DIFFERENCE"
FROM employee;


-- 6. ���޺� ����� ���� �޿��� ����ϼ���. 
-- �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000�̸��� �׷��� ���ܽ�Ű�� 
-- �޿��� ���� ������������ �����Ͽ� ����ϼ���.
SELECT job,min(salary)
FROM employee
WHERE manager is not null
GROUP BY job
HAVING min(salary) >= 2000
ORDER BY min(salary) DESC;


-- 7. �� �μ��� ���� �μ���ȣ, �����, �μ����� ��� ����� ��ձ޿��� ����Ͻÿ�, 
-- Į���� ��Ī�� �μ���ȣ(DNO), �����(Number of PeoPle), ��ձ޿�(Salary)�� �����ϰ� 
-- ��ձ޿��� �Ҽ��� 2°�ڸ����� �ݿø� �ϼ���.
SELECT dno AS "�μ���ȣ", 
       count(*) AS "�����", 
       ROUND(avg(salary),2) AS "�μ��� ��� �޿�"
FROM employee
GROUP BY DNO;


-- 8. �� �μ��� ���� �μ���ȣ �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�. 
-- �÷��� ��Ī�� �μ���ȣ�̸�(DName), ������(Location), 
-- �����(Number of PeoPle), ��ձ޿�(Salary)�� �����ϰ� 
-- ��ձ޿��� ������ �ݿø��ϼ���.
SELECT * FROM department;

SELECT dno,
        DECODE(dno,10,'ACCOUNTING',
                   20,'RESEARCH',
                   30,'SALES',
                   40,'OPERATIONS') AS "�μ���ȣ �̸�",
        DECODE(dno,10,'NEW YORK',
                   20,'DALLAS',
                   30,'CHICAGO',
                   40,'BOSTON') AS "������",
        COUNT(*) AS "�����",
        ROUND(avg(salary)) AS "��� �޿�"
FROM employee
GROUP BY dno;

SELECT d.dno  AS "�μ� ��ȣ",
       d.dname  AS "�μ���ȣ �̸�",
       d.loc AS "������",
       COUNT(e.ename) AS "�����",
       ROUND(avg(e.salary)) AS "��� �޿�"
FROM employee e, department d
WHERE e.dno=d.dno
GROUP BY d.dno,d.dname,d.loc;

-- 9. ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �޿� �� �μ� 10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�.
-- �� Į���� ��Ī�� ���� job, �μ�10,�μ�20, �μ�30, �Ѿ����� �����ϼ���.
SELECT job,dno,
    DECODE(dno,10,sum(salary)) AS "�μ� 10",
    DECODE(dno,20,sum(salary)) AS "�μ� 20",
    DECODE(dno,30,sum(salary)) AS "�μ� 30"
FROM employee
GROUP BY dno,ROLLUP(job)
ORDER BY dno;



















