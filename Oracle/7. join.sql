----------------------------------------------------
--PPT 244P 책 70P      조인(JOIN)
--JOIN하려면? 자료형, 길이, 데이터가 같아야

SELECT LPROD_GU
     , LPROD_NM
FROM LPROD;
--JOIN할 집합 1

SELECT PROD_ID
     , PROD_LGU
     , PROD_NAME
FROM PROD;
--JOIN할 집합 2

--PPT 247P 1. CARTESIAN PRODUCT(카티션곱: 모든 가능한 행들의 조합)
--물리적으로 합쳐지는 것이 아닌, 논리적으로(가상으로) 합쳐지는 것(합쳐진 것 처럼 보일 뿐)

SELECT LPROD_GU
     , LPROD_NM
     , PROD_ID
     , PROD_LGU
     , PROD_NAME
FROM LPROD, PROD;

--LPROD와 BUYER 카티션곱
SELECT LPROD_GU
     , LPROD_NM
FROM LPROD;
--JOIN할 집합 1. 9행

SELECT BUYER_ID
     , BUYER_NAME
     , BUYER_LGU
FROM BUYER;
--JOIN할 집합 2. 13행

SELECT LPROD_GU
     , LPROD_NM
     , BUYER_ID
     , BUYER_NAME
     , BUYER_LGU
FROM LPROD, BUYER;
--5열, 9 * 13 = 117행

--PPT 248P 2. EQUAL(EQUI) JOIN(공통점을 찾아 조합)
--무엇이 무엇을 참조하는가(어떤 연결고리가 있는가) 찾아서 연결
--ERwin에서 관계선 더블클릭 - Rolename에 표기된 부분을 참고하면 좋다

SELECT LPROD_GU
     , LPROD_NM
     , BUYER_ID
     , BUYER_NAME
     , BUYER_LGU
FROM LPROD, BUYER
WHERE LPROD_GU = BUYER_LGU;
--상품분류코드가 같은 것만 찾으면? 데이터가 올바르게 나온다

--JOIN조건(WHERE절) : JOIN은 서로 관계(연결고리)가 있어야 가능

SELECT BUYER_ID
     , BUYER_NAME
     , PROD_ID
     , PROD_NAME
     , PROD_BUYER
FROM BUYER, PROD
WHERE  BUYER_ID = PROD_BUYER;

--(참고) 기본키/외래키 설정 없이는 개체간 관계를 설정할 수 없다

SELECT P.PROD_ID                        -- 여기에 다 달아준다
     , P.PROD_NAME
     , P.PROD_BUYER
     , BP.BUY_DATE
     , BP.BUY_PROD
     , BP.BUY_QTY
     , BP.BUY_COST
     , B.BUYER_ID
     , B.BUYER_NAME
FROM PROD P, BUYPROD BP, BUYER B        -- 여기서 부여하고
WHERE P.PROD_ID = BP.BUY_PROD
AND B.BUYER_ID = P.PROD_BUYER;

--TABLE ALIAS.  일반 ALIAS처럼 AS는 쓰지 않는다
--구별을 위해 사용하는 것을 권장


--관계가 있다면 3개 이상도 가능
SELECT PROD_ID
     , PROD_NAME
     , CART_PROD
     , CART_MEMBER
     , CART_QTY
     , MEM_ID
     , MEM_NAME
FROM PROD , CART, MEMBER
WHERE PROD_ID = CART_PROD AND CART_MEMBER = MEM_ID;

SELECT PROD_ID
     , PROD_NAME
     , BUYER_NAME
     , BUY_QTY
     , CART_QTY
     , MEM_NAME
FROM PROD, BUYER, BUYPROD, CART, MEMBER
WHERE PROD_BUYER = BUYER_ID
AND PROD_ID = BUY_PROD
AND PROD_ID = CART_PROD
AND CART_MEMBER = MEM_ID;

--다대다 관계 JOIN? 가능은 하나 좋지 않다(CART와 BUYPROD JOIN)등

--72P
--상품테이블에서 거래처가 '삼성전자'인 자료의 상품코드, 상품명, 거래처명을 조회
--먼저 물리명을 확인. PROD_ID, PROD_NAME, BUYER_NAME
SELECT P.PROD_ID
     , P.PROD_NAME
     , B.BUYER_NAME
FROM PROD P, BUYER B
WHERE PROD_BUYER = BUYER_ID
AND B.BUYER_NAME = '삼성전자';

--EQUI JOIN을 ANSI표준인 INNER JOIN으로 바꾸기
--, 대신 INNER JOIN을 쓴다. WHERE대신 ON을 쓴다. 합쳐서 INNER JOIN ON
SELECT P.PROD_ID
     , P.PROD_NAME
     , B.BUYER_NAME
FROM PROD P INNER JOIN BUYER B ON(P.PROD_BUYER = B. BUYER_ID)
AND B.BUYER_NAME = '삼성전자';

