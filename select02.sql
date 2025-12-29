--집합연산자
--첫째 두집합의 SELECT 절에 오는 컬럼의 개수가 동일해야 합니다.
UNION 합집합(합치고 중복제거)
UNION ALL 합집합(전부 다 합치기 중복제거 x)
INTERSECT 교집합
MINUS  차집합

-- 조건(제약)
1.컬럼 갯수 동일
2.컬럼 데이터형(타입) 동일
3. 컬럼명은 달라도 상관없음

--학생들 (STUDENT) 101번 학과 학생 + 102 번학과 학생 정보 모아서 조회

SELECT *
FROM STUDENT
WHERE DEPTNOL IN (101, 102);

SELECT *
FROM STUDENT
WHERE DEPTNO1 =101
UNION ALL
SELECT *
FROM STUDENT 
WHERE DEPTNO1 IN(101,102);

SELECT *
FROM student
WHERE deptnol =101
UNION ALL

SELECT *
FROM student
WHERE deptno1 =102
and height >170;

-- 101 번학과 소속인 학생과 교수들을 모두 조회
select studno 식별번호, name 이름, deptno1 학과, tel 연락처
from student
where deptno1 =101
union all
select profno, name, deptno, null
from professor
where deptno =101
order by 이름; -- 별칭으로 정렬한다.

-- 다른 컬럼을 추가로 보여주고 싶다. 두개 의 컬럼의 수가 맞아야한다.

select *
from student
where deptno1 = 010
intersect
select *
from student
where deptno2 = 201;

--차집합
select *
from emp
where job ='SELESMAN' and comm>0
--이전 수상기록이 저장된 다른 테이블정보
minus
select *
from emp
where hiredate < '1982-01-01';

