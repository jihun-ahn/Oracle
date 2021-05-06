-- 다양한 함수 문제 풀이
SELECT * FROM employee;
-- 1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하세요.,
SELECT substr(hiredate,1,4) AS 년도,
substr(hiredate,6,2) AS 월
FROM employee;

-- 2. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하세요
SELECT *
FROM employee
WHERE substr(hiredate,6,2)='04';

--3. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하세요
SELECT * 
FROM employee
WHERE mod(eno,2)=0;

-- 4. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 지정하여 출력하세요.
SELECT hiredate, TO_CHAR(hiredate,'YY/MM/DD DY')
FROM employee;


-- 5. 올해 며칠이 지났는 지 출력하세요. 
-- 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치시키시오.
SELECT ROUND(sysdate-TO_DATE('2021/01/01','YYYY/MM/DD'),1)
FROM dual;



-- 6. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 대신에 0을 출력하세요.
SELECT eno, ename, NVL2(manager,manager,0) AS "상사 번호"
FROM employee;



-- 7. DECODE 함수로 직급에 따라 급여를 인상하도록 하세요.
-- 직급이'ANAIYST'인 사원은 200,
-- 'SALESMAN'인 사원은 180,
-- 'MANAGER'인 사원은 150, 
-- 'CLERK'인 사원 은 100을 인상하세요.

SELECT eno, ename, job, salary,
    DECODE(job,'ANALYST',salary+200,
                 'SALESMAN',salary+180,
                 'MANAGER',salary+150,
                 'CLERK',salary+100,
                 salary) AS "인상된 급여"
FROM employee;










