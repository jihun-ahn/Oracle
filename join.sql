--1. Equi������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ��̸��� ����ϼ���.
SELECT e.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno AND e.ename = 'SCOTT';

--2. Inner ���ΰ� on�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����ϼ���.
SELECT ename, dname, loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno;

--3. INNER ���� Using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� �������� ���� ����� �μ����������� �����Ͽ� ����ϼ���.
SELECT e.job, d.loc
FROM employee e JOIN department d
USING(dno)
WHERE dno=10;

--4. Natural������ ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����ϼ���
SELECT ename, dname, loc
FROM employee e NATURAL JOIN department d
WHERE commission IS NOT NULL;

--5. Equal ���ΰ� Wildī�带 ����ؼ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����ϼ���,
SELECT e.ename, d.dname
FROM employee e, department d
WHERE e.dno=d.dno AND ename LIKE '%A%';

--6. Natural ������ ����Ͽ� NEW York�� �ٹ��ϴ� ��� ����� �̸�, ���� �μ���ȣ �� �μ����� ����ϼ���.
SELECT ename, dno, dname
FROM employee e NATURAL JOIN department d
WHERE loc<>'NEW YORK';

--7. Self Join�� ����Ͽ� ����� �̸� �� ��� ��ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����ϼ���.
--�� ���� ��Ī�� ����̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#)
SELECT e.ename AS "Employee", e.eno AS "emp#", e2.ename AS "Manager", e2.eno AS "Mgr#"
FROM employee e, employee e2
WHERE e.manager = e2.eno;

--8. Outter ���� self ������ ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� Ŭ���ϼ���.
--�� ���� ��Ī�� ����̸�(Employee) �����ȣ(emp#) �������̸�(Manager) �����ڹ�ȣ(Mgr#)
SELECT e.ename AS "Employee", e.eno AS "emp#", e2.ename AS "Manager", e2.eno AS "Mgr#"
FROM employee e LEFT OUTER JOIN employee e2
ON e.manager = e2.eno(+)
ORDER BY e.eno DESC;

--9. Self������ ����Ͽ� ������ ���(SCOTT)�� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����ϼ��� 
--�� ���� ��Ī�� �̸�, �μ���ȣ, ����� �����ϼ���
SELECT e.ename AS "�̸�", e.dno AS "�μ���ȣ", e2.ename AS "����"
FROM employee e, employee e2
WHERE e.dno=e2.dno AND e.ename = 'SCOTT';

--10. Self ������ ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����ϼ���.
SELECT ename, hiredate
FROM employee
WHERE  hiredate < (SELECT hiredate
                                                                                    FROM employee
                                                                                    WHERE ename = 'WARD');