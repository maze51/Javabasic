
--P. 65
--��ǰ�з��������̺� ����
CREATE TABLE LPROD
(
 LPROD_ID   NUMBER(5)       NOT NULL,       -- ����
 LPROD_GU   CHAR(4)         NOT NULL,       -- ��ǰ�з��ڵ�
 LPROD_NM   VARCHAR2(40)    NOT NULL,       -- ��ǰ�з���
 CONSTRAINT PK_LPROD PRIMARY KEY(LPROD_GU)
);

--�ŷ�ó�������̺� ����
CREATE TABLE BUYER
 (
 BUYER_ID       CHAR(6)         NOT NULL,   -- �ŷ�ó�ڵ�
 BUYER_NAME     VARCHAR2(40)    NOT NULL,   -- �ŷ�ó��
 BUYER_LGU      CHAR(4)         NOT NULL,   -- ��޻�ǰ ��з�
 BUYER_BANK     VARCHAR2(60),               -- ����
 BUYER_BANKNO   VARCHAR2(60),               -- ���¹�ȣ
 BUYER_BANKNAME VARCHAR2(15),               -- ������
 BUYER_ZIP      CHAR(7),                    -- �����ȣ
 BUYER_ADD1     VARCHAR2(100),              -- �ּ�1
 BUYER_ADD2     VARCHAR2(70),               -- �ּ�2
 BUYER_COMTEL   VARCHAR2(14)    NOT NULL,   -- ��ȭ��ȣ
 BUYER_FAX      VARCHAR2(20)    NOT NULL    -- FAX��ȣ
 );
 
 --BUYER ���̺��� ���� Ȯ��(DESCRIBE)
DESC BUYER;
 
/*
    ALTER TABLE BUYER
    ADD : �÷� �߰�
    MODIFY : �÷� ����
    DROP : �÷� ����
    RENAME : �÷��� ����
*/

ALTER TABLE BUYER
ADD(
    BUYER_MAIL VARCHAR2(60) NOT NULL,
    BUYER_CHARGER VARCHAR2(20),
    BUYER_TELEXT VARCHAR2(2)
    );
--BUYER ���̺� �÷��� �߰��Ѵ�

COMMENT ON COLUMN BUYER.BUYER_MAIL IS 'E-MAIL';
--BUYER ���̺� BUYER_MAIL ���� �ּ��� �߰���

DESC BUYER;

ALTER TABLE BUYER
MODIFY (BUYER_NAME VARCHAR2(60));
--ppt 145p �����߰� 10-11p BUYER_NAME ũ�⸦ 60����Ʈ�� ����
--��ó�� ALTER�� ���� ���濡 ����

DESC BUYER; -- �����ϴ�(DESCRIBE), �����ϴ�. �����ϸ� �ش� ���̺� ���

--�⺻Ű ���� : NO DUPLICATE, NOT NULL(�ߺ��Ұ� �ΰ�����)
ALTER TABLE BUYER
ADD(CONSTRAINT PK_BUYER PRIMARY KEY(BUYER_ID));
--PPT 145p
--�������	���̺��� ���� 	BUYER_ID�� �⺻Ű�� ��ڴ�
--�⺻Ű�� ���̺��� �ִ�. �׷��� �̸��� ���ٸ�? ����� ������� �ָ��ϴ�.
--�̸��� �ٿ� �ٸ� �⺻Ű�� �����ϱ� ���� ������� �պκп� �̸��� �ٴ°�.
--NOT NULL�� CONSTRAINT(�������). �ʼ�(mandatory)

ALTER TABLE BUYER
ADD(CONSTRAINT FR_BUYER_LPROD FOREIGN KEY(BUYER_LGU)
                        REFERENCES LPROD(LPROD_GU)
    );
--buyer �ڽ��� buyer_lgu�� lprod �θ��� �⺻Ű�� �����Ѵ�
--lprod�θ��� �⺻Ű�� buyer �ڽ��� buyer_lgu�� ���̵ȴ�
--ERwin���� ��͹߷� �̾��ֱ�(1��� ������ 1����)

CREATE TABLE PROD
(
PROD_ID             VARCHAR2(10)        NOT NULL,
PROD_NAME           VARCHAR2(40)        NOT NULL,
PROD_LGU            CHAR(4)             NOT NULL,
PROD_BUYER          CHAR(6)             NOT NULL,
PROD_COST           NUMBER(10)          NOT NULL,
PROD_PRICE          NUMBER(10)          NOT NULL,
PROD_SALE           NUMBER(10)          NOT NULL,
PROD_OUTLINE        VARCHAR2(100)       NOT NULL,
PROD_DETAIL         CLOB,
PROD_IMG            VARCHAR2(40)        NOT NULL,
PROD_TOTALSTOCK     NUMBER(10)          NOT NULL,
PROD_INSDATE        DATE,
PROD_PROPERSTOCK    NUMBER(10)          NOT NULL,
PROD_SIZE           VARCHAR2(20),
PROD_COLOR          VARCHAR2(20),
PROD_DELIVERY       VARCHAR2(255),
PROD_UNIT           VARCHAR2(6),
PROD_QTYIN          NUMBER(10),
PROD_GTYSALE        NUMBER(10),
PROD_MILEAGE        NUMBER(10),
Constraint pk_prod Primary Key (prod_id),
Constraint fr_prod_lprod Foreign Key (prod_lgu)
                                    References lprod(lprod_gu),
--prod_lgu�� lprod_gu�� �����Ѵ�		LPROD 1 : �� PROD	LPROD �θ� - �ڽ� PROD
Constraint fr_prod_buyer Foreign Key (prod_buyer)
                                    References buyer(buyer_id)
--prod_buyer�� buyer_id�� �����Ѵ�	BUYER 1 : �� PROD	BUYER �θ� - �ڽ� PROD
);

