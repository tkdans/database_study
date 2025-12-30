--1.
--emp 테이블에서 20 번 부서에 소속된 직원들의 이름과 3-4 번째
--글자만 '-' 으로 변경해서 출력하세요 .
select * from emp;
select 
ENAME,
    --substr(ename,1,2)||'-'||'-'||substr(ename,4,1)REPLACE
    REPLACE(ENAME,SUBSTR(ENAME,3,2),'--')AS "REPLACE"
    --REPLACE(대상, 기존, 바꿀)
    from emp
    WHERE DEPTNO =20;    
--2.
--Student 테이블에서 1전공(deptno1)이 101 번인 학생들의 이름과
--주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘-’ 과 '/' 로 표시되게
--출력하세요.
select * from student;
select name,
substr(jumin,1,6)||'-'||'/'||'-'||'/'||'-'||'/'||'-' "주민뒷자리숨김"
              --||'-/-/-/-'
from student
where deptno1 = 101;
SELECT RPAD('123465',13,'-/') FROM DUAL;
SELECT RPAD('031)123-',15,'*') FROM DUAL;
SELECT LPAD('*',4,'*') FROM DUAL;
--3,
--Student 테이블에서 아래 그림과 같이 1 전공이 102 번인 학생들의 이름과 전화번호,
--전화번호에서 국번 부분만 ‘*’ 처리하여 출력하세요.
--단 모든 국번은 3자리로 간주합니다.
select * from student;
select name,TEL,
--substr(tel,1,4)||'*'||'*'||'*'||substr(tel,8,5)"REPLACE"
                --||'***'||
--substr(tel,1,4)||'*'||'*'||'*'||substr(tel,-5,5)"REPLACE"
    REPLACE(TEL, SUBSTR(TEL,5,3),'***'),
    --국번이 3자리가 아닌경우는 )까지이다.
    INSTR(TEL,'(') 괄호위치,
    SUBSTR(TEL,INSTR(TEL,'(')+1,3) 국번3자리,
                          --괄호다음위지 +1
    REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,'(')+1,3),'***') REPLACE  
from student
where deptno1 = 102;
--4.
--Student 테이블에서 아래와 같이 deptno1 이
--101 번인 학과 학생들의 이름과 전화번호와 전화번호에서
--지역번호와 국번을 제외한 나머지 번호(끝 4자리 번호)를 * 로 표시해서 출력하세요.
select * from student;
select name,
substr(tel,1,8)||'*'||'*'||'*'||'*' "REPLACE"
from student
where deptno1 = 101;

SELECT name,
       RPAD(SUBSTR(tel,1,8), LENGTH(tel), '*') AS REPLACE
FROM student
WHERE deptno1 = 101;

SELECT NAME,
    TEL,
    REPLACE(TEL,SUBSTR(TEL,-4,4),'****') REPLACE,
    INSTR(TEL, '-'),
    SUBSTR(TEL,1,INSTR(TEL, '-'))||'****' REPLACE

