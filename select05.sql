/***************/
단일행 일반함수

NVL함수
값이 NULL 일때 기본값
nvl (대상, nul일때 기본값)
SELECT
    SAL,
    COMM,
    (SAL*12)+comm
    , nvl(comm, 0),
    (SAL*12)+nvl(comm,0)
FROM EMP;

select 
sal,
comm,
sal*12+comm 연봉
from emp
where comm is not null
union all
select 
sal,
comm,
sal*12 연봉
from emp
where comm is not null;

nvl2 (대상값, 있고, 없고)

select 
 nvl(null,10),
 nvl(20,10),
 nvl2(null, '있다','없다'),
 nvl2('16dkdf', '있다','없다')
 from dual;

***decode

decode(대상, 비교값, '같다'. 다르다')
decode(대상, 비교값, '같다'. (decode(대상, 비교값, '같다'. 다르다')))
select
        decode(10,10,'같다','다르다'),
        decode(10,10,'같다','다르다'),
        decode(10,10,'같다'),
        decode(10,20,'같다'),--뒤 다르다 생략 가능 -->null
        decode(10,20,'같다',null),
        decode(10,20,'20이다',20,'30이다',40,'40이다','아니다'),
        decode(10,20,'20이다',20,'30이다',40,'40이다'),
        decode(10,20,'20이다',20,'30이다',40,'40이다',null)
        decode(20,20,'20이다',20,'30이다',40,'40이다',50,'50이다')
        from dual;
    /*  
        switch(20)
        case20: '20이다'
        case30: '30이다.'
        
      */
select 
    name,
    deptno,
    decode(deptno,101,'컴공',102,'전기',103,'물리', 104, '철학', 201,'기계'),
    '전공학과: '|| decode(deptno,101,'컴공',102,'전기',103,'물리', 104, '철학', 201,'기계')
from professor;

*** CASE 문

SELECT *
FROM STUDENT;
--1,2,3,4학년
--1,2 저학년
--3,4 고학년

SELECT
    GRADE,
    DECODE(GRADE, 1,'저학년',2,'저학년',3,'고학년',4,'고학년','학년 범위외')구분,
    CASE GRADE
    WHEN 1 THEN '저학년'
    WHEN 2 THEN '저학년'
    WHEN 3 THEN '고학년'
    WHEN 4 THEN '고학년'
    ELSE '그외'
    --WHEN 5,6 THEN '고학년'
    END 구분2,
    
    CASE
    WHEN GRADE IN(1,2) THEN '저학년'
    WHEN GRADE BETWEEN3 AND 4 THEN 'RH학년'
    
    FROM STUDENT;
    
    ---------- NULL이면 처리하는 방법들
    SELECT
     SAL,
     COMM,
     SAL*12+COMM 연봉,
     SAL*12+NVL(COMM,0)연봉2,
     SAL*12+NVL2(COMM,COMM,0)연봉3,
     NVL2(COMM,(SAL*12+COMM), (SAL*12)) 연봉4,
     SAL*12+DECODE(COMM,NULL,0,COMM)연봉5,
     CASE
     WHEN COMM IS NULL THEN (SAL*12)
     WHEN COMM IS NOT NULL THEN (SAL*12+COMM)
     END 연봉6,
     CASE COMM
     WHEN NULL THEN (SAL*12) -- COMM=NULL, COMM IS NULL
     ELSE (SAL*12+COMM)
     END 연봉7-- COMM=NULL비교 안되는 케이스
     FROM EMP;
    
    
    