/*
JOIN의 종류 다섯가지(PPT 244P) 암기 필요. 이건 오라클 사투리.
1. CARTESIAN PRODUCT 모든 가능한 행들의 조합
2. EQUI JOIN (기본키/외래키)조건이 일치하는 컬럼을 매칭. "중요"
3. NON-EQUI JOIN 조건절에서 JOIN조건이 '='아닌 다른 연산기호로 주어질 때
4. OUTER JOIN 조건이 일치하지 않더라도 모든 행을 검색할 때. (+)로 표시. "중요"
5. SELF JOIN 한 테이블 내에서 JOIN하는 경우
CENOS 로 암기

246P ANSI JOIN 표준말. 역시 숙지 필요
1. CROSS JOIN
2. NATURAL JOIN
3. INNER JOIN
4. OUTER JOIN
*/
--장바구니번호, 상품코드, 구입개수, 회원ID, 회원명
--사용테이블 : CART, MEMBER
--단 2005년도 4월 데이터로 한정. 상품코드를 상품분류코드로 바꾸기, 장바구니번호를
--년월로 바꾸기. 월별, 상품분류별, 회원별, 구입개수합계를 구하기

SELECT SUBSTR(C.CART_NO,1,6)      장바구니번호    --CART_NO가 문자형이라 EXTRACT를 쓸 수 없다
     , SUBSTR(C.CART_PROD,1,4)    상품코드
     , C.CART_MEMBER              회원ID
     , M.MEM_NAME                 회원명
     , SUM(C.CART_QTY)            구입개수      --집계함수 이외의 컬럼은 GROUP BY절에 기술해라!
FROM CART C, MEMBER M
WHERE C.CART_MEMBER = M.MEM_ID
AND SUBSTR(C.CART_NO,1,6) = '200504'    --AND CART_NO LIKE '200504%' 쪽이 같은 기능이면서 간결
GROUP BY SUBSTR(C.CART_NO,1,6)
     , SUBSTR(C.CART_PROD,1,4)
     , C.CART_MEMBER
     , M.MEM_NAME
ORDER BY 1, 2;
/*
참고) AND쪽 두 가지를 쿼리박스로 분석시
LIKE 쓸 경우 별도 캐시에 인덱스가 자동 생성됨. 인덱스로 RANGE SCAN해서 찾음
SUBSTR 쓸 경우 인덱스가 깨지고 옵티마이저가 TABLE ACCESS FULL로 찾음. 하지만 더 빠르다. 빠른 쪽을 쓰는 게 좋음.
보통은 인덱스가 살아있을 때 속도가 빠르다. 이 경우는 예외
*/

--상품테이블에서 상품코드, 상품명, 분류명(분류 관련 정보는 LPROD테이블), 거래처명, 거래처주소를 조회
--판매가격이 10만원 이하이고 거래처주소가 부산인 경우만 조회

SELECT P.PROD_ID      상품코드
     , P.PROD_NAME    상품명
     , L.LPROD_NM     분류명
     , B.BUYER_NAME   거래처명
     , B.BUYER_ADD1 || ' ' || B.BUYER_ADD2  거래처주소
FROM PROD P, BUYER B, LPROD L
WHERE P.PROD_BUYER = B.BUYER_ID
AND L.LPROD_GU = P.PROD_LGU
AND P.PROD_SALE <= 100000
AND B.BUYER_ADD1 LIKE '부산%';

--상품분류가 전자제품(P102)인 상품의 상품코드, 상품명, 분류명, 거래처명을 조회
SELECT P.PROD_ID          상품코드
     , P.PROD_NAME        상품명
     , L.LPROD_NM         분류명
     , B.BUYER_NAME       거래처명
FROM PROD P, LPROD L, BUYER B
WHERE P.PROD_BUYER = B.BUYER_ID
AND L.LPROD_GU = P.PROD_LGU
AND L.LPROD_GU = 'P102';

--ANSI표준으로
SELECT P.PROD_ID          상품코드
     , P.PROD_NAME        상품명
     , L.LPROD_NM         분류명
     , B.BUYER_NAME       거래처명
FROM PROD P INNER JOIN LPROD L ON(L.LPROD_GU = P.PROD_LGU)
            INNER JOIN BUYER B ON(P.PROD_BUYER = B.BUYER_ID)
AND L.LPROD_GU = 'P102';

/*
상품입고테이블(BUYPROD)의 2005년도 1월의 거래처별(거래처코드 BUYER_ID 거래처명 BUYER_NAME)
매입금액을 검색하시오.
매입금액=매입수량(BUY_QTY) * 매입단가(PROD_COST)
ALIAS 거래처코드, 거래처명, 매입금액
*/
SELECT B.BUYER_ID             거래처코드
     , B.BUYER_NAME           거래처명
     , SUM(BP.BUY_QTY * P.PROD_COST)  매입금액
FROM BUYER B, BUYPROD BP , PROD P -- FROM BUYER CROSS JOIN BUYPROD CROSS JOIN PROD 이렇게 쓰면 ANSI표준
WHERE BP.BUY_PROD = P.PROD_ID
AND P.PROD_BUYER = B.BUYER_ID
AND BUY_DATE LIKE '05/01/%'
GROUP BY BUYER_ID, BUYER_NAME
ORDER BY 1;

--ANSI 표준으로
SELECT B.BUYER_ID             거래처코드
     , B.BUYER_NAME           거래처명
     , SUM(BP.BUY_QTY * P.PROD_COST)  매입금액
FROM PROD P  INNER JOIN BUYPROD BP ON(BP.BUY_PROD = P.PROD_ID)
             INNER JOIN BUYER B ON(P.PROD_BUYER = B.BUYER_ID)
