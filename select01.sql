
1. 조회하기 SELECT

쿼리문 작성

SELECT 조회대상(컬럼명) FORM 테이블명;
*: 전체 ALL

테이블 구조 확인(Describe)
DESC 테이블명
desc emp;


SELECT * FROM dept;
SELECT * FROM DEPT;

SELECT * FROM fruit;
SELECT * FROM emp;
SELECT job FROM emp;
SELECT job, hiredate FROM emp;

desc product;

--가독성
SELECT
    job, 
    hiredate,
    mgr 
FROM emp;

SELECT * 
FROM emp;

/*****************************/
--컬럼명 별도 지정 (별칭)
SELECT 컬럼명 AS "컬럼별칭"
        컬럼명 "컬럼별칭"
        컬럼명 컬럼별칭 
        FROM 테이블명;

SELECT 
    empno AS "사원번호",
    ename "사원명",
    job 직업,
    sal "급여 데이터"
FROM emp;

SELECT 
    empno, 
    empno empnumber,
    empno employeeno,
    ename, 
    job 
    FROM emp;
    
/*******************************/
--조회데이터의 리터링 값 활용
select '문자', 123 from emp;
select * from emp;
select * from dept;
select '문자', 123 from dept;
select * from dept;
select '문자', 123 from dept;

select '문자', 123 from dual; --dual 명령어 임시테이블
    select '문자확인' AS "문자컬럼별창", 
    123+333+444 숫자연산결과
    from dual;
select dname, loc, '안녕하세요', 132456 from dept;
select '문자''작은따옴표' from dual;
select q'[이 안에다가 문자 "문자" 이런식으로]' from dual;

--문자들을 이어붙이기 ||
select '오늘'|| '너무춥다' from dual;
select
    '부서번호: '|| deptno AS "부서번호",
    deptno,
    '부서번호에 500 더하면 : ' || (deptno + 500) "부서번호plus500"
    from dept;
    
/************************************************/
--DISTINCT 중복제거
SELECT * FROM emp;
select DISTINCT  job from emp;
select DISTINCT  (job) from emp;

SELEct deptno from emp;
select distinct(deptno) from emp;
select distinct job, deptno from emp; -- 세트로 봤을때 다른 애들

/*********************************************************/
조건 where 절
필터링, 원하는 조건에 따라 조회

select ...
from ...
where ...;

select *
from emp;

select *
from emp
where sal > 2500; -- sal 값이 2500 초과하는 직원의 모든 정보 조회

-- sal 값이 2500 초과하는 직원의 이름 조회
select ename
from emp
where sal > 2500;

--직업이 세일즈맨인 사람만 조회
select *
from emp
where job = 'SALESMAN';

select *
from emp
where DEPTNO = 10;

select *
from emp
where DEPTNO <> 10;
--WHERE DEPTNO !=10;
--부서번호 10번이 아닌 사원들 정보

SELECT *
FROM STUDENT
WHERE WEIGHT>55;-- 55KG 이상

--55KG >=55;

SELECT *
FROM STUDENT
WHERE WEIGHT>=55 and weight <= 70; --55kg <=70kg

SELECT *
FROM STUDENT
WHERE WEIGHT between 55 and 70;

SELECT *
FROM STUDENT -- 1~3학년까지만 조회
--where grade >=1 and grade <=3;
--where grade between 1 and 3;
--where grade =1 or grade =2 or grade =3;
--where grade <>4; --grade !=4
where grade in (1,2,3);

--2학년이랑 4학년만 조회

SELECT *
FROM STUDENT
--WHERE grade in(2,4);
--where grade =2 or grade =4;
--where grade != 1 and grade <>3;
where grade not in (1,3);

like 패턴 검색(문자)
    %: 0~n개의 아무갯수
    _: 그 위치에 한개

SELECT *
FROM emp
--where ename like '%M%'; -- '123m313' 'm1234' '1234m'
--where ename like 'm%';
--where ename like '_M%'; smith 
where ename like '__M%'; --JAMES

-- TITLE LIKE '%울타리%'

SELECT *
FROM EMP
--WHERE COMM IS NULL;
WHERE COMM IS NOT NULL;
--NULL과 0의 차이를 명심

--날짜 비교
1201
1221
--날짜 미래일수록 큰 값
--과거일수록 작은 값

SELECT *
FROM EMP; -- 테이블 정보 팝업설명 단축키 : SHIFT +F4
DESC EMP;

--SELECT *
--FROM EMP
--WHERE HIREDATE = '81/05/01';
--WHERE HIREDATE = '1981-05-01'; --YYYY-MM-DD
--WHERE 


SELECT *
FROM EMP
--WHERE HIREDATE = '81/05/01';
--WHERE HIREDATE = '1981-05-01'; --YYYY-MM-DD
--WHERE HIREDATE > '80/08/20';
WHERE HIREDATE <= '1980-08-20';

/******************************/
정렬 ORDER BY
단순 조회 => 정렬을 명시하지 않으면 순서 보장x
ORDER BY 

SELECT...
FROM ...
ORDER BY ...

SELECT *
FROM STUDENT
ORDER BY NAME ASC;
--ORDER BY NAME; --기본 ASC오름차순

--내림차순 DESC
SELECT *
FROM STUDENT
ORDER BY NAME DESC;

-- 학생들 학년기준으로 내림차순 -->이름 , 학년
SELECT NAME, GRADE
FROM STUDENT
ORDER BY GRADE DESC;

--STUDENT 학생테이블에서 1,2,3학년 중 키순으로 내림차순 정보 조회
SELECT *
FROM STUDENT
WHERE GRADE IN (1,2,3)
ORDER BY HEIGHT DESC;


-- 
SELECT *
FROM STUDENT
WHERE GRADE IN (1,2,3)
ORDER BY GRADE, HEIGHT  DESC; --학년으로 정렬을 하고 키순으로 정렬

SELECT *
FROM STUDENT
WHERE GRADE IN (1,2,3)
ORDER BY HEIGHT, GRADE DESC; --키순으로 오름차순 그리고 학년으로 내림차순으로 정렬

SELECT * --날짜 순으로 정렬
FROM STUDENT
--ORDER BY BIRTHDAY;
ORDER BY BIRTHDAY DESC;