CREATE TABLE BUYPROD
(
BUY_DATE        DATE            NOT NULL,
BUY_PROD        VARCHAR2(10)    NOT NULL,
BUY_QTY         NUMBER(10)      NOT NULL,
BUY_COST        NUMBER(10)      NOT NULL,
Constraint pk_buyprod Primary Key (buy_date,buy_prod),
--buy_date, buy_prod�� �ĺ�����, ����Ű
Constraint fr_buyprod_prod Foreign Key (buy_prod) References prod(prod_id)
--buy_prod�÷��� �����Ѵ�. prod���̺��� prod_id�÷���.   buyprod�� �ڽ�, prod�� �θ�
);

CREATE TABLE MEMBER
(
MEM_ID          VARCHAR2(15)        NOT NULL,
MEM_PASS        VARCHAR2(15)        NOT NULL,
MEM_NAME        VARCHAR2(20)        NOT NULL,
MEM_REGNO1      CHAR(6)             NOT NULL,
MEM_REGNO2      CHAR(7)             NOT NULL,
MEM_BIR         DATE,
MEM_ZIP         CHAR(7)             NOT NULL,
MEM_ADD1        VARCHAR2(100)       NOT NULL,
MEM_ADD2        VARCHAR2(80)        NOT NULL,
MEM_HOMETEL     VARCHAR2(14)        NOT NULL,
MEM_COMTEL      VARCHAR2(14)        NOT NULL,
MEM_HP          VARCHAR2(15),
MEM_MAIL        VARCHAR2(60)        NOT NULL,
MEM_JOB         VARCHAR2(40),
MEM_LIKE        VARCHAR2(40),
MEM_MEMORIAL    VARCHAR2(40),
MEM_MEMORIALDAY DATE,
MEM_MILEAGE     NUMBER(10),
MEM_DELETE      VARCHAR2(1),
Constraint pk_member Primary Key (mem_id)
--member���̺��� �θ�. �ܷ�Ű�� ����(�� ����������). �׷��� primary key�� �����ߴ�
);

CREATE TABLE CART
(
CART_MEMBER         VARCHAR2(15)        NOT NULL,
CART_NO             CHAR(13)            NOT NULL,
CART_PROD           VARCHAR2(10)        NOT NULL,
CART_QTY            NUMBER(8)           NOT NULL,
Constraint pk_cart Primary Key (cart_no,cart_prod), -- �⺻Ű
Constraint fr_cart_member Foreign Key (cart_member)
                                        References member(mem_id),
--cart_member�� �ܷ�Ű. mem_id�� �����Ѵ�.
Constraint fr_cart_prod Foreign Key (cart_prod)
                                        References prod(prod_id)
--cart_prod�� �ܷ�Ű. prod_id�� �����Ѵ�.
);

CREATE TABLE ZIPTB
(
ZIPCODE         CHAR(7)             NOT NULL,
SIDO            VARCHAR2(2 CHAR)    NOT NULL,
GUGUN           VARCHAR2(10 CHAR)   NOT NULL,
DONG            VARCHAR2(30 CHAR)   NOT NULL,
BUNJI           VARCHAR2(10 CHAR),
SEQ             NUMBER(5)           NOT NULL
);

CREATE INDEX idx_ziptb_zipcode ON ziptb(zipcode);

----------------------DB ���� ��----------------------------
--P.17
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (1, 'P101', '��ǻ����ǰ');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (2, 'P102', '������ǰ');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (3, 'P201', '����ĳ�־�');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (4, 'P202', '����ĳ�־�');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (5, 'P301', '������ȭ');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (6, 'P302', 'ȭ��ǰ');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (7, 'P401', '����/CD');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (8, 'P402', '����');
INSERT INTO LPROD (LPROD_ID,LPROD_GU,LPROD_NM) VALUES (9, 'P403', '������');

--�� �� �����ų �� ��ü�� ����� ������ ��

SELECT * FROM LPROD; --���� ����ϱ�

--ROLLBACK;       --������ INSERT�� �����Ͱ� ���ư���. ���ư� ���¿��� Ʈ����� ����
COMMIT;           --�޸𸮿� �ִ� �����Ͱ� HDD�� ��. ����.

