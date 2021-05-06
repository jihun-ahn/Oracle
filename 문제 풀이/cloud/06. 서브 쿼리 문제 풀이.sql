-- 06 ���� ���� ����
-- 1. ��� ��ȣ�� 7788�� ����� �������� ���� ����� ǥ��(����̸��� ������)�ϼ���.
SELECT ename, job
FROM employee
WHERE job = (SELECT job
            FROM employee
            WHERE eno = 7788);
            
-- 2. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ������)�ϼ���
SELECT ename,job,salary
FROM employee
WHERE salary > (SELECT salary
                FROM employee
                WHERE eno = 7499);

-- 3. �ּ� �޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���ϼ���(�׷��Լ�)
SELECT ename,job,salary
FROM employee
WHERE salary = (SELECT min(salary)
                FROM employee);



-- 4. ��� �޿��� ���� ���� ������ ã�� ���ް� ��� �޿��� ǥ���ϼ���
SELECT job,avg(salary)
FROM employee
GROUP BY job
HAVING AVG(salary) = (SELECT MIN(avg(salary))
                        FROM employee
                        GROUP BY job);

-- 5. �� �μ��� �ּұ޿��� �޴� ��� �̸�,�޿�, �μ���ȣ��ǥ���ϼ���.
SELECT ename,salary, dno
FROM employee
WHERE salary = ANY (SELECT min(salary)
                FROM employee
                GROUP BY dno);
SELECT ename,salary, dno
FROM employee
WHERE salary IN (SELECT min(salary)
                FROM employee
                GROUP BY dno);

-- 6. �������� �м���(ANALYST)�� ������� �޿��� �����鼭 
-- ������ �м���(ANALYST)�ƴ� ���(�����ȣ, �̸�, ������,�޿�)���� ǥ���ϼ���.
SELECT eno, ename, job, salary
FROM employee
WHERE  salary < ANY(SELECT salary
                FROM employee
                WHERE job ='ANALYST')
AND job <> 'ANALYST';

SELECT * FROM employee;
INSERT INTO employee
VALUES ('8001','green','ANALYST',7788,sysdate,1000,null,20);
DELETE FROM employee WHERE eno=8001;

-- 7. �Ŵ��� ���� ����� �̸��� ǥ���ϼ���.
SELECT ename
FROM employee
WHERE eno = (SELECT eno
            FROM employee
            WHERE manager is null);
SELECT ename
FROM employee           
WHERE manager is null;

-- 8. �Ŵ��� �ִ� ����� �̸��� ǥ���ϼ���.
SELECT ename
FROM employee
WHERE eno IN(SELECT eno
            FROM employee
            WHERE manager is not null);
SELECT ename
FROM employee           
WHERE manager is not null;


-- 9. BLAKE�� ������ �μ��� ���� ����� �̸���  �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���.(�� BLAKE�� ����)
SELECT ename, hiredate, dno
FROM employee
WHERE dno = (SELECT dno
            FROM employee
            WHERE ename = 'BLAKE')
AND ename <> 'BLAKE';


-- 10. �޿��� ��պ��� ���� ������� �����ȣ�� �̸��� ǥ���ϵ�  ����� �޿��� ���� ������������ �����ϼ���.,
SELECT eno,ename
FROM employee
WHERE salary > (SELECT avg(salary)
                FROM employee)
ORDER BY salary ASC;

-- 11. �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϼ���.
SELECT eno,ename,dno
FROM employee
WHERE dno IN(SELECT dno
                FROM employee
                WHERE ename LIKE '%K%');


-- 12. �μ���ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� �������� ǥ���ϼ���.
SELECT ename,dno,job
FROM employee
WHERE dno = (SELECT dno
            FROM department
            WHERE loc = 'DALLAS');

SELECT e.ename, e.dno, e.job
FROM employee e, department d
WHERE e.dno = d.dno
AND d.loc = 'DALLAS';

SELECT * FROM employee;

--- 13. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���ϼ���
SELECT ename, salary
FROM employee
WHERE manager = (SELECT eno
                FROM employee
                WHERE ename='KING');

-- 14. RESEARCH �μ��� ����� ���� �μ���ȣ, �����ȣ �� �������� ����ϼ��� 
SELECT dno,eno,job
FROM employee
WHERE dno = (SELECT dno
            FROM department
            WHERE dname='RESEARCH');

-- 15. [��� �޿����� ���� �޿��� �ް�] [�̸����� M�� ���Ե� ����� 
-- ���� �μ�����] �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ����ϼ���. 
SELECT eno, ename, salary
FROM employee
WHERE salary > (SELECT avg(salary)
                FROM employee)
AND dno = ANY(SELECT dno
        FROM employee
        WHERE ename LIKE '%M%');

-- 16. ��ձ޿��� ���� ���� ������ ã������ 
SELECT job, avg(salary)
FROM employee
GROUP BY job
HAVING avg(salary) = (SELECT min(avg(salary))
                        FROM employee
                        GROUP BY job);

-- 17. ���������� ���� ����� �����ȣ�� �̸��� ����ϼ���. 
SELECT eno, ename
FROM employee
WHERE eno IN (SELECT manager
            FROM employee);
-------------------------------------------------------------












