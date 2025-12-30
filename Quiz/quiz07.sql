--1.Student 테이블의 birthday 컬럼을 사용하여 생일이 1월인 학생의 이름과 birthday 를 출력하세요.
SELECT *FROM STUDENT;
SELECT 
    STUDNO,
    NAME,
     TO_CHAR(BIRTHDAY,'yyyy-mm-dd')BIRTHDAY
     --SUBSTR(BIRTHDAY,4,2)기본 양식이 달라질 수 있다. 1975/06/15,1975-06-15
    FROM STUDENT
    WHERE 
        TO_CHAR(birthday, 'MM') = '01'; -- 문자로 바꾼다.

--2.emp 테이블의 hiredate 컬럼을 사용하여 입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.
SELECT * FROM EMP;
SELECT 
    EMPNO,
    ENAME,
    hiredate
    FROM EMP
   -- WHERE TO_CHAR(hiredate,'MM')='01'
   -- WHERE TO_CHAR(hiredate,'MM')='02'
   -- WHERE TO_CHAR(hiredate,'MM')='03'
    WHERE 
        TO_CHAR(hiredate,'MM') IN ('01','02','03');
    