--SELECT - FROM - WHERE�� �ѵ�� ����(WHERE�� ��������)
--UPDATE - SET - WHERE�� �ѵ�� ����(WHERE �� ���ֱ�)

SELECT LPROD_ID
     , LPROD_GU
     , LPROD_NM
FROM LPROD;

SELECT LPROD_GU
     , LPROD_NM
FROM LPROD;

SELECT LPROD_GU
     , LPROD_NM
FROM LPROD
WHERE LPROD_GU < 'P401';

--LPROD_ID�� 3�� ROW�� SELECT�Ͻÿ�
--LPROD ID, GU, NM �÷��� ��� ���
SELECT LPROD_ID
     , LPROD_GU
     , LPROD_NM
FROM LPROD
WHERE LPROD_ID = '3';

--p.19
--������Ʈ �� ���� ����. ������Ʈ�� ���� ���� �ִ°�?
SELECT *
FROM LPROD
WHERE LPROD_GU = 'P102';
--������Ʈ ��뿩 �� �ܿ��
UPDATE LPROD
SET    LPROD_NM = '���'
WHERE  LPROD_GU = 'P102';

ROLLBACK;

SELECT * FROM LPROD;


--LPROD ���̺��� LPROD2 ���̺�� ����(�̵��� �ƴ�)
--�� �� PK, FK�� �������� �ʴ´�
CREATE TABLE LPROD2
AS
SELECT * FROM LPROD;


--LPROD2 ���̺��� LPROD_GU�� P202�� LPROD-NM��
--���� ĳ��󿡼� �������� UPDATE�ϼ���
SELECT *
FROM    LPROD2
WHERE   LPROD_GU = 'P202';

UPDATE  LPROD2
SET     LPROD_NM = '������'
WHERE   LPROD_GU = 'P202'; -- �⺻Ű�� �����ϴ� ���� ����. �ƴϸ� �ߺ������Ǿ� ��ġ �ʴ� UPDATE�� ���� �� �ִ�

--LPROD2 ���̺��� LPROD_ID�� 7��
--LPROD_GU�� P401���� P303���� UPDATE �Ͻÿ�
SELECT *
FROM LPROD2
WHERE LPROD_ID = '7';

UPDATE LPROD2
SET LPROD_GU = 'P303'
WHERE LPROD_ID = '7';


--LPROD2 ���̺��� �����͸� �����Ͻÿ�.(���ڵ�(��, ��, Ʃ��) ������ ������)
SELECT *
FROM    LPROD2
WHERE   LPROD_NM = 'ȭ��ǰ';
--��������� ���� ����.
--����OR������Ʈ ������ SELECT FROM WHERE�� �ݵ�� ��������

DELETE FROM LPROD2          -- FROM�� �ִٴ� ���� �� ����ϱ�
WHERE LPROD_NM = 'ȭ��ǰ';
--��Ǫ������ �ּ��� �� �ܿ��


--���̺��� ��� row�� colomn�� �˻�
select * from LPROD;

--��ǰ ���̺�κ��� ��� row�� colomn�� �˻��Ͻÿ�
SELECT * FROM prod;

--ȸ�� ���̺�κ��� ��� row�� colomn�� �˻��Ͻÿ�
--�ƽ��׸�ũ
SELECT * FROM MEMBER;

--��ٱ��� ���̺�κ��� ��� row�� colomn�� �˻��Ͻÿ�
SELECT * FROM CART;

--buyer ���̺��� buyer2 ���̺�� �����Ͻÿ�
CREATE TABLE BUYER2
AS
SELECT * FROM BUYER;

--BUYER2 ���̺��� BUYER_ID, BUYER_NAME, BUYER_LGU �÷��� ��� SELECT�Ͻÿ�
SELECT BUYER_ID, BUYER_NAME, BUYER_LGU FROM BUYER2;

--BUYER2 ���̺��� BUYER_ID�� P30203�� BUYER_NAME���� �ż����� UPDATE�Ͻÿ�
SELECT *
FROM BUYER2
WHERE BUYER_ID = 'P30203';

UPDATE BUYER2
SET BUYER_NAME = '�ż�'
WHERE BUYER_ID = 'P30203';

--BUYER2 ���̺��� BUYER_NAME�� �Ǹ���� ROW�� �����Ͻÿ�
SELECT *
FROM BUYER2
WHERE BUYER_NAME = '�Ǹ��';

DELETE FROM BUYER2
WHERE BUYER_NAME = '�Ǹ��';
/*
select prod_id, prod_name from prod;
-- Select ����
Select �� : �÷�, ���, ��, �Լ�
from �� : ���̺�, ��������
where �� : ����
Group by �� : �׷���
having �� : (�׷� �Լ�) ����
order by �� : ����;
*/

SELECT MEM_ID
    , 1004
    , '������ ������..'   --���� ���ڸ� ����� �߰��� ��
    , MEM_NAME
    , MEM_MILEAGE
    , MEM_MILEAGE / 12 AS "�� ���"    --������� ���� �̸��� ���� ����
FROM MEMBER;

