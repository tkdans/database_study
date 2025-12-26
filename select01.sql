
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
    


 