--FROM BUYER B INNER JOIN PROD P ON(B.BUYER_ID = P.PROD_BUYER)
--              INNER JOIN BUYPROD BP(P.PROD_ID = 
AND BUY_DATE LIKE '05/01/%'
--BP.BUY_DATE           BETWEEN 도 사용 가능
GROUP BY BUYER_ID, BUYER_NAME
ORDER BY 1;

/*
70P 장바구니테이블(CART)의 2005년도 5월의 회원별 구매금액을 검색
구매금액 = 구매수량(CART_QTY) * 판매가(PROD_SALE)
ALIAS 회원ID(MEM_ID), 회원명(MEM_NAME), 구매금액
EQUI JOIN, INNER JOIN모두 사용
*/
SELECT MEM_ID           회원ID
     , MEM_NAME         회원명
     , SUM(CART_QTY * PROD_SALE)     구매금액
FROM CART, MEMBER, PROD
WHERE CART_MEMBER = MEM_ID
AND CART_PROD = PROD_ID
AND CART_NO LIKE '200505%'
GROUP BY MEM_ID, MEM_NAME
ORDER BY 1;

--ANSI표준으로
SELECT M.MEM_ID           회원ID
     , M.MEM_NAME         회원명
     , SUM(C.CART_QTY * P.PROD_SALE)     구매금액
FROM CART C INNER JOIN MEMBER M ON(CART_MEMBER = MEM_ID)    --TABLE ALIAS 빼먹지 않도록
          INNER JOIN PROD P ON(CART_PROD = PROD_ID)
AND C.CART_NO LIKE '200505%'
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY 1;

----------------------------------------------------
/*
책 72P PPT 259P OUTER JOIN(EQUI JOIN과 함께 가장 중요한 방법)
JOIN조건: 보통은 1. 기본키와 외래키(필수는 아니나 무결성을 지키기 위해 필요함)
                2. 자료형, 크기가 동일해야
                3. 같은 데이터가 들어 있어야
EQUI JOIN시 한 쪽에 없는 데이터는 자동으로 걸러짐
모두 포함시키고자 한다면 OUTER JOIN을 사용해야 한다.
<OUTER JOIN의 종류>
    1. 왼쪽 외부 조인(LEFT OUTER JOIN): JOIN할 테이블 중 왼쪽에 무게를 실어준다
        JOIN결과물에 왼쪽 테이블의 모든 정보 포함. 오른쪽 테이블에 (+)가 붙음.
    2. 오른쪽 외부 조인(RIGHT OUTER JOIN): JOIN할 테이블 중 오른쪽에 무게를 실어준다
        JOIN결과물에 오른쪽 테이블의 모든 정보 포함. 왼쪽 테이블에 (+)가 붙음.
        EQUI JOIN시 이미 오른쪽 테이블의 데이터가 모두 포함되어 있다. 그래서 큰 의미는 없음
    3. 완전 외부 조인(FULL OUTER JOIN 합집합): JOIN할 테이블 양쪽 모두를 포함한다.
        왼쪽, 오른쪽 외부 조인을 각각 작성 후 UNION으로 결합.
        이 때 중복부분은 1회 출력되고 결과물은 자동정렬.
        UNION ALL: 중복부분도 모두 출력되고 결과물은 자동정렬되지 않음.
        INTERSECT(교집합): JOIN할 테이블간 중복 부분만 출력.
        MINUS(차집합): JOIN할 테이블 중 A - B하고 남는 부분만 출력.      -- 집합 연산자 부분(책68P) 참고
*/

--1. S테이블 생성 후 기본키는 C / 컬럼 : C, D, E
CREATE TABLE S(
   C VARCHAR2(5),
   D VARCHAR2(5),
   E VARCHAR2(5),
   CONSTRAINT PK_S PRIMARY KEY(C)
);

--2. R테이블 생성 후 기본키는 A / 컬럼 : A, B, C
CREATE TABLE R(
   A VARCHAR2(5),
   B VARCHAR2(5),
   C VARCHAR2(5),
   CONSTRAINT PK_R PRIMARY KEY(A)
);

--3. R테이블에 데이터 입력
INSERT INTO R(A, B, C) VALUES('a1','b1','c1');
INSERT INTO R(A, B, C) VALUES('a2','b2','c2');

--4. S테이블에 데이터 입력
INSERT INTO S(C, D, E) VALUES('c1','d1','e1');
INSERT INTO S(C, D, E) VALUES('c3','d2','e2');

--TCL(Transaction Control Language)
--COMMIT : 기존 트랜잭션이 종료되고 새로운 트랜잭션이 시작됨
COMMIT;

--데이터 확인하기
SELECT * FROM R;
SELECT * FROM S;

--5. 두 테이블을 EQUI JOIN, INNER JOIN처리
--EQUI JOIN
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM R, S
WHERE R.C = S.C;
--ANSI표준 INNER JOIN
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM   R INNER JOIN S ON(R.C = S.C);

--6. 왼쪽 외부 조인(LEFT OUTER JOIN)
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM R, S
WHERE R.C = S.C(+);
--ANSI표준 LEFT OUTER JOIN
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM   R LEFT OUTER JOIN S ON(R.C = S.C);

--7. R테이블과 S테이블을 오른쪽 외부조인
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM R, S
WHERE R.C(+) = S.C;
--ANSI표준 RIGHT OUTER JOIN
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM   R RIGHT OUTER JOIN S ON(R.C = S.C);

--8. R테이블과 S테이블을 완전 외부 조인
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM R, S
WHERE R.C(+) = S.C
UNION
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM R, S
WHERE R.C = S.C(+);
--ANSI표준 FULL OUTER JOIN
SELECT R.A, R.B, R.C, S.C, S.D, S.E
FROM   R FULL OUTER JOIN S ON(R.C = S.C);


--DEPART, STUDENT 테이블을 통해 OUTER JOIN 연습
--1. DEPART 테이블 생성
CREATE TABLE DEPART(
    DEP_CODE VARCHAR2(10),
    DEP_NAME VARCHAR2(10),
    CONSTRAINT PK_DEPART PRIMARY KEY(DEP_CODE)
);
--2. STUDENT 테이블 생성
--PK: STUD_NO FK: STUD_DEP(DEPART의 DEP_CODE컬럼 참조) / 컬럼: STUD_NO, STUD_NAME STUD_DEP
CREATE TABLE STUDENT(
    STUD_NO VARCHAR2(10),
    STUD_NAME VARCHAR2(10),
    STUD_DEP VARCHAR2(10),
    CONSTRAINT PK_STUDENT PRIMARY KEY (STUD_NO),
    CONSTRAINT FK_STUD_DEP FOREIGN KEY (STUD_DEP) REFERENCES DEPART (DEP_CODE)
);
--마지막 행을 분리해서 쓸 수도 있다.
--ALTER TABLE STUDENT
--ADD(CONSTRAINT FK_STUD_DEP FOREIGN KEY (STUD_DEP) REFERENCES DEPART (DEP_CODE));

--3. DEPART 데이터 입력하기
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('201','12월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('202','5월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('203','4월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('204','1월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('205','3월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('206','6월반');
INSERT INTO DEPART(DEP_CODE, DEP_NAME) VALUES('207','11월반');

COMMIT;
--4. STUDENT 데이터 입력하기
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP)
VALUES('2006120001','박서경','206');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP)
VALUES('2006120002','정요한','206');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP)
VALUES('2006120003','박영춘','205');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP)
VALUES('2006120004','유다연','201');
INSERT INTO STUDENT(STUD_NO,STUD_NAME,STUD_DEP)
VALUES('2006120005','유민하','202');