--ȸ�� ���̺�κ��� ȸ��ID�� ����� ���ϸ��� * 12�� �˻��Ͻÿ�
SELECT MEM_ID
    ,MEM_NAME
    ,MEM_MILEAGE * 12
FROM MEMBER;

--��ǰ ���̺�(PROD)�κ��� ��ǰ�ڵ�� ��ǰ���� �˻��Ͻÿ�
SELECT PROD_ID, PROD_NAME FROM PROD;
--��ٱ��� ���̺�κ��� �ֹ���ȣ, ��ǰ�ڵ�, ȸ��ID, ������ �˻��Ͻÿ�
SELECT CART_NO, CART_PROD, CART_MEMBER, CART_QTY FROM CART;
--��ǰ ���̺�(PROD)�� ��ǰ�ڵ�, ��ǰ��, �Ǹűݾ��� �˻��Ͻÿ�
--�Ǹűݾ��� = �ǸŴܰ� * 55�� ����Ѵ�.
--��ǰ�ڵ�(PROD_ID), ��ǰ��(PROD_NAME), �ǸŴܰ�(PROD_SALE)
SELECT PROD_ID, PROD_NAME, PROD_SALE * 55 FROM PROD;

--��ǰ���̺��� prod_id, prod_name, prod_buyer�� �˻��Ͻÿ�.
--��, Colomn Alias�� ��ǰ�ڵ�, ��ǰ��, �ŷ�ó�ڵ�� �����Ͻÿ�
SELECT PROD_ID      ��ǰ�ڵ�
    , PROD_NAME     ��ǰ��
    , PROD_BUYER    �ŷ�ó�ڵ�
FROM PROD;

--<�÷� alias(��Ī, ����)>
--�÷� ���(heading)���� �⺻������ �÷� �̸��� �״�� ��µȴ�.
--�ٲٷ��� AS "��ǰ �ڵ�"		AS�� alias�� ����.
--�Ǵ� "��ǰ �ڵ�"
--�Ǵ� ��ǰ�ڵ�
--�� �� alias�� ���⸦ �ְ� ������ ������Ʈ�� ���ξ� �Ѵ�


SELECT PROD_LGU     ��ǰ�з�
FROM PROD;
--������ �ߺ� ROW�� ����. SELECT������� �ߺ��� ���ְ� UNIQUE�ϰ� �˻�
SELECT DISTINCT PROD_LGU    ��ǰ�з�
FROM PROD;

--��ǰ ���̺��� �ŷ�ó�ڵ带 �ߺ����� �ʰ� �˻��Ͻÿ�(Alias�� �ŷ�ó)
SELECT DISTINCT PROD_BUYER  �ŷ�ó
FROM PROD;


--<�÷� ����(ORDER BY)>
--ASC(��������) : ASCENDING, DESC(��������) : DESCENDING
--A�������� ����	/ D�Ϸ� ���� �� �ܿ��
--�⺻���� ��������(ASC). ������ �Է� �� ASC�� ���� ����
--ORDER BY�� ������ �� Ȱ���� �� �ִ°�(�÷���, alias, �÷�����)
--���â���� ����� ����Ŭ���ϸ� ������������ ���ĵǱ⵵ ��

--ȸ�����̺��� ID, ȸ����, ����, ���ϸ��� �˻�
SELECT MEM_ID       ȸ��ID
     , MEM_NAME     ����
     , MEM_BIR      ����
     , MEM_MILEAGE  ���ϸ���
FROM MEMBER
ORDER BY ���� DESC;

--�÷������� ���� ����
SELECT MEM_ID
    , MEM_NAME
    , MEM_BIR
    , MEM_MILEAGE
FROM MEMBER
ORDER BY 3 DESC;

--2������
SELECT MEM_ID
    , MEM_NAME
    , MEM_BIR
    , MEM_MILEAGE
FROM MEMBER
ORDER BY MEM_MILEAGE, 1 ASC;
--�׳� MILEAGE�θ� ������ �� ���� ����?
--�÷������� ������ (���⼭�� 1��:MEM_ID)2������ ������ �ο��� �� �ִ�.
--�� �� MEM_ID�� ���ĺ��� 001�� �и��� ���� �ƴ� �ϳ��� ������. ���ڼ����δ� ������ �� ����

SELECT DISTINCT CART_MEMBER     ȸ��ID
    , CART_PROD ��ǰ�ڵ�
FROM CART
ORDER BY 1, 2;
--    ȸ�� ���̵�� �������� ������ 1�� ����.
--    2���� ��ǰ�ڵ带 �������� �ѹ� �� ������ ��.

--ȸ�����̺�(MEMBER)����
--MEM_ID(ȸ��ID), MEM_JOB(����), MEM_LIKE(���)�� �˻��ϱ�
--�������� ��������, ��̷� ��������, ȸ��ID�� �������� ����

SELECT MEM_ID       ȸ��ID
    , MEM_JOB       ����
    , MEM_LIKE      ���
