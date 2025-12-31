1.
professor 테이블에서 교수의 이름과 부서번호를 출력하고
101 번 부서 중에서 이름이 "Audie Murphy" 교수에게 "BEST!" 라고 출력하고
101번 부서 중에서 이름이 "Audie Murphy" 교수가 아닌 나머지에는 NULL 값을 출력하세요.
만약 101 번 외 다른 학과에 "Audie Murphy" 교수가 있어도 "BEST!" 가 출력되면 안됩니다.

SELECT * FROM PROFESSOR;

SELECT 
    DEPTNO,
    NAME,
    DECODE(DEPTNO,101,(DECODE(NAME,'Audie Murphy','BEST!',NULL)),NULL)DECODE
    --DECODE(NAME,'Audie Murphy',(DECODE(DEPTNO,101,'BEST!')))DECODE
    FROM PROFESSOR;
    
SELECT 
    DEPTNO,
    NAME,
    CASE 
    WHEN DEPTNO=101 AND NAME='Audie Murphy' THEN 'BEST!'
    ELSE NULL
    END DECODE
 FROM PROFESSOR;

2.
professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서 이름이 "Audie Murphy" 교수에게
비고란에 “BEST!”라고 출력하고 101번 학과의 "Audie Murphy" 교수 외에는 비고란에
“GOOD!”을 출력하고 101번 교수가 아닐 경우는 비고란이 공란이 되도록 출력하세요.

SELECT * FROM PROFESSOR;
SELECT 
    DEPTNO,
    NAME,
    DECODE(DEPTNO,101,(DECODE(NAME,'Audie Murphy','BEST!','GOOD!')),NULL)DECODE
    --DECODE(NAME,'Audie Murphy','BEST!',(DECODE(DEPTNO,101,'GOOD!',NULL)) )
    FROM PROFESSOR;
    
SELECT 
    DEPTNO,
    NAME,
    CASE 
    WHEN DEPTNO=101 AND NAME='Audie Murphy' THEN 'BEST!'
    WHEN DEPTNO=101 THEN 'GOOD!'
    ELSE NULL
    END DECODE
 FROM PROFESSOR;
3.
professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서
이름이 "Audie Murphy" 교수에게 비고란에 “BEST!” 이라고 출력하고
101번 학과의 "Audie Murphy" 교수 외에는 비고란에 “GOOD!”을 출력하고
101번 교수가 아닐 경우는 비고란에 "N/A" 을 출력하세요.


    SELECT 
    DEPTNO,
    NAME,
    DECODE(DEPTNO,101,(DECODE(NAME,'Audie Murphy','BEST!','GOOD!')),'N/A')DECODE
    FROM PROFESSOR;
   -- DECODE(NAME,'Audie Murphy','BEST!',(DECODE(DEPTNO,101,'GOOD!','N/A')) )DECODE
    --FROM PROFESSOR;

4.
Student 테이블을 사용하여 제 1 전공 (deptno1) 이 101 번인 학과 학생들의 이름과 주민번호, 
성별을 출력하되 성별은 주민번호(jumin) 컬럼을 이용하여 7번째 숫자가 1일 경우 '남자' , 
2일 경우 '여자' 로 출력하세요.
SELECT * FROM STUDENT;

SELECT 
    NAME,
    JUMIN,
    CASE SUBSTR(JUMIN,7,1)
    WHEN '1' THEN '남자'
    ELSE '여자'
    END 성별,
    CASE 
    WHEN SUBSTR(JUMIN,7,1) IN ('1','3') THEN '남자'
     WHEN SUBSTR(JUMIN,7,1) IN ('2','4') THEN '여자'
     END 성별3
    FROM STUDENT;
SELECT 
    NAME,
    JUMIN,
    DECODE(SUBSTR(JUMIN,7,1),'1','남자','2','여자') 성별2
    FROM STUDENT;
    
5.
Student 테이블에서 1 전공이 (deptno1) 101번인 학생의 이름과 연락처와 지역을 출력하세요.
단,지역번호가 02 는 "SEOUL" , 031 은 "GYEONGGI" , 051 은 "BUSAN" , 052 는 "ULSAN" , 
055 는 "GYEONGNAM"입니다.

SELECT 
    NAME,
    TEL,
    SUBSTR(TEL,1,3),
    SUBSTR(TEL,1,INSTR(TEL,')')-1) 지역번호,
    DECODE(
    SUBSTR(TEL,1,INSTR(TEL,')')-1),
    '02','서울',
    '031', '경기',
    '051','부산',
    '052','울산',
    '055','경남')지역명,
    --DECODE(SUBSTR(TEL,1,3),'02','서울','031','경기'
    --DECODE(SUBSTR(TEL, 2, INSTR(TEL,')')-2),02,'SEOUL',031,'GYEONGGI',051,'BUSAN',052,'ULSAN',055,'GYEONGNAM')지역명
    FROM STUDENT
    WHERE DEPTNO1=101;

SELECT
    NAME,
    TEL,
    CASE REGEXP_SUBSTR(TEL, '\d+', 1, 1)
        WHEN '02'  THEN 'SEOUL'
        WHEN '031' THEN 'GYEONGGI'
        WHEN '051' THEN 'BUSAN'
        WHEN '052' THEN 'ULSAN'
        WHEN '055' THEN 'GYEONGNAM'
        ELSE 'UNKNOWN'
    END AS 지역
FROM STUDENT
WHERE deptno1 = 101;










