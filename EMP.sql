CREATE DATABASE employee;
USE EMPLOYEE;
CREATE TABLE emp
(empno NUMERIC(4) PRIMARY KEY,
ename VARCHAR(10),
job VARCHAR(9),
mgr NUMERIC(4),
hiredate DATE,
sal  NUMERIC(7, 2),
comm NUMERIC(7, 2),
deptno Numeric(2));
INSERT INTO EMP VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17',800, NULL, 20);
INSERT INTO EMP VALUES
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20',1600, 300, 30);
INSERT INTO EMP VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17',800, NULL, 20);
INSERT INTO EMP VALUES
(7521, 'WARD' ,'SALESMAN' ,7698, '1981-02-22', 1250, 500, 30);
INSERT INTO EMP VALUES
(7566, 'JONES' , 'MANAGER' , 7839,'1981-04-02', 2975, NULL, 20);
INSERT INTO EMP VALUES
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28' , 1250, 1400, 20);
INSERT INTO EMP VALUES
(7698, 'BLAKE' , 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO EMP VALUES
(7678, 'TURNER' , 'MANAGER', 7840, '1981-05-04', 2860, NULL, 20);


SELECT * FROM EMP;

CREATE TABLE dept
(deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(14),
loc VARCHAR(13));

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH' ,  'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES' , 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS' , 'BOSTON');

Select * from DEPT;

CREATE TABLE BONUS
(ENAME VARCHAR(10),
JOB VARCHAR(9),
SAL NUMERIC,
COMM NUMERIC);


CREATE TABLE salgrade
(grade NUMERIC,
losal NUMERIC,
hisal NUMERIC);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (2, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

Select * from Salgrade;

select ename, job, empno from emp;
select job from emp;
select DISTINCT job from emp;
Select * from emp;
Select * from salgrade;
Select * from Bonus;
Select * from dept;

Select empno, ename, job, hiredate
FROM emp;

SET sql_mode= 'PIPES_AS_CONCAT';
Select ename || " , " || job
FROM emp;

#better option
Select concat (ename , job)
FROM emp; 

Select 'My name is ' || ename ||' ,my salary is ' || sal || '.'
As sentence FROM emp;

SELECT * from salgrade;

SELECT MIN(losal), Max(hisal)
FROM salgrade;

Select 'Minimum salary is ' || losal ||' ,max salary is ' || hisal || '.'
FROM salgrade;

SELECT * from emp;

SELECT ename, sal FROM emp WHERE sal>2800; 

SELECT ename deptno
FROM emp
WHERE empno=7566;

SELECT ename deptno
FROM emp
WHERE sal BETWEEN 1500 AND 2800;

SELECT ename deptno
FROM emp
WHERE sal NOT BETWEEN 1000 AND 2000;

SELECT ename, deptno
FROM emp
WHERE deptno=10 OR deptno=30
ORDER By ename DESC;

SELECT ename, job, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY hiredate;

SELECT ename, sal
FROM emp
WHERE sal>1500 AND (deptno=10 OR deptno=30)
ORDER BY sal;

SELECT ename,sal
FROM emp
WHERE hiredate LIKE '1981%';

SELECT ename,job
FROM emp
WHERE mgr is NOT NULL;

SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL
ORDER BY sal DESC, comm DESC;

SELECT ename
FROM emp
WHERE ename LIKE '__A%';

SELECT ename
FROM emp
WHERE ename LIKE '%R%R%' OR ename like '%A%A%';

SELECT ename
FROM emp
WHERE (ename LIKE '%R%R%') OR (ename LIKE '%A%A%')
AND ((deptno=30) OR (mgr=7788));

SELECT ename, job, sal
FROM emp
WHERE job IN( 'Clerk' , 'Analyst') AND sal NOT IN (1000, 3000, 5000);

SELECT ename, sal, comm
FROM emp
WHERE comm >(sal*1.05);

Select curdate();

SELECT * from emp;

SELECT empno, ename, sal, ROUND(sal*1.15) AS increased_sal
FROM emp;

SELECT empno AS Employee_NO, ename AS Employee_Name, sal, ROUND(sal*1.15) AS New_Sal, ROUND(sal*1.15)-sal AS Increase_in_Sal
FROM emp;

Select concat (ename, ' earns ' , sal , ' but wants to earn ', sal*3) AS Dream_Salary
FROM emp; 

SET sql_mode= 'PIPES_AS_CONCAT';
Select ename||' earns '||sal||' but wants to earn '||(sal*3)||'.' AS Dream_Salary
FROM emp;

SELECT ename, LPAD(sal, 15, '$') AS Salary
FROM emp;

SELECT ename, RPAD(sal, 10, '$') AS Salary
FROM emp;

SELECT ename, SUBSTRING(ename, 2)  #last argument is optional
FROM emp;

SELECT UPPER(SUBSTRING(ename, 2, 2) ) #last argument is optional
FROM emp;

Use EMPLOYEE;
SELECT CONCAT(UPPER(SUBSTRING(ename,1,1)),LOWER(SUBSTRING(ename,2))) Name
FROM emp;

Select * from emp;
SELECT ename
FROM emp 
WHERE (ename like 'J%') OR (ename like 'A%') OR (ename LIKE 'M%');

SELECT ename,dname,E.deptno
FROM emp E,dept D
WHERE E.deptno=D.deptno;

SELECT ename,dname,E.deptno
FROM emp E,dept D
WHERE ((comm IS NOT NULL) OR NOT (comm=0)) AND (E.deptno=D.deptno);

SELECT E.ename,D.dname
FROM emp E,dept D
WHERE(E.ename LIKE '%A%') AND (E.deptno=D.deptno);

SELECT ename, job, e.deptno, dname
FROM emp E, dept D
WHERE (E.deptno=D.deptno) AND (loc='DALLAS');

SELECT E.ename, E.empno, E.mgr, M.ename
FROM emp E, emp M
where E.mgr=M.empno;

SELECT E.ename AS employee, E.deptno AS DEPARTMENT, C.ename AS Colleague
FROM emp E,emp C
WHERE E.deptno=C.deptno AND E.empno!=C.empno;    