FROM MEMBER
ORDER BY MEM_JOB ASC, MEM_LIKE DESC, MEM_ID ASC; -- MEM_JOB��� ALIAS,
--SELECT���� ������ �÷������� ����

CREATE TABLE MEMBER2
AS
SELECT * FROM MEMBER;

--����(MEM_JOB)�� ȸ����� ȸ���� MEM_MEMORIAL �÷��� �����͸� NULL�� �����ϱ�
--(��, COMMIT�� ���� ����)
--** MEM_MEMORIAL = NULL
--** ���ǰ˻� �� ''�� �����

SELECT *
FROM MEMBER2
WHERE MEM_JOB = 'ȸ���';

UPDATE MEMBER2
SET MEM_MEMORIAL = NULL
WHERE MEM_JOB = 'ȸ���';

COMMIT;

SELECT MEM_MEMORIAL, MEM_ID
FROM MEMBER
ORDER BY MEM_MEMORIAL DESC;
--NULL���� �ִ� �����Ϳ��� �������� ������ NULL�� ������. �������� ������ NULL�� ó��.


--��ǰ ���̺�(PROD)�� ��ü �÷� �˻�
--�ǸŰ�(PROD_SALE)�� �������� ��, ��ǰ�з��ڵ�(PROD_LGU)�� �������� �� ��ǰ��(PROD_NAME)���� �������� ����

SELECT * FROM PROD
ORDER BY PROD_SALE DESC, PROD_LGU, PROD_NAME;

--      <�񱳿���>(WHERE ��)
--���ٸ� ǥ���� �� �ڹٴ� ==���� ����Ŭ�� =��
--������ ǥ��? A <> B �� A != B �� ����


--��ǰ �� �ǸŰ��� 170,000���� ��ǰ ��ȸ(ALIAS : ��ǰ��, �ǸŰ�)
SELECT PROD_NAME    ��ǰ��     --���� SI���� �̷��� ���� ���� �÷��� ���ߴ� ����� �������� ���⵵ ��
     , PROD_SALE    �ǸŰ�
  FROM PROD
 WHERE PROD_SALE = 170000;

--��ǰ �� �ǸŰ��� 170,000���� �ƴ� ��ǰ ��ȸ
SELECT PROD_NAME    ��ǰ��
     , PROD_SALE    �ǸŰ�
  FROM PROD
 WHERE PROD_SALE <> 170000;
--170,000������ ��ǰ
SELECT PROD_NAME    ��ǰ��
     , PROD_SALE    �ǸŰ�
  FROM PROD
 WHERE PROD_SALE <= 170000;
--170,000�̻��� ��ǰ
SELECT PROD_NAME    ��ǰ��
     , PROD_SALE    �ǸŰ�
 FROM PROD
 WHERE PROD_SALE >= 170000;
 
--å �߰� 21P ��ǰ�� ���԰� 200000���� �˻�
SELECT PROD_ID      ��ǰ�ڵ�
     , PROD_NAME     ��ǰ��
     , PROD_COST     ���԰�
FROM PROD
WHERE PROD_COST <= 200000;

--21P 76�� 1�� 1�� ���Ŀ�...
SELECT MEM_ID       ȸ��ID
     , MEM_NAME     ȸ����
     , MEM_REGNO1   �ֹε�Ϲ�ȣ���ڸ�
FROM MEMBER
WHERE MEM_REGNO1 >= '760101';       --''�� ����? MEM_REGNO1�� ������(CHAR)�̱� ����.
--�� �ᵵ �Ǳ� �Ǵ� ����? ���ڿ� ���ڰ� ������ �켱������ �ִµ�,
--���ڰ� �켱�̶� ���ڰ� ���ڷ� �ڵ� ����ȯ�ȴ�. �׷��� ����-���ڰ� ���ؼ� ���� ����� ����.

--      <������>
--NOT(����1): ����1�� �ƴ� ��� ��
--�켱����: (), NOT, AND, OR    ���ش����� �ܿ��

--21P �з���P201�̰�...
SELECT PROD_NAME    ��ǰ
     , PROD_LGU      ��ǰ�з�
     , PROD_SALE     �ǸŰ�
FROM PROD
WHERE PROD_LGU = 'P201'
  AND PROD_SALE=170000;

--22P ��ǰ �� ��ǰ�з��� P201(���� ĳ�־�)�̰ų� �ǸŰ��� 170,000���� ��ǰ ��ȸ
--ALIAS�� ��ǰ, ��ǰ�з�, �ǸŰ�

SELECT PROD_NAME    ��ǰ
     , PROD_LGU      ��ǰ�з�
     , PROD_SALE     �ǸŰ�
FROM PROD
WHERE PROD_LGU = 'P201'
   OR PROD_SALE=170000;
   
--��ǰ �� ��ǰ�з��� P201(���� ĳ�־�)�� �ƴϰ� �ǸŰ��� 170,000���� �ƴ� ��ǰ ��ȸ
--ALIAS�� ��ǰ, ��ǰ�з�, �ǸŰ�

SELECT PROD_NAME     ��ǰ
     , PROD_LGU      ��ǰ�з�
     , PROD_SALE     �ǸŰ�
