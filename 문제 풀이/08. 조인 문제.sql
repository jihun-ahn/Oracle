--1. Equi조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하세요.
SELECT ename, e.dno, d.dname
FROM employee e, department d
WHERE e.dno = d.dno AND e.ename = 'SCOTT';

--2. Inner 조인과 on연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하세요.
SELECT ename, dname, loc
FROM employee e INNER JOIN department d
ON e.dno = d.dno
ORDER BY d.loc;

--3. INNER 조인 Using 연산자를 사용하여 10번 부서에 속하는 모든 담당업무의 고유 목록을 부서의지역명을 포함하여 출력하세요.
SELECT e.job, d.loc
FROM employee e JOIN department d
USING(dno)
WHERE dno=10;

--4. Natural조인을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하세요
SELECT ename, dname, loc
FROM employee e NATURAL JOIN department d
WHERE commission IS NOT NULL;
--5. Equal 조인과 Wild카드를 사용해서 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하세요,
SELECT e.ename, d.dname
FROM employee e, department d
WHERE e.dno=d.dno AND ename LIKE '%A%';

--6. Natural 조인을 사용하여 NEW York에 근무하는 모든 사원의 이름, 업무 부서번호 및 부서명을 출력하세요.
SELECT ename, dno, dname
FROM employee e NATURAL JOIN department d
WHERE loc='NEW YORK';

--7. Self Join을 사용하여 사원의 이름 및 사원 번호를 관리자 이름 및 관리자 번호와 함께 출력하세요.
--각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)
SELECT e.ename AS "사원이름", e.eno AS "사원번호", e2.ename AS "관리자이름", e2.eno AS "관리자번호"
FROM employee e, employee e2
WHERE e.manager = e2.eno;

--8. Outter 조인 self 조인을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하세요.
--각 열의 별칭은 사원이름(Employee) 사원번호(emp#) 관리자이름(Manager) 관리자번호(Mgr#)
SELECT e.ename AS "사원이름", e.eno AS "사원번호", e2.ename AS "관리자이름", e2.eno AS "관리자번호"
FROM employee e, employee e2
WHERE e.manager = e2.eno(+) --null이 생기는쪽으로 +놓기
ORDER BY e.eno DESC;

SELECT e.ename AS "사원이름", e.eno AS "사원번호", e2.ename AS "관리자이름", e2.eno AS "관리자번호"
FROM employee e LEFT OUTER JOIN employee e2
ON e.manager = e2.eno
ORDER BY e.eno DESC;

--9. Self조인을 사용하여 지정한 사원(SCOTT)의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하세요 
--각 열의 별칭은 이름, 부서번호, 동료로 지정하세요
SELECT e.ename AS "이름", e.dno AS "부서번호", e2.ename AS "동료"
FROM employee e, employee e2
WHERE e.dno=e2.dno 
AND e.ename = 'SCOTT'
AND e2.ename<>'SCOTT';

--10. Self 조인을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하세요.
SELECT other.ename, other.hiredate
FROM employee me, employee other
WHERE  me.hiredate < other.hiredate
AND me.ename = 'WARD'
ORDER BY other.hiredate;
--11. Self조인을 사용하여관리자보다먼저 입사한모든 사원의 이름 및 입사일을관리자의이름 및입사입과함께 출력하세요.
--    각 열의 별칭은 사원이름(Ename) 사원입사일(HIERDATE) 관리자 이름(Ename) 관리자 입사입(HIERDATE)로 출력하세요.
SELECT emp.ename "사원 이름", emp.hiredate "입사일", man.ename "관리자 이름", man.hiredate "관리자 입사일"
FROM employee emp, employee man
WHERE emp.manager = man.eno
AND emp.hiredate < man.hiredate;