COMMIT;

--5. DEPART테이블과 STUDENT테이블을 EQUI JOIN & INNER JOIN 모든 컬럼 포함
SELECT D.DEP_CODE, D.DEP_NAME, S.STUD_NO, S.STUD_NAME, S.STUD_DEP
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP;

SELECT D.DEP_CODE, D.DEP_NAME, S.STUD_NO, S.STUD_NAME, S.STUD_DEP
FROM DEPART D INNER JOIN STUDENT S ON(D.DEP_CODE = S.STUD_DEP);

--6. DEPART테이블과 STUDENT테이블을 왼쪽 외부조인. 모든 컬럼 포함
SELECT D.DEP_CODE, D.DEP_NAME, S.STUD_NO, S.STUD_NAME, S.STUD_DEP
--SELECT * 로 간단하게 쓸 수도 있다. 하지만 보안상 컬럼명을 써주는 것을 권장
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE = S.STUD_DEP(+)
ORDER BY 1;

SELECT D.DEP_CODE, D.DEP_NAME, S.STUD_NO, S.STUD_NAME, S.STUD_DEP
FROM DEPART D LEFT OUTER JOIN STUDENT S
ON(D.DEP_CODE = S.STUD_DEP)
ORDER BY 1;

--7. DEPART테이블과 STUDENT테이블을 오른쪽 외부조인. 모든 컬럼 포함
SELECT *
FROM DEPART D, STUDENT S
WHERE D.DEP_CODE(+) = S.STUD_DEP;

SELECT *
FROM DEPART D RIGHT OUTER JOIN STUDENT S
ON(D.DEP_CODE = S.STUD_DEP);

--8. DEPART테이블과 STUDENT테이블을 완전 외부조인.
SELECT STUD_NO      학번
     , STUD_NAME    이름
     , DEP_CODE     반번호
     , DEP_NAME     반이름
FROM STUDENT, DEPART
WHERE STUD_DEP = DEP_CODE(+)
UNION
SELECT STUD_NO
     , STUD_NAME
     , DEP_CODE
     , DEP_NAME
FROM STUDENT, DEPART
WHERE STUD_DEP(+) = DEP_CODE;

SELECT STUD_NO      학번
     , STUD_NAME    이름
     , DEP_CODE     반번호
     , DEP_NAME     반이름
FROM DEPART FULL OUTER JOIN STUDENT ON(STUD_DEP = DEP_CODE);

--72P 전체 분류의 상품자료 수를 검색 조회(ALIAS 분류코드, 분류명, 상품자료수)

SELECT L.LPROD_GU     분류코드
     , L.LPROD_NM     분류명
     , COUNT(P.PROD_ID)      상품자료수
FROM LPROD L, PROD P
WHERE L.LPROD_GU = P.PROD_LGU(+)
GROUP BY L.LPROD_GU, L.LPROD_NM
ORDER BY 1;