FROM PROD
WHERE NOT(PROD_LGU = 'P201'
OR PROD_SALE = 170000);
--WHERE PROD_LGU != 'P201'
--AND PROD_SALE != 170000;

--����: ��𸣰� ���� not(a or b) = not a and not b

--22P �ǸŰ��� 300,000�̻�...
SELECT PROD_ID      ��ǰ�ڵ�
     , PROD_NAME    ��ǰ��
     , PROD_SALE    �ǸŰ�
FROM    PROD
WHERE   PROD_SALE BETWEEN 300000 AND 500000;
--WHERE   PROD_SALE >= 300000
--AND     PROD_SALE <= 500000;

--22P ȸ�� �� ������ 1975...
SELECT MEM_ID        ȸ��ID
     , MEM_NAME      ȸ����
     , MEM_BIR       ����
FROM MEMBER
WHERE MEM_BIR BETWEEN '75/01/01' AND '76/12/31';    --�� ���� �ڵ� ����ȯ.
--'1975-01-01'�� ����. ��¥ ������ ���ڸ� ��¥������ �ڵ� ����ȯ��.

DESC MEMBER;        --MEMBER���̺��� �������� ��ȸ

--WHERE�� ��Ÿ ������
--      <IN>(ã�� ��� �� �����ϴ� ��. ���� ��)

--22P ��ǰ �� �ǸŰ��� 150,000�� �Ǵ� 170,000�� �Ǵ� 330,000���� ��ǰ ��ȸ
SELECT PROD_NAME    ��ǰ��
     , PROD_SALE    �ǸŰ�
FROM   PROD
WHERE  PROD_SALE IN(150000,170000,330000);
--WHERE  PROD_SALE=150000
--OR     PROD_SALE=170000
--OR     PROD_SALE=330000;

--22P ȸ�����̺��� ȸ��ID�� c001, f001, w001�� ȸ���� �˻�
SELECT MEM_ID   ȸ��ID
     , MEM_NAME  ȸ����
FROM   MEMBER
WHERE MEM_ID IN('c001','f001','w001');

--22P ��ǰ �з����̺��� ���� ��ǰ���̺� �����ϴ� �з��� �˻�(�з��ڵ�, �з���)
SELECT LPROD_GU     �з��ڵ�
     , LPROD_NM     �з���
FROM LPROD
WHERE LPROD_GU IN(SELECT DISTINCT PROD_LGU FROM PROD);
--IN('P101','P102','P201','P202','P301','P302')�� ����ؼ� �� ���� ����;

--��ǰ �з����̺��� ���� ��ǰ���̺� �������� �ʴ� �з��� �˻�
SELECT LPROD_GU     �з��ڵ�
     , LPROD_NM     �з���
FROM LPROD
WHERE LPROD_GU NOT IN(SELECT DISTINCT PROD_LGU FROM PROD);

--�ŷ�ó ���̺�(BUYER)���� ���� ��ǰ���̺�(PROD)�� �����ϴ� �ŷ�ó(PROD_BUYER)�� �˻��Ͻÿ�
--ALIAS : �ŷ�óID(BUYER_ID), �ŷ�ó��(BUYER_NAME)

SELECT BUYER_ID     �ŷ�óID
     , BUYER_NAME   �ŷ�ó��
FROM BUYER
WHERE BUYER_ID IN(SELECT DISTINCT PROD_BUYER FROM PROD);
--  QUERY �ȿ� �� �ٸ� SELECT�� ���� : ��������
--  �������� �ٱ� ������ ��������.

--22P ��ǰ �� ���԰�(PROD_COST)�� 30��~150���̰� �ǸŰ�(PROD_SALE)�� 80��~200���� ��ǰ�� �˻��Ͻÿ�
--ALIAS�� ��ǰ��(PROD_NAME), ���԰�(PROD_COST), �ǸŰ�(PROD_SALE)

SELECT PROD_NAME    ��ǰ��
     , PROD_COST    ���԰�
     , PROD_SALE    �ǸŰ�
FROM PROD
WHERE (PROD_COST BETWEEN 300000 AND 1500000)
AND (PROD_SALE BETWEEN 800000 AND 2000000);

--      <LIKE> (å �߰� 22p. �߿�!)
--���ϵ�ī�� ���('_' : �� ����, '%' : ���� ����) 

SELECT PROD_ID      ��ǰ�ڵ�
     , PROD_NAME    ��ǰ��
FROM PROD
WHERE PROD_NAME LIKE '��%';
--'��'���� �����ϴ� ���� ã�ƶ�

SELECT PROD_ID      ��ǰ�ڵ�
     , PROD_NAME    ��ǰ��
FROM PROD
WHERE PROD_NAME LIKE '_��%'; 
-- ù��°�� ���� �� ����, �ι�°�� '��'�� ���� ã�ƶ�

-- 'ġ'�ڷ� ������ ��ǰ ������ �˻��Ͻÿ�
--ALIAS: ��ǰ�ڵ�, ��ǰ��
SELECT PROD_ID      ��ǰ�ڵ�
     , PROD_NAME    ��ǰ��
