--OUTER JOIN 문제
--1. 대학정보테이블(COLLEAGE)
--대학코드, 대학명
CREATE TABLE COLLEAGE(
    COL_CODE VARCHAR2(10),
    COL_NAME VARCHAR2(30)
);

--2. 학과정보테이블(HAKGWA)
--학과코드, 학과명, 대학코드
CREATE TABLE HAKGWA(
    HAK_CODE VARCHAR2(10),
    HAK_NAME VARCHAR2(30),
    HAK_COLL VARCHAR2(10)
);

--3. 대학정보테이블의 대학코드를 기본키로 설정

ALTER TABLE COLLEAGE
ADD(CONSTRAINT PK_COLLEAGE PRIMARY KEY(COL_CODE));

--4. 학과정보테이블의 학과코드를 기본키로 설정
--   학과정보테이블의 대학코드가 대학정보테이블의 대학코드를 참조하는 외래키로 설정

ALTER TABLE HAKGWA
ADD(CONSTRAINT PK_HAKGWA PRIMARY KEY(HAK_CODE),
    CONSTRAINT FK_HAK_COLL FOREIGN KEY (HAK_COLL) REFERENCES COLLEAGE (COL_CODE)
);
--5. 대학정보테이블에 다음 데이터를 INSERT 하기
--W01 솔아시아매니지먼트
--W02 외식조리
--W03 철도물류
--W04 디지털미디어
--W05 보건복지
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W01','솔아시아매니지먼트');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W02','외식조리');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W03','철도물류');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W04','디지털미디어');
INSERT INTO COLLEAGE(COL_CODE, COL_NAME) VALUES('W05','보건복지');

--6. 학과정보테이블에 다음 데이터를 INSERT 하기
--H001 외식조리학과 W02
--H002 호텔관광경영학과 W02
--H003 철도경영학과 W03
--H004 간호학과 W05
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, HAK_COLL) VALUES('H001','외식조리학과','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, HAK_COLL) VALUES('H002','호텔관광경영학과','W02');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, HAK_COLL) VALUES('H003','철도경영학과','W03');
INSERT INTO HAKGWA(HAK_CODE, HAK_NAME, HAK_COLL) VALUES('H004','간호학과','W05');

--7. 대학정보테이블과 학과정보테이블을 내부조인하여 SELECT
SELECT *
FROM COLLEAGE C, HAKGWA H
WHERE C.COL_CODE = H.HAK_COLL;

--8. 대학정보테이블의 모든 데이터를 출력하도록 
--  학과정보테이블과 외부조인 SELECT
SELECT *
FROM COLLEAGE C, HAKGWA H
WHERE C.COL_CODE = H.HAK_COLL(+)
ORDER BY 1;