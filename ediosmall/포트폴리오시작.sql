/*
grant dba, connect, RESOURCE to demo01
*/


/*Table Sector*/

-- 1. ȸ������ ���̺�
CREATE TABLE MBEIOS_TBL (
    MBEI_ID                VARCHAR2(50) CONSTRAINT pk_member PRIMARY KEY,  -- 1-A. ȸ�� ID
    MBEI_NAME              VARCHAR2(50)         NOT NULL,                  -- 1-B. ȸ�� �̸�
    MBEI_PASSWORD          VARCHAR2(60)         NOT NULL,                  -- 1-C. ȸ�� �н�����
    MBEI_EMAIL             VARCHAR2(100)        NOT NULL,                  -- 1-D. ȸ�� �̸���
    MBEI_ZIPCODE           CHAR(5)              NOT NULL,                  -- 1-E. ȸ�� �����ȣ
    MBEI_ADDR1ST           VARCHAR2(2000)       NOT NULL,                  -- 1-F. ȸ�� �⺻�ּ�
    MBEI_ADDR2ND           VARCHAR2(2000)       NOT NULL,                  -- 1-G. ȸ�� ���ּ�
    MBEI_PHONENUM          VARCHAR2(50)         NOT NULL,                  -- 1-H. ȸ�� ��ȭ��ȣ
    MBEI_NICKNAME_U        VARCHAR2(50)         NOT NULL,                  -- 1-I. ȸ�� �г���
    MBEI_APPROVAL          CHAR(1)              NOT NULL,                  -- 1-J. ȸ�� �̸��� ���ſ���
    MBEI_EARNPOINTS        NUMBER DEFAULT 0     NOT NULL,                  -- 1-K. ȸ�� ������
    MBEI_DATE_SUB        DATE DEFAULT SYSDATE   NOT NULL,                  -- 1-L. ȸ�� ������
    MBEI_DATE_UP         DATE DEFAULT SYSDATE   NOT NULL,                  -- 1-M. ȸ�� ���� ������
    MBEI_DATE_LASTLOGIN  DATE DEFAULT SYSDATE   NOT NULL                   -- 1-N. ȸ�� ������ ���ӽð�
);




-- 2. ī�װ� ���̺�
CREATE TABLE CATEGORY_TBL (
    CAT_CODE               VARCHAR2(20) CONSTRAINT pk_cate PRIMARY KEY,    -- 2-A. ���� ī�װ� �ڵ� 
    CAT_CODE_PRT           VARCHAR2(20),                                   -- 2-B. �θ� ī�װ� 
    CAT_NAME               VARCHAR2(50)         NOT NULL                   -- 2-C. ī�װ� ��
);

