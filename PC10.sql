
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

COMMENT ON COLUMN BUYER.BUYER_MAIL IS 'E-MAIL';

DESC BUYER;

ALTER TABLE BUYER
MODIFY (BUYER_NAME VARCHAR2(60));

DESC BUYER;

--�⺻Ű ���� : NO DUPLICATE, NOT NULL(�ߺ��Ұ� �ΰ�����)
ALTER TABLE BUYER
ADD(CONSTRAINT PK_BUYER PRIMARY KEY(BUYER_ID));

ALTER TABLE BUYER
ADD(CONSTRAINT FR_BUYER_LPROD FOREIGN KEY(BUYER_LGU)
                        REFERENCES LPROD(LPROD_GU)
    );

CREATE TABLE prod
(
prod_id             varchar2(10)        NOT NULL,
prod_name           varchar2(40)        NOT NULL,
prod_lgu            char(4)             NOT NULL,
prod_buyer          char(6)             NOT NULL,
prod_cost           number(10)          NOT NULL,
prod_price          number(10)          NOT NULL,
prod_sale           number(10)          NOT NULL,
prod_outline        varchar2(100)       NOT NULL,
prod_detail         clob,
prod_img            varchar2(40)        NOT NULL,
prod_totalstock     number(10)          NOT NULL,
prod_insdate        date,
prod_properstock    number(10)          NOT NULL,
prod_size           varchar2(20),
prod_color          varchar2(20),
prod_delivery       varchar2(255),
prod_unit           varchar2(6),
prod_qtyin          number(10),
prod_gtysale        number(10),
prod_mileage        number(10),
Constraint pk_prod Primary Key (prod_id),
Constraint fr_prod_lprod Foreign Key (prod_lgu)
                                    References lprod(lprod_gu),
Constraint fr_prod_buyer Foreign Key (prod_buyer)
                                    References buyer(buyer_id)
);

CREATE TABLE buyprod
(
buy_date        date            NOT NULL,
buy_prod        varchar2(10)    NOT NULL,
buy_qty         number(10)      NOT NULL,
buy_cost        number(10)      NOT NULL,
Constraint pk_buyprod Primary Key (buy_date,buy_prod),
Constraint fr_buyprod_prod Foreign Key (buy_prod) References prod(prod_id)
);

CREATE TABLE member
(
mem_id          varchar2(15)        NOT NULL,
mem_pass        varchar2(15)        NOT NULL,
mem_name        varchar2(20)        NOT NULL,
mem_regno1      char(6)             NOT NULL,
mem_regno2      char(7)             NOT NULL,
mem_bir         date,
mem_zip         char(7)             NOT NULL,
mem_add1        varchar2(100)       NOT NULL,
mem_add2        varchar2(80)        NOT NULL,
mem_hometel     varchar2(14)        NOT NULL,
mem_comtel      varchar2(14)        NOT NULL,
mem_hp          varchar2(15),
mem_mail        varchar2(60)        NOT NULL,
mem_job         varchar2(40),
mem_like        varchar2(40),
mem_memorial    varchar2(40),
mem_memorialday date,
mem_mileage     number(10),
mem_delete      varchar2(1),
Constraint pk_member Primary Key (mem_id)
);

CREATE TABLE cart
(
cart_member         varchar2(15)        NOT NULL,
cart_no             char(13)            NOT NULL,
cart_prod           varchar2(10)        NOT NULL,
cart_qty            number(8)           NOT NULL,
Constraint pk_cart Primary Key (cart_no,cart_prod),
Constraint fr_cart_member Foreign Key (cart_member)
                                        References member(mem_id),
Constraint fr_cart_prod Foreign Key (cart_prod)
                                        References prod(prod_id)
);

CREATE TABLE ziptb
(
zipcode         char(7)             NOT NULL,
sido            varchar2(2 char)    NOT NULL,
gugun           varchar2(10 char)   NOT NULL,
dong            varchar2(30 char)   NOT NULL,
bunji           varchar2(10 char),
seq             number(5)           NOT NULL
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

SELECT * FROM LPROD;

--ROLLBACK;       --������ INSERT�� �����Ͱ� ���ư���. ���ư� ���¿��� Ʈ����� ����
COMMIT;           --�޸𸮿� �ִ� �����Ͱ� HDD�� ��. ����.

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
--������Ʈ ��뿩
UPDATE LPROD
SET    LPROD_NM = '���'
WHERE  LPROD_GU = 'P102';

ROLLBACK;

SELECT * FROM LPROD;

--LPROD ���̺��� LPROD2 ���̺�� ����(�̵��� �ƴ�)
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

--LPROD2 ���̺��� 
--�����͸� �����Ͻÿ�.(row�� ������)
SELECT *
FROM    LPROD2
WHERE   LPROD_NM = 'ȭ��ǰ';

--��Ǫ������ �ּ���
DELETE FROM LPROD2
WHERE LPROD_NM = 'ȭ��ǰ';

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