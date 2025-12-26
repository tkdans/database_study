1. 연결 연산자 
Student 테이블에서 모든 학생의 이름과 id 와 체중을 아래 화면과 같이 출력하세요, 
컬럼 이름도 "ID AND WEIGHT"로 나오게 하세요.

SELECT * FROM student;

select name,Id, weight from student;

select
    name ||'`s '||
    'ID :' || id||
    ', WEIGHT is'|| weight||'kg' "ID AND WEIGHT"
    from student;
    
2.연결 연산자 연습문제
EMP 테이블을 조회하여 모든 사람들의 이름과 직업을 아래와 같이 출력하세요
SELECT * FROM EMP;
SELECT 
    ENAME||q'[(]'||job||q'[)]'||q'[,]'|| ename || q'[']'||job||q'[']'"NAME AND JOB"    
    FROM EMP;
    
3. 연결 연산자 연습문제
EMP 테이블을 조회하여 모든 사원의 이름과 급여를 아래와 같은 형테로 출력하세요
SELECT * FROM EMP;
select
    ename||'`s'|| ' sal is ' || q'[$]'||sal"Name and Sal"
    from emp;


