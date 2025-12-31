/***********************************************/
기타 복수행 함수

--부서와 직업별 평균 급여와 사원수
SELECT DEPTNO, JOB, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO, JOB;



--EMP 부서별 평균 급여와 사원수
SELECT DEPTNO, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO;
--EMP 전체 사원의 평균 급여의 사원수
SELECT AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP;

--위 3개를 병합( 각그룹별로 소계, 전체합계)개별적으로 계산한 경우
SELECT DEPTNO, JOB, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO, JOB
UNION ALL
SELECT DEPTNO,NULL, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL,NULL, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
ORDER BY DEPTNO, 2;

***ROLLUP --각그룹별로 소계, 전체합계 정리
SELECT DEPTNO, JOB, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
--GROUP BY ROLLUP (JOB, DEPTNO); 순서가 중요하다
GROUP BY ROLLUP (DEPTNO, JOB);

GROUP BY ROLLUP (DEPTNO, JOB) --뒤에 부터 지워간다, 생각해라
1)GROUP BY(DEPTNO, JOB) 그룹화 데이터 -->집계
2)GROUP BY(DEPTNO) 그룹화 데이터 -->집계
3)()그룹화 데이터 -->집계

GROUP BY ROLLUP (EMPNO,DEPTNO, JOB)
1)(EMPNO,DEPTNO, JOB)
2)(EMPNO,DEPTNO,)
3)(EMPNO)

SELECT DEPTNO, JOB, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
--GROUP BY ROLLUP (JOB, DEPTNO); 순서가 중요하다
GROUP BY ROLLUP ((DEPTNO, JOB));--((형태가 다르다 ))

GROUP BY ROLLUP ((EMPNO,DEPTNO,JOB))
1)(EMPNO,DEPTNO, JOB)
2)(EMPNO)
3) ()

***CUBE --전체 항목을 다 합쳐서 보여준다.
SELECT DEPTNO, JOB, AVG(SAL)평균급여 ,COUNT(*) 사원수
FROM EMP
--GROUP BY ROLLUP (JOB, DEPTNO); 순서가 중요하다
GROUP BY CUBE (DEPTNO, JOB);--((형태가 다르다 ))

1)DEPTNO, JOB
2)DEPTNO
3)        JOB
4)()