-- 1�� ī�װ� : ����(1), ����(2), �Ź�(3), ����(4), �Ǽ��縮(5)
INSERT INTO CATEGORY_TBL
	VALUES('1', NULL, '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('2', NULL, '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('3', NULL, '�Ź�')
;
INSERT INTO CATEGORY_TBL
	VALUES('4', NULL, '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('5', NULL, '�Ǽ��縮')
;

-- 1�� ī�װ� �߰� : �������(6), ����Ư��(7), ��õ��ǰ(8), ��Ʈ��ǰ(9), ���λ�ǰ(10), �����(11)
INSERT INTO CATEGORY_TBL
	VALUES('6', NULL, '�������')
;

INSERT INTO CATEGORY_TBL
	VALUES('7', NULL, '����Ư��')
;

INSERT INTO CATEGORY_TBL
	VALUES('8', NULL, '��õ��ǰ')
;

INSERT INTO CATEGORY_TBL
	VALUES('9', NULL, '��Ʈ��ǰ')
;

INSERT INTO CATEGORY_TBL
	VALUES('10', NULL, '���λ�ǰ')
;

INSERT INTO CATEGORY_TBL
	VALUES('11', NULL, '�����')
;

commit
;

-- 1�� ī�װ� : ����(1)
-- 2�� ī�װ� : ����Ƽ(11), Ƽ����(12), �ĵ�Ƽ(13), ����Ƽ(14)
INSERT INTO CATEGORY_TBL
	VALUES('101', '1', '����Ƽ')
;
INSERT INTO CATEGORY_TBL
	VALUES('102', '1', 'Ƽ����')
;
INSERT INTO CATEGORY_TBL
	VALUES('103', '1', '�ĵ�Ƽ')
;
INSERT INTO CATEGORY_TBL
	VALUES('104', '1', '����Ƽ')
;

-- 1�� ī�װ� : ����(2)
-- 2�� ī�װ� : �����(21), û����(22), ��Ű��(23), �ݹ���(24)
INSERT INTO CATEGORY_TBL
	VALUES('201', '2', '�����')
;
INSERT INTO CATEGORY_TBL
	VALUES('202', '2', 'û����')
;
INSERT INTO CATEGORY_TBL
	VALUES('203', '2', '��Ű��')
;
INSERT INTO CATEGORY_TBL
	VALUES('204', '2', '�ݹ���')
;

-- 1�� ī�װ� : �Ź�(3)
-- 2�� ī�װ� : �ȭ(31), ����Ŀ��(32), ����(33), ����(34)
INSERT INTO CATEGORY_TBL
	VALUES('301', '3', '�ȭ')
;
INSERT INTO CATEGORY_TBL
	VALUES('302', '3', '����Ŀ��')
;
INSERT INTO CATEGORY_TBL
	VALUES('303', '3', '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('304', '3', '����')
;

-- 1�� ī�װ� : ����(4)
-- 2�� ī�װ� : �����(41), ��Ʈ��(42), ũ�ν���(43), ũ��ġ��(44)
INSERT INTO CATEGORY_TBL
	VALUES('401', '4', '�����')
;
INSERT INTO CATEGORY_TBL
	VALUES('402', '4', '��Ʈ��')
;
INSERT INTO CATEGORY_TBL
	VALUES('403', '4', 'ũ�ν���')
;
INSERT INTO CATEGORY_TBL
	VALUES('404', '4', 'ũ��ġ��')
;

-- 1�� ī�װ� : �Ǽ��縮(5)
-- 2�� ī�װ� : ���۶�(51), ��Ʈ(52), ��ī��(53), ����(54)
INSERT INTO CATEGORY_TBL
	VALUES('501', '5', '���۶�')
;
INSERT INTO CATEGORY_TBL
	VALUES('502', '5', '��Ʈ')
;
INSERT INTO CATEGORY_TBL
	VALUES('503', '5', '��ī��')
;
INSERT INTO CATEGORY_TBL
	VALUES('504', '5', '����')
;

commit
;

-- 1�� ī�װ� : �������(6)
-- 2�� ī�װ� : ����(601), ����(602)
INSERT INTO CATEGORY_TBL
	VALUES('601', '6', '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('602', '6', '����')
;

-- 1�� ī�װ� : ����Ư��(7)
-- 2�� ī�װ� : ��(701), ����(702), ����(703), �ܿ�(704),
INSERT INTO CATEGORY_TBL
	VALUES('701', '7', '��')
;
INSERT INTO CATEGORY_TBL
	VALUES('702', '7', '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('703', '7', '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('704', '7', '�ܿ�')
;

commit
;

-- 1�� ī�װ� : ��õ��ǰ(8)
-- 2�� ī�װ� : �ڵ���õ(801), ��������õ(802)
INSERT INTO CATEGORY_TBL
	VALUES('801', '8', '�ڵ���õ')
;
INSERT INTO CATEGORY_TBL
	VALUES('802', '8', '��������õ')
;

commit
;

-- 1�� ī�װ� : ��Ʈ��ǰ(9)
-- 2�� ī�װ� : ��(901), ����(902), ����(903), �ܿ�(904),
INSERT INTO CATEGORY_TBL
	VALUES('901', '9', '��')
;
INSERT INTO CATEGORY_TBL
	VALUES('902', '9', '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('903', '9', '����')
;
INSERT INTO CATEGORY_TBL
	VALUES('904', '9', '�ܿ�')
;

commit
;

-- 1�� ī�װ� : ���λ�ǰ(10)
-- 2�� ī�װ� : 10%(1001), 5%(1002)
INSERT INTO CATEGORY_TBL
	VALUES('1001', '10', '10%')
;
INSERT INTO CATEGORY_TBL
	VALUES('1002', '10', '5%')
;

commit
;

-- 1�� ī�װ� : �����(11)
-- 2�� ī�װ� : ��ݱ�(1101), �Ϲݱ�(1102)
INSERT INTO CATEGORY_TBL
	VALUES('1101', '11', '��ݱ�')
;
INSERT INTO CATEGORY_TBL
	VALUES('1102', '11', '�Ϲݱ�')
;

commit
;


-- 3. ��ǰ ���̺�
CREATE TABLE PRODUCTEI_TBL (
    PDTEI_NUM              NUMBER CONSTRAINT pk_product PRIMARY KEY, -- 3-A. ��ǰ ��ȣ
    CAT_CODE               VARCHAR2(20)         NOT NULL,            -- 3-B. ī�װ� �ڵ�
    CAT_CODE_prt           VARCHAR2(20)         NOT NULL,            -- 3-C. ī�װ� �ڵ�
    PDTEI_NAME             VARCHAR2(50)         NOT NULL,            -- 3-D. ��ǰ �̸�
    PDTEI_PRICE            NUMBER               NOT NULL,            -- 3-E. ��ǰ ����
    PDTEI_DISCOUNT         NUMBER               NOT NULL,            -- 3-F. ��ǰ ������
    PDTEI_PRODUCER         VARCHAR2(30)         NOT NULL,            -- 3-G. ��ǰ ���߻�
    PDTEI_DETAIL           CLOB                 NOT NULL,            -- 3-H. ��ǰ �󼼼Ұ�
    PDTEI_IMAGE            VARCHAR2(100)        NOT NULL,            -- 3-I. ��ǰ �̹���(��ǥ)
    PDTEI_AMOUNT           NUMBER               NOT NULL,            -- 3-J. ��ǰ ���� ����
    PDTEI_BUY              CHAR(1)              NOT NULL,            -- 3-K. ��ǰ ���� ��¥
    PDTEI_DATE_SUB       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. ��ǰ �������
    PDTEI_DATE_UP        DATE DEFAULT SYSDATE   NOT NULL             -- 3-M. ��ǰ ���� ������
);

create SEQUENCE seq_pdtei_num
;



-- 4. ��ٱ��� ���̺�
CREATE TABLE CART_TBL (
    CART_CODE              NUMBER CONSTRAINT pk_cart PRIMARY KEY,    -- 4-A. ��ٱ��� �ڵ�
    PDTEI_NUM              NUMBER               NOT NULL,            -- 4-B. ��ǰ��ȣ
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 4-C. ȸ�� ID
    CART_AMOUNT            NUMBER               NOT NULL             -- 4-D. ���ż���
);

create SEQUENCE seq_cart_code
;




-- 5. �ֹ� ���̺�
CREATE TABLE ORDER_TBL (
    ODR_CODE               NUMBER CONSTRAINT pk_order PRIMARY KEY,   -- 5-A. �ֹ� ��ȣ
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 5-B. ȸ�� ID
    ORD_NAME               VARCHAR2(50)         NOT NULL,            -- 5-C. �ֹ��� �̸�
    ORD_ZIPCODE            CHAR(5)              NOT NULL,            -- 5-D. �ֹ��� �����ȣ
    ORD_ADDR1ST            VARCHAR2(50)         NOT NULL,            -- 5-E. �ֹ��� �⺻�ּ�
    ORD_ADDR2ND            VARCHAR2(50)         NOT NULL,            -- 5-F. �ֹ��� ���ּ�
    ORD_PHONENUM           VARCHAR2(15)         NOT NULL,            -- 5-G. �ֹ��� ��ȭ��ȣ
    ORD_PRICE              NUMBER               NOT NULL,            -- 5-H. �� �ֹ� �ݾ�
    ORD_DATE             DATE DEFAULT SYSDATE   NOT NULL            -- 5-I. �ֹ���
);

create sequence seq_order_code
;

-- 6. �ֹ��� ���̺�
CREATE TABLE ORDER_DETAIL_TABLE (
    ODR_CODE               NUMBER CONSTRAINT pk_order_d   NOT NULL,  -- 6-A. �ֹ� ��ȣ
    PDTEI_NUM              NUMBER CONSTRAINT pk_product_d NOT NULL,  -- 6-B. ��ǰ ��ȣ
    ORD_AMOUNT             NUMBER               NOT NULL,            -- 6-C. �ֹ� ����
    ORD_PRICE              NUMBER               NOT NULL             -- 6-D. �ֹ� ����
);


-- 7. �Խ��� ���̺�
CREATE TABLE BOARD_TBL (
    BRD_NUM                NUMBER CONSTRAINT pk_board PRIMARY KEY,   -- 7-A. �Խñ� ��ȣ
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 7-B. ȸ�� ID
    BRD_TITLE              VARCHAR2(100)        NOT NULL,            -- 7-C. �Խñ� ����
    BRD_CONTENTS           VARCHAR2(2000)       NOT NULL,            -- 7-D. �Խñ� ����
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL             -- 7-E. �Խñ� �ۼ���
);

create sequence seq_board
;  


-- 8. ���� ���̺�
CREATE TABLE REVIEW_TBL (
    RV_NUM                 NUMBER CONSTRAINT pk_review PRIMARY KEY,  -- 8-A. ���� ��ȣ
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 8-B. ȸ�� ID
    PDTEI_NUM              NUMBER               NOT NULL,            -- 8-C. ��ǰ ��ȣ
    RV_CONTECTS            VARCHAR2(200)        NOT NULL,            -- 8-D. ���� ����
    RV_SCORE               NUMBER               NOT NULL,            -- 8-E. ����
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL             -- 8-F. ���� �ۼ���     
);

create sequence sqe_review_num
;

--9. ������ �α��� ���̺�
CREATE TABLE ADMIN_TBL(
	ADMIN_ID			   VARCHAR2(50) CONSTRAINT pk_admin	PRIMARY KEY, -- 9-A. ������ ID
	ADMIN_PW			   VARCHAR2(60)			NOT NULL,
	ADMIN_NAME			   VARCHAR2(50)			NOT NULL,
	ADMIN_DATE_LATE	     DATE DEFAULT SYSDATE	NOT NULL
);

commit
;



