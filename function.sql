--내장함수
SELECT * FROM employee;
--#1 SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하세요.
SELECT SUBSTR(hiredate, 1, 4), substr(hiredate, 6, 2) FROM employee;
--#2 SUBSTR 함수를 사용하여 4월에 입사한 사원을출력하세요. 
--SUBSTR(문자열, 시작위치, 길이) 시작위치에서 길이만큼 문자열을 반환
SELECT ename, hiredate FROM employee WHERE SUBSTR(hiredate, 6, 2)=04;
--#3 MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하세요.
--(MOD(숫자1, 숫자2) 숫자1을 숫자2로 나눈 나머지)
SELECT ename, eno FROM employee WHERE MOD(eno,2)=0;
--#4 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 지정하여 출력하세요.??
SELECT hiredate, to_char(hiredate, 'YY/MM/DD DY') FROM employee;
--올해 며칠이 지났는지 출력하세요. 현재 날짜에서 올해 1월1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치시키시오.
SELECT sysdate-to_date('2021/01/01') FROM dual;
--#6 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 대신에 0을 출력하세요.    NVL(값, 대체값) 값이 null이면 대체 값으로
SELECT NVL(manager, 0) FROM employee;
--#7 DECODE 함수로 직급에 따라 급여를 인상하도록 하세요. 직급이 'ANAIYST'인 사원은 200,'SALESMAN'인 사원은 180, 'MANAGER'인 사원은150,'CLERK'인 사원은 100을 인상하세요.
SELECT ename, job, salary, DECODE(job, 'ANALYST', salary+200,
                                                                     'SALESMAN', salary+180,
                                                                     'MANAGER', salary+150,
                                                                     'CLERK', salary+100)
FROM employee;
                                                                    
-----------------------------------------------------------
--그룹함수
SELECT * FROM employee;
--#1 모든 사원의 급여 최고액, 최저액, 총액 및 평균급여를 출력하세요. 
--칼럼의 명칭은 최고액(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고 평균에대해서는 정수로 반올림 하세요.
SELECT MAX(salary) "최고액(Maximun)", MIN(salary)"최저액(Minimun)", SUM(salary) "총액(Sum)", ROUND(AVG(salary)) "평균 급여(Average)" FROM employee;

--#2 각 담당업무 유형별로 급여 최고액, 최저액, 총(Maximun) 최저액(Minimun), 총액(Sum), 평균 급여(Average)로 지정하고 평균에 대해서는 정수로 반올림 하세요.
SELECT job, MAX(salary) "최고액(Maximun)", MIN(salary)"최저액(Minimun)", SUM(salary) "총액(Sum)", ROUND(AVG(salary)) "평균 급여(Average)" FROM employee GROUP BY job;

--#3 Count(*)함수를 이용해서 담당업무가 동일한 사원의 수를 출력하세요
SELECT job, COUNT(*) FROM employee GROUP BY job;

--#4 관리자의 수를 나열하세요. 칼럼의 별칭은COUNT(MANAGER)로 출력하세요.
SELECT COUNT(DISTINCT(manager)) AS "관리자 수" FROM employee;

--#5 급여 최고액, 급여 최저액의 차액을 출력하세요.칼럼의 별칭 DIFFERENCE로 지정하세요
SELECT MAX(salary)-MIN(salary) "DIFFERENCE" FROM employee;

--#6 직급별 사원의 최저 급여를 출력하세요. 관리자를 알 수 없는 사원 및 최저 급여가 2000미만인 그룹은 제외시키고 급여에 대한 내림차순으로 정렬하여 출력하세요.
SELECT job, MIN(salary) FROM employee WHERE manager IS NOT NULL GROUP BY job HAVING NOT(MIN(salary)<2000) ORDER BY MIN(salary) DESC;

--#7 각 부서에 대해 부서번호, 사원수, 부서내의 모든 사원의 평균급여를 출력하시오, 
--칼럼의 별칭은 부서번호(DNO), 사원수(Number of PeoPle), 평균 급여(Salary)로 지정하고 평균급여는 소수점 2째 자리에서 반올림 하세요.

SELECT dno "부서번호(DNO)", COUNT(*) "사원수(Number of PeoPle)", ROUND(AVG(salary), 1) "평균 급여(Salary)" FROM employee GROUP BY dno;

--#8 각 부서에 대해 부서번호 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오.
--칼럼의 별칭은 부서번호이름(DName), 지역명(Location), 사원수(Number of PeoPle), 평균급여(Salary)로 지정하고 평균급여는 정수로 반올림하세요.
SELECT dno, 
               DECODE(dno, 10, 'ACCOUNTING',
                                       20, 'RESEARCH',
                                       30, 'SALES',
                                       40, 'OPERATIONS') AS "부서번호 이름",
               DECODE(dno, 10, 'NEW YORK',
                                       20, 'DALLAS',
                                       30, 'CHICAGO',
                                       40, 'BOSTON') AS "지역명",
               count(*) "사원수(Number of PeoPle)",
               ROUND(AVG(salary)) "평균급여(Salary)"
FROM employee
GROUP BY dno
ORDER BY dno;
--조인
SELECT e.dno,
               d.dname AS "부서번호 이름",
               d.loc AS"지역명",
               count(e.ename) "사원수(Number of PeoPle)",
               ROUND(AVG(e.salary)) "평균급여(Salary)"
FROM employee e, department d
WHERE e.dno=d.dno
GROUP BY e.dno, d.dname, d.loc;


--#9 업무를 표시한 다음 해당 업무에 대해 부서번호별 급여 및 부서 10,20,30의 급여 총액을 각각 출력하시오.
-- 각 칼럼의 별칭은 각각 job, 부서10,부서20,부서30, 총액으로 지정하세요.
SELECT job, dno, DECODE(dno, 10, sum(salary)) "부서10",
                               DECODE(dno, 20, sum(salary)) "부서20",
                               DECODE(dno, 30, sum(salary)) "부서30",
                               SUM(salary) "총액"
FROM employee
GROUP BY dno, ROLLUP(job)
ORDER BY dno, job;