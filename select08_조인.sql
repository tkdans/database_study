/********************************************/
***join 조인

--join 기준 -> 어떤 것을 기준으로 테이블 데이터를 합쳐서(연결)참조

select * from emp; --deptno 컬럼 부서번호
select * from dept; --부서정보 deptno 컬럼

-- 조인 후 한번에 테이블 내용을 가져오기
select E.EMPNO, E.ENAME, D.DNAME, D.LOC,D.DEPTNO 
from emp E, dept D
where E.DEPTNO = D.DEPTNO;

select E.EMPNO, E.ENAME, D.DNAME, D.LOC,D.DEPTNO 
from emp E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO;

--EMP, DEPT 조인 --> 조건, 부서번호 20, 30번만 조회
select E.EMPNO, E.ENAME, D.DNAME, D.LOC,D.DEPTNO 
from emp E, dept D
where E.DEPTNO = D.DEPTNO
AND E.DEPTNO IN (20,30) ;

select E.EMPNO, E.ENAME, D.DNAME, D.LOC,D.DEPTNO 
from emp E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO IN (10,20);

--똑같은 값을 조인하는 이너조인
SELECT *
from emp E, dept D ; --JOIN 조건을 누락 --> 전부다 곱한다. 카디션 곱

---------------

SELECT * FROM STUDENT; -- PRPFNE 교수번호 컬럼
SELECT * FROM PROFESSOR; -- PROFNO 교수번호 컬럼

SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO,P.PROFNO, P.EMAIL
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO=P.PROFNO;

SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO,P.PROFNO, P.EMAIL
FROM STUDENT S INNER JOIN PROFESSOR P
ON S.PROFNO=P.PROFNO;

--INNER JOIN VS OUTER JOIN

SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO,P.PROFNO, P.EMAIL
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO= P.PROFNO;
--INNER JOIN에 의해서 조인기준이 PROFNO 가 같은가? -> PROFNO NULL 비교불가 제외
SELECT COUNT(*) FROM STUDENT;
SELECT COUNT(*) FROM PROFESSOR;

--OUTERJOIN 전체 데이터를 가지고 기준 테이블에  붙이려는 테이블의 값
--SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO,P.PROFNO, P.EMAIL
SELECT *
FROM STUDENT S, PROFESSOR P
--WHERE S.PROFNO=P.PROFNO(+);--(+)가 어디인지 중요 조인을 해라, student기준으로 해서 professor가 붙는다.
WHERE S.PROFNO(+)=P.PROFNO;
--SELECT S.NAME 학생명, P.NAME 교수명, S.STUDNO,P.PROFNO, P.EMAIL
SELECT *
--FROM STUDENT S LEFT OUTER JOIN PROFESSOR P -- 순서가 중요하다.
--FROM STUDENT S RIGHT OUTER JOIN PROFESSOR P
--FROM PROFESSOR P LEFT OUTER JOIN STUDENT S
ON S.PROFNO=P.PROFNO;

--inner
select *
from   student s, professor p
where p.profno  = s.profno;
--outer
select *
from student s, professor p
where p.profno(+)  = s.profno;

--학생 20, 교수16, inner join 연결가능 15,   이어붙이는 방법과 테이블 간의 관계(n:1)가 달라서 그럴다.
select *
from student s, professor p
where p.profno= s.profno(+);

-------------------------------------------------------
select * from department;   --학과정보
select * from student;
select * from professor;

select s.name, s.deptno1,d.dname
from student s, department d
where s.deptno1= d.deptno;

select s.name, p.name, d.dname
from student s, department d, professor p --어는 테이블 ,밑에 조건을 
where s.profno = p.profno
and s.deptno1= d.deptno;

select s.name, p.name, d.dname
from 
student s inner join professor p
on s.profno =p.profno
inner join department d
on s.deptno1 =d. deptno;

--조건을 더 달 때
select s.name, p.name, d.dname
from student s, department d, professor p --어는 테이블 ,밑에 조건을 
where s.profno = p.profno
and s.deptno1= d.deptno
and s.deptno1 = 101;

--어떤 조건으로 조인을 할 갓인가의 따라 결과도 달라진다.조인을 할 조건
1) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호
select s.name,s.deptno1, d.dname,p.name,p.deptno
from student s, department d, professor p --어는 테이블 ,밑에 조건을 
where s.profno = p.profno
and s.deptno1= d.deptno;


2) 학생명, 학생학과번호, 교수의 학과명, 교수명, 교수학과번호
select s.name,s.deptno1, d.dname,p.name,p.deptno
from student s, department d, professor p --어는 테이블 ,밑에 조건을 
where s.profno = p.profno
--and s.deptno1= d.deptno; 학생에 학과번호를 교수의 학과번호로 바꿈
and p.deptno = d.deptno ;

3)학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호, 교수의 학과명
select
    s.name stu_name,
    s.deptno1, 
    ds.dname str_dept_name,
    p.name 교수이름,
    p.deptno,
    dp.dname 교수소속학과이름
from student s, professor p, department ds, department dp --다른 테이블도 추가하여 조인할 수 있다.
where s.profno = p.profno --학생 <--> 지도교수
and s.deptno1 = ds.deptno --학생학과 <-->학과정보
and p.deptno = dp.deptno; --교수학과 <--> 학과정보

-------------------------------------
inner join, outer join --조건
등가조인 = , 비등가조인
--비등가조인
select *from customer;
select * from gift;

select *
from customer c, gift g
where c.point between g.g_start and g.g_end;

select * 
from hakjum;

***self join --같은 테이블에서 식별 가능한 컬럼끼리 조인한다.
select *from emp;

--컬럼명 특정 변수명 
--select *
select
e1.empno,
e1.ename 사원이름, 
e1.mgr,
e2.empno,
e2.ename 상사이름
from emp e1, emp e2 --emp에 e1, e2가 생성되고 
where e1.mgr = e2. empno; -- 컬럼끼리 연결

select 
    a.empno,
    a.name,
    a.pempno,
    b.empno,
    b.name
from emp2 a, emp2 b
where a.pempno = b.empno;


