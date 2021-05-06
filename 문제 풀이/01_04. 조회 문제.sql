SELECT * FROM employee;
--#1                              별칭은 보기 편한걸로 아무거나 정해도 상관없다(의미X)
SELECT ename, salary, salary+300 AS "인상된 급여" FROM employee;
--#2                                                                             별칭으로 써도 된다.
SELECT ename, salary, (salary*12)+100 AS "연간 총수입" FROM employee ORDER BY "연간 총수입" DESC;
--#3    
SELECT ename, salary FROM employee WHERE salary>2000 ORDER BY salary DESC;
--#4
SELECT ename, dno FROM employee WHERE eno=7788;
--#5
SELECT ename, salary FROM employee WHERE salary NOT BETWEEN 2000 AND 3000;
--#6                                                              '1981/02/20'          '1981/05/01'
SELECT ename, job, hiredate FROM employee WHERE hiredate BETWEEN to_date(19810220) AND to_date(19810501);
--#7
SELECT ename, dno FROM employee WHERE dno IN(20, 30)ORDER BY ename DESC;
--#8
SELECT ename, salary, dno FROM employee WHERE (salary BETWEEN 2000 AND 3000) AND dno IN(20, 30) ORDER BY ename ASC;
--#9
SELECT ename, hiredate FROM employee WHERE hiredate LIKE '1981%';
--#10
SELECT ename, job FROM employee WHERE MANAGER IS NULL;
--#11
SELECT ename, salary, commission FROM employee WHERE commission IS NOT NULL ORDER BY salary DESC, commission DESC;
--#12
SELECT * FROM employee WHERE ename LIKE '__R%';
--#13
SELECT ename FROM employee WHERE ename LIKE '%A%' AND ename LIKE '%E%';
--#14
SELECT ename, job, salary FROM employee WHERE job IN('CLERK','SALESMAN') AND salary NOT IN(1600, 950, 1300);
--#15
SELECT ename, salary, commission FROM employee WHERE commission>=500;