--ANSI표준
SELECT L.LPROD_GU            분류코드
     , L.LPROD_NM            분류명
     , COUNT(P.PROD_ID)      상품자료수
FROM LPROD L LEFT OUTER JOIN PROD P
ON(L.LPROD_GU=P.PROD_LGU)
GROUP BY L.LPROD_GU, L.LPROD_NM
ORDER BY 1;

--74P 전체상품의 2005년 1월 입고수량을 검색 조회(ALIAS 상품코드, 상품명, 입고수량)
--OUTER JOIN형태
SELECT P.PROD_ID             상품코드
     , P.PROD_NAME           상품명
     , BP.BUY_QTY            입고수량
FROM PROD P, BUYPROD BP
WHERE P.PROD_ID = BP.BUY_PROD(+)
AND BP.BUY_DATE BETWEEN '05/01/01' AND '05/01/31'        -- BUY_DATE는 날짜형. BETWEEN 사용가능.
ORDER BY 1;
/*
OUTER JOIN은 WHERE행에서 끝. 뒤에 AND가 붙어버리면 OUTER JOIN이 깨짐
날짜 한정이 뒤에 들어오면 모든 상품이 아니게 된다. OUTER JOIN의 의미가 사라짐
해결법은 ANSI 표준을 쓰는 것
AND행을 없애면 왜 카디널리티가 더 늘어나나? 같은 상품이 여러개 나와서
*/
SELECT P.PROD_ID             상품코드
     , P.PROD_NAME           상품명
     , BP.BUY_QTY            입고수량
FROM PROD P LEFT OUTER JOIN BUYPROD BP
ON(P.PROD_ID=BP.BUY_PROD AND BP.BUY_DATE BETWEEN '05/01/01' AND '05/01/31')
-- ANSI표준 시 JOIN조건 이외의 조건이 ON안에 들어감. ON안에 들어가면 OUTER JOIN도중에 조건을 고려한다.
--마찬가지로 ON뒤로 빼면 OUTER JOIN의 의미가 사라짐.
ORDER BY 1;

--76P 전체 회원의 2005년도 4월의 구매현황 조회(회원ID, 성명, 구매수량의 합)
SELECT M.MEM_ID              회원ID
     , M.MEM_NAME            성명
     , SUM(C.CART_QTY)       구매수량의합
FROM MEMBER M, CART C
WHERE M.MEM_ID = C.CART_MEMBER(+)
AND C.CART_NO LIKE '200504%'
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY 1;

--LIKE조건과 OUTER JOIN을 함께 적용시킬 수 없으므로 ANSI표준 이용

SELECT M.MEM_ID              회원ID
     , M.MEM_NAME            성명
     , NVL(SUM(C.CART_QTY),0)       구매수량의합
--NVL: NULL이 있으면 지정한 값으로 바꿔라
FROM MEMBER M LEFT OUTER JOIN CART C
ON(M.MEM_ID = C.CART_MEMBER AND C.CART_NO LIKE '200504%')
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY 1;

--76P 전체 상품의 2005년도 5월 5일의 입고, 출고현황 조회(상품코드, 상품명, 입고수량의합, 판매수량의합)
--전체 상품이 창고에 몇 개 들어왔냐? & 그 상품이 몇 개 팔렸냐? 를 찾는 문제
SELECT P.PROD_ID            상품코드
     , P.PROD_NAME          상품명
     , SUM(BP.BUY_QTY)      입고수량의합
     , SUM(C.CART_QTY)      판매수량의합
FROM PROD P, BUYPROD BP, CART C
WHERE P.PROD_ID = BP.BUY_PROD
AND P.PROD_ID = C.CART_PROD
AND BP.BUY_DATE = '05/05/05'
AND C.CART_NO LIKE '20050505%'
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY 1; -- 불완전. ANSI표준으로

SELECT P.PROD_ID            상품코드
     , P.PROD_NAME          상품명
     , NVL(SUM(BP.BUY_QTY),0)      입고수량의합
     , NVL(SUM(C.CART_QTY),0)      판매수량의합
FROM PROD P LEFT OUTER JOIN BUYPROD BP ON(P.PROD_ID = BP.BUY_PROD AND BP.BUY_DATE = '05/05/05')
            LEFT OUTER JOIN CART C     ON(P.PROD_ID = C.CART_PROD AND C.CART_NO LIKE '20050505%')
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY 1;

--OUTER JOIN문제
--전체 상품분류에 해당하는 상품분류별 판매가의 합계는?(상품분류코드, 상품분류명, 판매가합)

SELECT L.LPROD_GU                  상품분류코드
     , L.LPROD_NM                  상품분류명
     , NVL(SUM(P.PROD_SALE),0)     판매가합
FROM LPROD L, PROD P
WHERE L.LPROD_GU = P.PROD_LGU(+)
--이게 없으면 EQUI JOIN. 전체 상품분류가 나오지 않았기 때문에 LEFT OUTER JOIN이 필요하다
GROUP BY L.LPROD_GU, L.LPROD_NM
ORDER BY 1;

SELECT L.LPROD_GU                  상품분류코드
     , L.LPROD_NM                  상품분류명
     , NVL(SUM(P.PROD_SALE),0)     판매가합