FROM PROD
WHERE PROD_NAME LIKE '%ġ';

--'����'�̶�� �ܾ ���Ե� ��� ��ǰ ������ �˻�
SELECT PROD_ID      ��ǰ�ڵ�
     , PROD_NAME    ��ǰ��
FROM PROD
WHERE PROD_NAME LIKE '%����%';       --�յڴ� ���� ���͵� �ǰ�, �ƹ��͵� ��� �ȴ�

--23P ȸ�����̺��� �达 ���� ���� ȸ���� �˻�(ALIAS�� ȸ��ID, ����)
SELECT MEM_ID       ȸ��ID
     , MEM_NAME     ����
FROM MEMBER
WHERE MEM_NAME LIKE '��%';

--23P ȸ�����̺��� �ֹε�Ϲ�ȣ ���ڸ��� �˻��Ͽ� 1975����� ������ ȸ���� �˻�
--(ALIAS�� ȸ��ID, ����, �ֹε�Ϲ�ȣ)
SELECT MEM_ID       ȸ��ID
     , MEM_NAME     ����
     , MEM_REGNO1   �ֹε�Ϲ�ȣ
FROM MEMBER
WHERE NOT MEM_REGNO1 LIKE '75%';    --NOT�� LIKE�տ� �־ �ǰ� WHERE�ڿ� �־ ��

--������ 100���� �̸�, �Ｚ ��ǰ, ������ ������������ ���ĵ� ����Ʈ
--(ALIAS�� ��ǰID, ��ǰ��, �ǸŰ�, ��ǰ�����)

SELECT PROD_ID      ��ǰID
     , PROD_NAME    ��ǰ��
     , PROD_SALE    �ǸŰ�
     , PROD_DETAIL  ��ǰ�����
FROM PROD
WHERE PROD_SALE<1000000
AND PROD_NAME LIKE '%�Ｚ%'
ORDER BY PROD_SALE DESC;



INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
VALUES (10, 'P501','ȫ�浿%');

INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
VALUES (11, 'P502','ȫ�浿% �޼�');

COMMIT;
SELECT * FROM LPROD;

--��ǰ�з����̺��� ��ǰ�з����� 'ȫ�浿%'�� �����͸� �˻��غ��� .��, LIKE���
--(ALIAS: ��ǰ�з��ڵ�, ��ǰ�з���)

SELECT LPROD_GU ��ǰ�з��ڵ�
     , LPROD_NM ��ǰ�з���
FROM LPROD
WHERE LPROD_NM LIKE 'ȫ�浿\%' ESCAPE '\';
--  LIKE 'ȫ�浿\%'�� �־��� �� LIKE����� '=' ���� ��Ȯ�� ������ ��.
--LIKE�� ������? ���ϵ�ī���� ����� ���ָ� ��.
--��ó�� ESCAPE�� �־��ָ� �ش� ��ȣ�� �տ��� ã�� ���ϵ�ī���� Ư������� ESCAPE(����)��. ���� ������ ����.


--      <�Լ�> (23P)
-- �Լ���? � ���� �ִٰ� ����. �� �ȿ��� ��Ģ(X+7)�� �ִ�. � ��(10)�� ������? ó���ؼ� ��ȯ(17)�Ѵ�.
-- �� �� ���� ���� �Ķ����, �μ� / ��ȯ�ϴ� ���� ���ϰ�

-- || (����������) �� �̻��� ���ڿ��� ����     CONCAT �� ���ڿ��� �����Ͽ� ��ȯ

SELECT 'a'||'bcde' FROM DUAL;
SELECT MEM_ID||'name is '||MEM_NAME FROM MEMBER;

SELECT CONCAT('My Name is', MEM_NAME) FROM MEMBER;

