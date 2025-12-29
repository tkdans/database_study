 /********************/
 단일행 함수
 
 select * from dual;
 dual: 더미 데이터 들어있는 임시 테이블
 
 select INITCAP('abc') from dual;
 select ename, initcap (ename) from emp; -- 행별로 적용
 
 select 
 name , lower(name), upper(name)
 from student;
 
 select 
 name , length(name)
 from student;
 
 select length ('abcdefdo'),  lengthb ('abcdefdo'),
 length ('한글'),lengthb ('한글')
 from dual;
 
 --이름이 알파벳 5글자 이상 조회
 select *
 from emp
 where length(ename) >= 5;
 
 select '아침' ||'점심'||'저녁',
 concat(concat('아침','점심'), '저녁')
 from dual;
 
 --substr (대상값 /컬럼명, 시작지점, 자릿수)
 select 
 substr('abcdefg',1,3),
 substr('abcdefg',3,5),
 substr('abcdefg',-4,2),
 substr('abcdefg',-3,3)
 from dual;
 
 --instr(대상값/ 컬럼명, 찾는값)
 --instr(대상값/ 컬럼명, 찾는값, 시작위치)
 --instr(대상값/ 컬럼명, 찾는값, 시작위치, 몇번째값)

select
instr ('2025-06-05 10:22:45','-'),
instr ('2025-06-05 10:22:45',':'),
instr ('2025-06-05 10:22:45','-', 6),
instr ('2025-06-05 10:22:45',':', 15),
instr ('2025-06-05 10:22:45','-', 1,2)
from dual;

select 
    tel,
    instr(tel,')'),
    instr(tel, '-')
from student;

select 
    LPAD('문자',10,'-'),
    RPAD('13KD', 8, '*'),
    LPAD(5,2,0),
    LPAD(5,3,0),
    LPAD(75,2,0)
    FROM DUAL;
    
    SELECT
     '*' || LTRIM(' ABCD ')||'*',
    RTRIM(' ABCD '),
    TRIM(' ABCD '),
    LTRIM('**ABCD**','*'),
    RTRIM('**ABCD**','*')
    FROM DUAL;
    
    SELECT 
    REPLACE('ABCD','C','/')
    FROM DUAL;
    
    SELECT 
    birthday,
    replace (birthday, '/', '$')
    from student;
    
    
/****************************************/
--숫자

select 
round(1.123),--반올림
round(1.78),
round(1.78,1),
round(1.78648,3),
round(1.78656595,0),
round(3489.7812354,-1),
trunc(1.3556),--버림
trunc(1.3556,2),
mod(15,4),--나머지
ceil(123.123),-- 인접한 큰 정수( 그룹한 정수)
floor(123.123),-- 인접한 작은 정수
power(6,3)-- 제곱한 정수
from dual;

select 
rownum,
ceil(rownum/3)그룹번호, --1/3 =0.33 ->1, 2/3 =0.66 ->1, 3/3 =1 인접한 큰 정수
 ceil( rownum/4)팀번호, --4/3 =1.33 ->2, 5/3 =1.66 ->2, 6/3 = 2
empno,
ename
from emp;
--where rownum <5

/***************************/
--날짜

select 
    sysdate, --현재날짜
    systimestamp, --현재 날짜시간
    months_between('2024-01-05', '2024-03-05'),
     months_between('2024-11-05', '2024-06-20'),
from dual;
select 
ADD_MONTHS(SYSDATE,3),
ADD_MONTHS(SYSDATE,6),
ADD_MONTHS(SYSDATE,-7),
LAST_DAY(SYSDATE),--마지막 날짜
NEXT_DAY(SYSDATE, '수'),
NEXT_DAY(SYSDATE, '토')
FROM DUAL;

SELECT
 SYSDATE,
 ROUND(SYSDATE),
 TRUNC(SYSDATE)
 FROM DUAL;

SELECT
 SYSDATE,
 ROUND(SYSDATE),
 TRUNC(SYSDATE),
 TRUNC(SYSDATE,'YY'),-- Year Month Day
 TRUNC(SYSDATE,'MM'),-- 2025-12-29 0000
 TRUNC(SYSDATE,'DD'), -- 
 add_months(sysdate,1),
 sysdate +3,
 sysdate +7,
 --다음달 첫날
 Last_day(sysdate)+1,
trunc(add_months(sysdate,1),'mm'),
 --전월의 마지막날
 last_day(add_months(sysdate, -1)),
 trunc(sysdate, 'mm')-1
FROM dual;
 
 
 


    