FROM LPROD L LEFT OUTER JOIN PROD P ON(L.LPROD_GU = P.PROD_LGU)
GROUP BY L.LPROD_GU, L.LPROD_NM
ORDER BY 1;

--전체 회원별 판매금액(판매가 * 구매수량)의 합계를 구하기(회원ID, 회원명, 판매금액)
--단, 상품분류코드가 P201인 상품으로 제한
SELECT M.MEM_ID                     회원ID
     , M.MEM_NAME                   회원명
     , SUM(P.PROD_SALE*C.CART_QTY)  판매금액
FROM MEMBER M, CART C, PROD P
WHERE M.MEM_ID = C.CART_MEMBER(+)
AND P.PROD_ID(+) = C.CART_PROD
--AND P.PROD_LGU = 'P201'
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY 1;

SELECT M.MEM_ID                                           회원ID
     , M.MEM_NAME                                         회원명
     , TO_CHAR(NVL(SUM(P.PROD_SALE*C.CART_QTY),0))||'원'  판매금액 -- 뒤에 문자를 붙이기 위해 문자형으로 형변환하고 ||연결
--FROM CART C LEFT OUTER JOIN MEMBER M ON(M.MEM_ID = C.CART_MEMBER)
--            LEFT OUTER JOIN PROD P   ON(P.PROD_ID = C.CART_PROD AND P.PROD_LGU = 'P201')
FROM MEMBER M LEFT OUTER JOIN CART C ON(M.MEM_ID = C.CART_MEMBER)
              LEFT OUTER JOIN PROD P ON(P.PROD_ID = C.CART_PROD AND P.PROD_LGU = 'P201')
-- 전체 회원을 출력하는 것이 기준이므로 회원에 하나를 먼저 JOIN하고 다른 하나도 JOIN하는 것이 맞다
GROUP BY M.MEM_ID, M.MEM_NAME
ORDER BY 1;
--------------------------------------------------------------
--          NON-EQUI JOIN('='이 없는 JOIN)

-- 점수로 학점 구하기
SELECT * FROM HAKJUM;   
SELECT * FROM EXAM_01;

SELECT E.STUDNO
     , E.TOTAL
     , H.GRADE
FROM EXAM_01 E, HAKJUM H
WHERE E.Total BETWEEN H.MIN_POINT AND H.MAX_POINT
ORDER BY 1;

--연봉으로 예상 직급 구하기
SELECT E.EMPNO      직원번호
     , E.NAME       직원명
     , NVL(E.POSITION,'---')   현직급
     , E.PAY        연봉
     , P.POSITION   예상직급
FROM EMP2 E, P_GRADE P
WHERE E.PAY BETWEEN P.S_PAY AND P.E_PAY;

SELECT * FROM P_GRADE;
SELECT * FROM EMP2;

SELECT S.STUDIO, S.NAME, S.PROFNO, P.PROFNAME
FROM STUDENT S, PROFESSOR P
WHERE S.PROFNO = P.PROFNO;

SELECT S.STUDIO, S.NAME, S.PROFNO, P.PROFNAME
FROM STUDENT S
INNER JOIN PROFESSOR P ON(S.PROFNO = P.PROFNO);

--ANSI표준의 NATURAL JOIN (컬럼이 단 하나 같을 때, JOIN조건을 생략할 수 있는 것) JOIN조건 앞에 ALIAS를 붙이지 않는다
SELECT STUDIO, NAME, PROFNO, PROFNAME
FROM STUDENT NATURAL JOIN PROFESSOR;

SELECT S.STUDIO, S.NAME, PROFNO, P.PROFNAME
FROM STUDENT S NATURAL JOIN PROFESSOR P;
/*
ALTER TABLE PROFESSOR
RENAME COLUMN NAME TO PROFNAME;

ALTER TABLE PROFESSOR
RENAME COLUMN ID TO PROFID;
*/

--------------------------------------------------------------
/*
77P                  SELF JOIN
테이블 별명(ALIAS)을 사용하여 마치 2개의 TABLE인 것 처럼 자신의 TABLE과 자신의 TABLE을 JOIN하여 검색
이름은 하난데 별명은 여러개
*/

--77P 회원ID가 'h001(라준호)'인 고객의 마일리지 점수보다 점수가 높은 회원만 검색
--ALIAS 회원ID, 성명, 마일리지

SELECT B.MEM_ID         회원ID        --B집합에서 결과를 가져오므로 B집합을 써 준다
     , B.MEM_NAME       성명
     , B.MEM_MILEAGE    마일리지
FROM MEMBER A, MEMBER B
WHERE A.MEM_ID = 'h001'            --A집합에서 ID가 일치하는 회원으로 비교할 값을 한정
AND B.MEM_MILEAGE >= A.MEM_MILEAGE;
-- B.MEM_MILEAGE>=1500으로 처리하면 일단 되지만, 가변적이어야 더 적합하다

--거래처코드가 'P30203(참존)'과 동일지역에 속한 거래처만 검색조회
--ALIAS 거래처코드 거래처 주소
SELECT B.BUYER_ID                          거래처코드
     , B.BUYER_NAME                        거래처
     , B.BUYER_ADD1 || ' ' || B.BUYER_ADD2 주소