SELECT CHR(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL;
SELECT ASCII( CHR(65) ) RESULT FROM DUAL;
SELECT CHR(75) "CHR", ASCII('K') "ASCII" FROM DUAL;

-- ȸ�����̺��� ȸ��ID Colomn�� ASCII���� �˻��Ͻÿ�
SELECT MEM_ID               "ȸ�� ID"
     , ASCII(MEM_ID)        "ȸ�� ASCII"
     , CHR(ASCII(MEM_ID))   "ȸ�� CHR"
FROM MEMBER;

SELECT LOWER('DATA manipulation Language')      AS "LOWER"
     , UPPER('DATA manipulation Language')      AS "UPPER"
     , INITCAP('DATA manipulation Language')      AS "INITCAP"
FROM DUAL;

--24P ȸ�����̺��� ȸ��ID�� �빮�ڷ� ��ȯ�Ͽ� �˻��Ͻÿ�
--(ALIAS���� ��ȯ��ID, ��ȯ��ID)

SELECT MEM_ID AS ��ȯ��ID, UPPER(MEM_ID)  AS ��ȯ��ID
FROM MEMBER;

SELECT LPAD('Java', 10) "LPAD"      --10�� ũ��(����Ʈ) ��
     , RPAD('Java', 10) "RPAD"
FROM   DUAL;                        --DUAL�� ���� ���̺�

SELECT LPAD('*',1, '*') FROM DUAL;  --���ʿ� ����, �� 1����Ʈ
SELECT LPAD('*',2, '*') FROM DUAL;
SELECT LPAD('*',3, '*') FROM DUAL;
SELECT LPAD('*',4, '*') FROM DUAL;
SELECT LPAD('*',5, '*') FROM DUAL;  --���ʿ� ����, �� 5����Ʈ, ������ '*'�� �� ������ *�� ä���� ��

SELECT LPAD ('Java', 10, '*') "LPAD" --�� 10����Ʈ, ���ʿ� ����, ������ �� ĭ�� Java��, �� ������ *�� ä����
     , RPAD ('Flex', 12, '^') "RPAD" --�� 12����Ʈ, �����ʿ� ����, ���� �� ĭ�� Flex��, �� ������ ^�� ä����
FROM   SYS.DUAL;                     --DUAL�� ������ �������� �� ������ ���̺�. ���⿡ MEMBER�� ���ٸ� MEMBER�� �� ������ŭ ��µ�

--24P ��ǰ���̺��� �Һ��ڰ��ݰ� �Һ��ڰ����� ġȯ�Ͽ� ������ ���� ��µǰ� �Ͻÿ�
--ALIAS: PROD_PRICE, PROD_RESULT
SELECT PROD_PRICE                 AS PROD_PRICE
      ,LPAD (PROD_PRICE, 10, '*') AS PROD_RESULT
FROM   PROD;

--25P TRIM
SELECT '<' || LTRIM('      AAA      ') || '>' "LTRIM1"                      --���ʿ��� ����
     , '<' || LTRIM('Hello World', 'He') || '>' "LTRIM2"                    --(��ó�� ���ڸ� ������ ���)���ʿ��� ��ġ�ϴ� ���ڸ� ����
     , '<' || LTRIM('llo World', 'He') || '>' "LTRIM3"                      --��ġ�ϴ� ���ڰ� ���� �״��
     , '<' || LTRIM('Hello He World', 'He') || '>' "LTRIM4"                 --�����ϱ� ����
     , '<' || LTRIM('HeHello HeWorld', 'He') || '>' "LTRIM5"                --���ʿ��� ��ġ�ϴ� ���ڸ� ����(�������� ����)
FROM DUAL;

SELECT '<' || RTRIM('      AAA      ') || '>' "RTRIM1"                      --�����ʿ��� ����
     , '<' || RTRIM('Hello World', 'ld') || '>' "RTRIM2"                    --��ġ�ϴ� ���ڸ� �����ʿ��� ����
FROM DUAL;

SELECT '<' || TRIM('      AAA      ') || '>' "TRIM1"                        --��, �����ʿ��� ����
     , '<' || TRIM(LEADING 'a' FROM TRIM('     aaAaBaAaa')) || '>' "TRIM2"  --���ʿ��� ����
     , '<' || TRIM('a' FROM 'aaAaBaAaa') || '>' "TRIM3"                     --��, �����ʿ��� ����(������ BOTH�� ����)
     , '<' || TRIM(BOTH 'a' FROM 'aaAaBaAaa') || '>' "TRIM4"                --���� ���ʿ��� ����
     , '<' || TRIM(TRAILING 'a' FROM 'aaAaBaAaa') || '>' "TRIM5"            --�����ʿ��� ����
FROM SYS.DUAL;

--å25P SUBSTR
SELECT SUBSTR('SQL PROJECT', 1, 3)  RESULT1
     , SUBSTR('SQL PROJECT', 5)     RESULT2         -- ���ڼ� ������ ������. (...,5,7)�� �ǹ̰� ����
     , SUBSTR('SQL PROJECT', -7, 3) RESULT3         -- ������ ������ �����ʺ��� ã�´�. ���⼭�� P ��ġ. �ű���� �� ����
FROM DUAL;

--ȸ�����̺��� ���� ��ȸ
SELECT MEM_ID       ȸ��ID
     , MEM_NAME
     , SUBSTR(MEM_NAME,1,1) ����
FROM MEMBER;

--25P ��ǰ���̺��� ��ǰ����...
SELECT PROD_ID             ��ǰ�ڵ�
     , PROD_NAME           ��ǰ��
FROM   PROD
WHERE SUBSTR(PROD_NAME,4,2)='Į��';           -- WHERE �ڸ��� ���ǽ��� ��� �Ѵ�
--WHERE  PROD_NAME LIKE '___Į��%';            --�̷� ����� ����

--��ٱ��� ���̺�(CART)���� ��ٱ��� ��ȣ(CART_NO)�߿� 04���� �ش��ϴ� �����͸� ����ϱ�
--ALIAS : CART_NO, CART_PROD

SELECT CART_NO
     , CART_PROD
FROM CART
WHERE SUBSTR(CART_NO,5,2)='04';

