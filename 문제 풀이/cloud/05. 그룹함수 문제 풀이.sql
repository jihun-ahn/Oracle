-- 그룹 함수 문제 풀이
SELECT * FROM employee;
-- 1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하세요. 
-- 칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균급여(Average)로지정하고
-- 평균에 대해서는 정수로 반올림하세요.
SELECT max(salary) AS "최고액", 
       min(salary) AS "최저액",
       sum(salary) AS "총액", 
       ROUND(avg(salary)) AS "평균"
FROM employee;

-- 2. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하세요. 
-- 칼럼의 명칭은최고액(Maximun), 최저액(Minimun), 총액(Sum), 평균급여(Average)로 지정하고 
-- 평균에 대해서는 정수로 반올림하세요
SELECT job AS "업무 유형",
       max(salary) AS "최고액", 
       min(salary) AS "최저액",
       sum(salary) AS "총액", 
       ROUND(avg(salary)) AS "평균"
FROM employee
GROUP BY job;

-- 3. Count(*)함수를 이용해서 담당업무가 동일한 사원의 수를 출력하세요
SELECT job, count(job)
FROM employee
GROUP BY job;

-- 4. 관리자의 수를 나열하세요. 칼럼의 별칭은 COUNT(MANAGER)로 출력하세요.
SELECT COUNT(DISTINCT(MANAGER)) AS "관리자 수" FROM employee;


-- 5. 급여 최고액, 급여 최저액의 차액을 출력하세요.
-- 칼럼의 별칭 DIFFERENCE로 지정하세요
SELECT max(salary)-min(salary) AS "DIFFERENCE"
FROM employee;


-- 6. 직급별 사원의 최저 급여를 출력하세요. 
-- 관리자를 알 수 없는 사원 및 최저 급여가 2000미만인 그룹은 제외시키고 
-- 급여에 대한 내림차순으로 정렬하여 출력하세요.
SELECT job,min(salary)
FROM employee
WHERE manager is not null
GROUP BY job
HAVING min(salary) >= 2000
ORDER BY min(salary) DESC;


-- 7. 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오, 
-- 칼럼의 별칭은 부서번호(DNO), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고 
-- 평균급여는 소수점 2째자리에서 반올림 하세요.
SELECT dno AS "부서번호", 
       count(*) AS "사원수", 
       ROUND(avg(salary),2) AS "부서의 평균 급여"
FROM employee
GROUP BY DNO;


-- 8. 각 부서에 대해 부서번호 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오. 
-- 컬럼의 별칭은 부서번호이름(DName), 지역명(Location), 
-- 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고 
-- 평균급여는 정수로 반올림하세요.
SELECT * FROM department;

SELECT dno,
        DECODE(dno,10,'ACCOUNTING',
                   20,'RESEARCH',
                   30,'SALES',
                   40,'OPERATIONS') AS "부서번호 이름",
        DECODE(dno,10,'NEW YORK',
                   20,'DALLAS',
                   30,'CHICAGO',
                   40,'BOSTON') AS "지역명",
        COUNT(*) AS "사원수",
        ROUND(avg(salary)) AS "평균 급여"
FROM employee
GROUP BY dno;

SELECT d.dno  AS "부서 번호",
       d.dname  AS "부서번호 이름",
       d.loc AS "지역명",
       COUNT(e.ename) AS "사원수",
       ROUND(avg(e.salary)) AS "평균 급여"
FROM employee e, department d
WHERE e.dno=d.dno
GROUP BY d.dno,d.dname,d.loc;

-- 9. 업무를 표시한 다음 해당 업무에 대해 부서번호별 급여 및 부서 10,20,30의 급여 총액을 각각 출력하시오.
-- 각 칼럼의 별칭은 각각 job, 부서10,부서20, 부서30, 총액으로 지정하세요.
SELECT job,dno,
    DECODE(dno,10,sum(salary)) AS "부서 10",
    DECODE(dno,20,sum(salary)) AS "부서 20",
    DECODE(dno,30,sum(salary)) AS "부서 30"
FROM employee
GROUP BY dno,ROLLUP(job)
ORDER BY dno;



