FROM BUYER A, BUYER B
WHERE A.BUYER_ID = 'P30203'
AND SUBSTR(A.BUYER_ADD1,1,2) = SUBSTR(B.BUYER_ADD1,1,2);

--라준호 회원의 직업과 동일한 직업을 가진 회원의 리스트 출력
--회원ID, 회원명, 직업

SELECT B.MEM_ID         회원ID
     , B.MEM_NAME       회원명
     , B.MEM_JOB        직업
FROM MEMBER A, MEMBER B
WHERE A.MEM_NAME = '라준호'        --비교할 값을 하나로 한정
AND B.MEM_JOB = A.MEM_JOB;

--회원ID가 'r001'인 고객의 2005년도 월별 구매현황 조회
--회원ID, 성명, 주민등록번호, 구매월, 구매총액
SELECT M.MEM_ID                   회원ID
     , M.MEM_NAME                 성명
     , M.MEM_REGNO1 || M.MEM_REGNO2 주민등록번호
     , SUBSTR(C.CART_NO,1,6)      구매월
     , SUM(P.PROD_SALE*C.CART_QTY)  구매총액
FROM MEMBER M, CART C, PROD P
WHERE M.MEM_ID = 'r001'
AND M.MEM_ID = C.CART_MEMBER
AND P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'        -- 2005년도 조건
GROUP BY M.MEM_ID, M.MEM_NAME, M.MEM_REGNO1 || M.MEM_REGNO2, SUBSTR(C.CART_NO,1,6);

--거래처(BUYER)별 2005년도 거래현황을 파악하여 결과가 0원인 거래처에 대해서는
--다음 년도에 계약해지. 데이터 생성
--(거래현황 : 입고가격의 합 SUM(PROD_COST)) (ALIAS: 거래처ID, 거래처명, 거래현황)
SELECT B.BUYER_ID         거래처ID
     , B.BUYER_NAME       거래처명
     , SUM(P.PROD_COST)   거래현황
FROM BUYER B, PROD P, BUYPROD BP
WHERE B.BUYER_ID = P.PROD_BUYER(+)
AND P.PROD_ID = BP.BUY_PROD(+)
AND BP.BUY_DATE LIKE '05/%'
GROUP BY B.BUYER_ID, B.BUYER_NAME;
/*
여기서 거래현황은? 어떤 상품을 누구한테 사서 언제, 몇개를, 얼마에 샀는가?
BUY_COST와 BUYER_ID연결이 필요하다 -> 직접 관계 X -> PROD와 함께 JOIN
결과는? 거래현황이 0원인 것. 찾아서 BUYER TABLE의 모든 정보를 최종 결과에 포함시켜야 한다. -> OUTER JOIN
OUTER JOIN과 추가검색을 함께 쓸 수 없으므로 ANSI표준 이용
*/
SELECT B.BUYER_ID                 거래처ID
     , B.BUYER_NAME              거래처명
     , NVL(SUM(P.PROD_COST),0)   거래현황
FROM BUYER B LEFT OUTER JOIN PROD P ON(B.BUYER_ID = P.PROD_BUYER)
             LEFT OUTER JOIN BUYPROD BP ON(P.PROD_ID = BP.BUY_PROD AND BP.BUY_DATE LIKE '05/%')
GROUP BY B.BUYER_ID, B.BUYER_NAME;

--2005년도 상품의 판매 총합계 현황을 조회          -- '모든'이 없으면 굳이 OUTER JOIN하지 않아도 무방
--(상품코드, 상품명, 판매수량, 판매금액(판매가 * 판매수량))

SELECT P.PROD_ID                         상품코드
     , P.PROD_NAME                       상품명
     , SUM(C.CART_QTY)                   판매수량
     , SUM(P.PROD_SALE * C.CART_QTY)     판매금액
FROM PROD P, CART C
WHERE P.PROD_ID = C.CART_PROD
AND SUBSTR(C.CART_NO,1,4) = 2005        -- C.CART_NO LIKE '2005%'도 가능
GROUP BY P.PROD_ID, P.PROD_NAME
ORDER BY 1;
/*
(추가)단, 판매수량이 10개 이상이면서 판매금액이 1000만원 이상인 데이터를 구하기
(GROUP BY 이후의 결과를 가지고 따지기 => GROUP BY 절 후에 조건이 와야 한다)
하지만 WHERE는 이미 집계 완료 상태라 쓸 수 없다. => 집계함수 자체에 조건 걸기 : HAVING
*/
SELECT P.PROD_ID                         상품코드
     , P.PROD_NAME                       상품명
     , SUM(C.CART_QTY)                   판매수량
     , SUM(P.PROD_SALE * C.CART_QTY)     판매금액
FROM PROD P, CART C
WHERE P.PROD_ID = C.CART_PROD
AND SUBSTR(C.CART_NO,1,4) = 2005
GROUP BY P.PROD_ID, P.PROD_NAME
HAVING SUM(C.CART_QTY) >= 10
AND SUM(P.PROD_SALE * C.CART_QTY) >= 10000000
ORDER BY 1;

--2005년도 월별 모든 상품분류별 매출 현황을 검색
--ALIAS 월(CART_NO) 상품분류(LPROD_NM) 매출금액(PROD_SALE * CART_QTY)
SELECT SUBSTR(C.CART_NO,5,2)                       월
     , L.LPROD_NM                                  상품분류
     , NVL(SUM(P.PROD_SALE * C.CART_QTY),0)        매출금액
