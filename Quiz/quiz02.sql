
1.
--emp 테이블 사전기준 이름순 정렬.
select * 
from emp;

select *
from emp
ORDER BY ENAME;

2.
--emp 테이블 부서번호 별 정렬 + 급여가 높은 순서대로
select *
from emp
ORDER BY DEPTNO, SAL DESC;

3.
--emp 급여가 2000이 넘는 사람들 중 급여가 높은 순서대로
select *
from emp
where sal > 2000 
ORDER BY SAL DESC;

4.
--student 테이블 1학년을 제외하고, 나이가 어린순서대로
SELECT *
FROM STUDENT
where grade in (2,3,4)
ORDER BY BIRTHDAY DESC;

