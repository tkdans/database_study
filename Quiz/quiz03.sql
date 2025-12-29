--1) dept 테이블을 활용하여 아래와 같은 결과를 만드는 쿼리를 작성하세요
SELECT 
    DEPTNO AS "부서번호",
    DNAME "부서이름",
    LOC 위치
FROM DEPT;

--2) professor 테이블을 활용하여 아래와 같은 결과를 만드는 쿼리를 작성하세요
SELECT *
FROM PROFESSOR;

SELECT 
    --NAME || Q'[(]'|| ID || Q'[)]' "교수정보" ,
    NAME ||'(' || ID || ')' 교수정보,
    POSITION,
    HIREDATE "입사일자",
    EMAIL "이메일"
FROM PROFESSOR;