FROM CART C, LPROD L, PROD P
WHERE P.PROD_ID = C.CART_PROD(+)
AND L.LPROD_GU = P.PROD_LGU(+)
AND C.CART_NO LIKE '2005%'
GROUP BY SUBSTR(C.CART_NO,5,2), L.LPROD_NM
ORDER BY 1,2;
--여기서 CART_NO는 언제 팔렸냐? LPROD_NM은 어떤 분류 상품이냐? 매출금액은 얼마짜리 상품이 몇 개 팔렸냐?
--ANSI표준으로 바꾸면
SELECT SUBSTR(C.CART_NO,5,2)                       월
     , L.LPROD_NM                                  상품분류
     , NVL(SUM(P.PROD_SALE * C.CART_QTY),0)        매출금액
FROM LPROD L LEFT OUTER JOIN PROD P ON(L.LPROD_GU = P.PROD_LGU)
             LEFT OUTER JOIN CART C ON(P.PROD_ID = C.CART_PROD AND C.CART_NO LIKE '2005%')
GROUP BY SUBSTR(C.CART_NO,5,2), L.LPROD_NM
ORDER BY 1,2;

--(추가)단, 매출금액이 1000만원 초과하는 데이터는?
SELECT SUBSTR(C.CART_NO,5,2)                       월
     , L.LPROD_NM                                  상품분류
     , NVL(SUM(P.PROD_SALE * C.CART_QTY),0)        매출금액
FROM LPROD L LEFT OUTER JOIN PROD P ON(L.LPROD_GU = P.PROD_LGU)
             LEFT OUTER JOIN CART C ON(P.PROD_ID = C.CART_PROD AND C.CART_NO LIKE '2005%')
GROUP BY SUBSTR(C.CART_NO,5,2), L.LPROD_NM
HAVING SUM(P.PROD_SALE * C.CART_QTY) > 10000000
ORDER BY 1,2;

--159P 2005년도 판매된 상품 중 5회 이상의 판매횟수가 있는 상품 조회(상품코드, 상품명, 판매횟수-COUNT한 것)
SELECT P.PROD_ID            상품코드
     , P.PROD_NAME          상품명
     , COUNT(C.CART_NO)     판매횟수
FROM PROD P, CART C
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
GROUP BY P.PROD_ID, P.PROD_NAME
HAVING COUNT(C.CART_NO) >= 5
ORDER BY 1;

--75P 상품분류가 컴퓨터제품(P101)인 상품의 2005년도 일자별 판매 조회
--(판매일, 판매금액PROD_SALE * CART_QTY(5백만 초과일 경우만), 판매수량(CART_QTY))
SELECT SUBSTR(C.CART_NO,1,8)                 판매일
     , SUM(P.PROD_SALE * C.CART_QTY)         판매금액
     , SUM(C.CART_QTY)                       판매수량
FROM CART C, PROD P
WHERE P.PROD_ID = C.CART_PROD
AND P.PROD_LGU = 'P101'
AND C.CART_NO LIKE '2005%'
GROUP BY SUBSTR(C.CART_NO,1,8)
HAVING SUM(P.PROD_SALE * C.CART_QTY) > 5000000;

--75P 2005년도 판매일자(CART_NO), 판매총액(CART_QTY * PROD_SALE), 판매수량(CART_QTY),
--판매회수(COUNT(CART_NO))를 조회하시오
--단, 판매회수가 8개 이상, 판매총액이 500만 초과, 판매수량이 50초과
--ALIAS: 판매일, 판매금액, 판매수량, 판매회수
SELECT SUBSTR(C.CART_NO,1,8) 판매일
     , SUM(C.CART_QTY * P.PROD_SALE) 판매금액
     , SUM(C.CART_QTY) 판매수량
     , COUNT(C.CART_NO) 판매회수
FROM CART C, PROD P
WHERE P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
GROUP BY SUBSTR(C.CART_NO,1,8)
HAVING SUM(C.CART_QTY * P.PROD_SALE) > 5000000
AND SUM(C.CART_QTY) > 50
AND COUNT(C.CART_NO) >= 8
ORDER BY 1;

--2005년도 회원(MEMBER)직업 별 판매금액(판매가(PROD_SALE) * 판매개수(CART_QTY)) 조회
--ALIAS 직업 연도 지역 판매금액 / 지역은 대전, 판매금액은 2천만 이상
SELECT M.MEM_JOB                     직업
     , SUBSTR(C.CART_NO,1,4)         연도
     , SUBSTR(M.MEM_ADD1,1,2)        지역
     , SUM(P.PROD_SALE * C.CART_QTY) 판매금액
FROM MEMBER M, CART C, PROD P
WHERE M.MEM_ID = C.CART_MEMBER
AND P.PROD_ID = C.CART_PROD
AND C.CART_NO LIKE '2005%'
AND SUBSTR(M.MEM_ADD1,1,2) = '대전'
GROUP BY M.MEM_JOB, SUBSTR(C.CART_NO,1,4), SUBSTR(M.MEM_ADD1,1,2)
HAVING SUM(P.PROD_SALE * C.CART_QTY) >= 20000000;


