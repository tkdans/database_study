/******************************/
복수행 함수 (집계)

COUNT(대상)갯수세기
NULL은 갯수를 제외
SELECT *
FROM EMP;

SELECT COUNT(*)
FROM EMP;

--갯수 대상식별자(기본키 primary key/pk 중복이나 여러개로 식별하는 것은 안됨)
SELECT 
    count(empno),
    count(mgr),
    count(comm)--특정 컬럼 대상으로 null이 아닌것의 겟수, 일부러 null을 셀 수 있을때
    ,null
    --,empno 쓸 수 없다.단일행 함수로 써야한다.
from emp;

select
count (*)
from emp
where comm is null;

select count(*)--student 4학년 학생이 몇명이냐
from student
where grade=4;

수치집계--복수행 함수
sum/ ang/max/min/stddev/variance 

--총직원 몇명, 총급여 얼마
select
count(*),sum(sal)
from emp;

--10,20 부서에 다니는 직원 몇명, 총급여 얼마

select 
count(*),sum(sal)
from emp
where deptno in (10,20);

select
    SUM(HEIGHT),
    AVG(HEIGHT),
    MAX(HEIGHT),
    STDDEV(HEIGHT),
    VARIANCE(HEIGHT),
    AVG(WEIGHT)
from student;

/*************************/
--특정 조건으로 그룸화 하기, 작성예시
GROUP BY

SELECT ...
FROM ...
WHERE ...
GROUP BY 컬럽대상을 기준으로  그룹지어서 계산
        (GROUP BY 명시한 컬럼은 SELECT 조회에 사용가능)
HAVING
ORDER BY

--각 학년별 평균키
;
SELECT '1학년' 학년, AVG(HEIGHT) 평균키
FROM STUDENT
WHERE GRADE =1
UNION ALL
SELECT '2학년', AVG(HEIGHT)
FROM STUDENT
WHERE GRADE =2
UNION ALL
SELECT '3학년', AVG(HEIGHT)
FROM STUDENT
WHERE GRADE =3
UNION ALL
SELECT '4학년',  AVG(HEIGHT)
FROM STUDENT
WHERE GRADE =4;

SELECT GRADE, AVG(HEIGHT)
FROM STUDENT
GROUP BY GRADE
ORDER BY GRADE DESC;

SELECT GRADE,COUNT(*), AVG(HEIGHT)
FROM STUDENT
GROUP BY GRADE;

-- GROUP BY 
SELECT STUDNO,COUNT(*), AVG(HEIGHT)
FROM STUDENT
GROUP BY STUDNO;

-- 1~3 학년의  학년별 평균키 학년의 내림차순으로 정렬
SELECT GRADE 학년,COUNT(*)학생수, AVG(HEIGHT) 평균키
FROM STUDENT
WHERE GRADE IN (1,2,3)
GROUP BY GRADE
--ORDER BY AVG(HEIGHT) DESC;
--ORDER BY 평균키 DESC;
ORDER BY 2 DESC; --해당순서 위치에 있는 컬럼을 기준으로 정렬 1,2,3, ... 순서가 바뀌면 엉뚱한 결과를 불러온다.

HAVING --집계처리된 결과를 재처리, 조회조건

SELECT DEPTNO, AVG(SAL)
FROM EMP
--WHERE AVG(SAL)>2000
GROUP BY DEPTNO
HAVING AVG(SAL)>2000;

1) 급여가 2000인 이상인 직원들ㅇ 대상으로 부서별 평균급여
SELECT DEPTNO, AVG(SAL)
FROM EMP
WHERE SAL >= 2000
GROUP BY DEPTNO;
2) 부서별 평균급여가 2000이상인 부서별 평균급여
    부서별 평균급여를 계산하고, 그 평균급여가 2000이상인 결과만
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

학생 각 학년별 평균 몸무게
평균 몸무게 65키로 이사

SELECT GRADE, AVG(WEIGHT)
FROM STUDENT
GROUP BY GRADE
HAVING AVG(WEIGHT)>=65;

--학생 4학년을 제외하고 각 학년별 평균 몸무게
평균 몸무게 65키로 이상

SELECT GRADE, AVG(WEIGHT)
FROM STUDENT
WHERE GRADE !=4
GROUP BY GRADE
HAVING AVG(WEIGHT) >=65
ORDER BY GRADE;

--ORDER BY GRADE, HEIGHT

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT JOB, AVG(SAL)
FROM EMP
GROUP BY JOB;
--어떤 그룹단위로 하겠다.
SELECT JOB,DEPTNO, AVG(SAL)
FROM EMP
GROUP BY JOB, DEPTNO;