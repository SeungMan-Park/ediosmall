/*
�ۼ��� : �ڽ¸�
������ : 2021/03/03
�������Ʈ :
- http://www.darkvictory.co.kr/
- http://www.la-room.kr/

������Ʈ�� : ���θ�(Eidos_fashion)_�ɷ´�����
��ǥ : ���θ��� �� ���̺��� ���� �� ����� �����Ѵ�.

rv_score
*/

/*Table Sector*/

/* mbeios_tbl  */
-- 1. ȸ������ ���̺�

drop TABLE MBEIOS_TBL
;

CREATE TABLE MBEIOS_TBL (
    MBEI_ID                VARCHAR2(15)         PRIMARY KEY,         -- 1-A. ȸ�� ID
    MBEI_NAME              VARCHAR2(30)         NOT NULL,            -- 1-B. ȸ�� �̸�
    MBEI_PASSWORD          VARCHAR2(15)         NOT NULL,            -- 1-C. ȸ�� �н�����
    MBEI_EMAIL             VARCHAR2(50)         NOT NULL,            -- 1-D. ȸ�� �̸���
    MBEI_ZIPCODE           CHAR(5)              NOT NULL,            -- 1-E. ȸ�� �����ȣ
    MBEI_ADDR1ST           VARCHAR2(50)         NOT NULL,            -- 1-F. ȸ�� �⺻�ּ�
    MBEI_ADDR2ND           VARCHAR2(50)         NOT NULL,            -- 1-G. ȸ�� ���ּ�
    MBEI_PHONENUM          VARCHAR2(15)         NOT NULL,            -- 1-H. ȸ�� ��ȭ��ȣ
    MBEI_NICKNAME_U        VARCHAR2(20)         NOT NULL UNIQUE,     -- 1-I. ȸ�� �г���
    MBEI_APPROVAL          CHAR(1)              NOT NULL,            -- 1-J. ȸ�� �̸��� ���ſ���
    MBEI_EARNPOINTS        NUMBER DEFAULT 0     NOT NULL,            -- 1-K. ȸ�� ������
    MBEI_DATE_SUB        DATE DEFAULT SYSDATE   NOT NULL,            -- 1-L. ȸ�� ������
    MBEI_DATE_UP         DATE DEFAULT SYSDATE   NOT NULL,            -- 1-M. ȸ�� ���� ������
    MBEI_DATE_LASTLOGIN  DATE DEFAULT SYSDATE   NOT NULL             -- 1-N. ȸ�� ������ ���ӽð�

);

alter TABLE MBEIOS_TBL add(mbei_autocode CHAR(1) DEFAULT 'N' NOT NULL)
;

alter TABLE MBEIOS_TBL drop COLUMN mbei_autocode;

alter TABLE MBEIOS_TBL MODIFY( MBEI_ADDR1ST VARCHAR2(2000));
alter TABLE MBEIOS_TBL MODIFY( MBEI_ADDR2ND VARCHAR2(2000));

-- 2. ī�װ� ���̺�
CREATE TABLE CATEGORY_TBL (
    CAT_CODE               VARCHAR2(20)         PRIMARY KEY,         -- 2-A. ���� ī�װ� �ڵ�
    CAT_CODE_PRT           VARCHAR2(20),                             -- 2-B. �θ� ī�װ� 
    CAT_NAME               VARCHAR2(50)         NOT NULL,            -- 2-C. ī�װ� ��
    FOREIGN KEY(CAT_CODE_PRT) REFERENCES CATEGORY_TBL(CAT_CODE)      -- CAT_CODE_PRT(2-B) -> CAT_CODE(2-A)
);

INSERT INTO CATEGORY_TBL
	VALUES('1000', NULL, '����');
INSERT INTO CATEGORY_TBL
	VALUES('2000', NULL, '����');
INSERT INTO CATEGORY_TBL
	VALUES('3000', NULL, '�ƿ���');
INSERT INTO CATEGORY_TBL
	VALUES('7000', NULL, 'ACC');
INSERT INTO CATEGORY_TBL
	VALUES('1100', '1000', '����/���콺');
INSERT INTO CATEGORY_TBL
	VALUES('1200', '1000', '��Ʈ');
INSERT INTO CATEGORY_TBL
	VALUES('2100', '2000', 'û����');

commit;


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

ROLLBACK
;


select * from CATEGORY_TBL
;
	
select cg_code, cg_code_prt, cg_name from category_tbl
		where cg_code_prt is null
;

select cg_code, cg_code_prt, cg_name from category_tbl
		where cg_code_prt = 1000
;


select * from CATEGORY_TBL
;

select * from CATEGORY_TBL where CAT_CODE_PRT = 1
;

select cat_code, cat_code_prt, cat_name from category_tbl 
		 where cat_code_prt = 1
;

-- 3. ��ǰ ���̺�
CREATE TABLE PRODUCTEI_TBL (
    PDTEI_NUM              NUMBER               PRIMARY KEY,         -- 3-A. ��ǰ ��ȣ
    CAT_CODE               VARCHAR2(20)         NOT NULL,            -- 3-B. ī�װ� �ڵ� 2��!! �ƴϴ�. �� ģ���� 1���̴�!! �� �ݴ��?
    PDTEI_NAME             VARCHAR2(50)         NOT NULL,            -- 3-C. ��ǰ �̸�
    PDTEI_PRICE            NUMBER               NOT NULL,            -- 3-D. ��ǰ ����
    PDTEI_DISCOUNT         NUMBER               NOT NULL,            -- 3-E. ��ǰ ������
    PDTEI_PRODUCER         VARCHAR2(30)         NOT NULL,            -- 3-F. ��ǰ ���߻�
    PDTEI_DETAIL           CLOB                 NOT NULL,            -- 3-G. ��ǰ �󼼼Ұ�
    PDTEI_IMAGE            VARCHAR2(50)         NOT NULL,            -- 3-H. ��ǰ �̹���(��ǥ)
    PDTEI_AMOUNT           NUMBER               NOT NULL,            -- 3-I. ��ǰ ���� ����
    PDTEI_BUY              CHAR(1)              NOT NULL,            -- 3-J. ��ǰ ���� ��¥
    PDTEI_DATE_SUB       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-K. ��ǰ �������
    PDTEI_DATE_UP        DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. ��ǰ ���� ������
    FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)          -- CAT_CODE(2-B) -> CAT_CODE(2-A)
);

-- 1�� ī�װ� �߰��ؾ� �Ѵ�. �ƴϴ�. 2�� ī�װ��̴�!! �� �ݴ��?
alter TABLE PRODUCTEI_TBL add(CAT_CODE_prt  VARCHAR2(20) NOT NULL)
;

alter TABLE PRODUCTEI_TBL MODIFY(PDTEI_DETAIL VARCHAR2(4000))
;

create SEQUENCE seq_pdtei_num
;

create SEQUENCE seq_pdt_num
;

insert into PRODUCTEI_TBL(pdtei_num, CAT_CODE, PDTEI_NAME, PDTEI_PRICE, PDTEI_DISCOUNT, PDTEI_PRODUCER, PDTEI_DETAIL, PDTEI_IMAGE, PDTEI_AMOUNT, PDTEI_BUY)
VALUES(seq_pdt_num.nextval, cat_code, pdtei_name, pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, pdtei_image, pdtei_amount, pdtei_buy)
;

insert into PRODUCTEI_TBL(pdtei_num, CAT_CODE, CAT_CODE_PRT, PDTEI_NAME, PDTEI_PRICE, PDTEI_DISCOUNT, PDTEI_PRODUCER, PDTEI_DETAIL, PDTEI_IMAGE, PDTEI_AMOUNT, PDTEI_BUY)
values(seq_pdt_num.nextval,pdtei_num, CAT_CODE, CAT_CODE_PRT, PDTEI_NAME, PDTEI_PRICE, PDTEI_DISCOUNT, PDTEI_PRODUCER, PDTEI_DETAIL, PDTEI_IMAGE, PDTEI_AMOUNT, PDTEI_BUY)
;

select * from PRODUCTEI_TBL
;

select * from PRODUCTEI_TBL
  where cat_code_prt = 101
;

CREATE TABLE PRODUCTEI_TBL (
    PDTEI_NUM              NUMBER               PRIMARY KEY,         -- 3-A. ��ǰ ��ȣ
    CAT_CODE               VARCHAR2(20)         NOT NULL,            -- 3-B. ī�װ� �ڵ� 2��!!
    PDTEI_NAME             VARCHAR2(50)         NOT NULL,            -- 3-C. ��ǰ �̸�
    PDTEI_PRICE            NUMBER               NOT NULL,            -- 3-D. ��ǰ ����
    PDTEI_DISCOUNT         NUMBER               NOT NULL,            -- 3-E. ��ǰ ������
    PDTEI_PRODUCER         VARCHAR2(30)         NOT NULL,            -- 3-F. ��ǰ ���߻�
    PDTEI_DETAIL           CLOB                 NOT NULL,            -- 3-G. ��ǰ �󼼼Ұ�
    PDTEI_IMAGE            VARCHAR2(50)         NOT NULL,            -- 3-H. ��ǰ �̹���(��ǥ)
    PDTEI_AMOUNT           NUMBER               NOT NULL,            -- 3-I. ��ǰ ���� ����
    PDTEI_BUY              CHAR(1)              NOT NULL,            -- 3-J. ��ǰ ���� ��¥
    PDTEI_DATE_SUB       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-K. ��ǰ �������
    PDTEI_DATE_UP        DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. ��ǰ ���� ������
    FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)          -- CAT_CODE(2-B) -> CAT_CODE(2-A)
);


-- 4. ��ٱ��� ���̺�
CREATE TABLE CART_TBL (
    CART_CODE              NUMBER               PRIMARY KEY,         -- 4-A. ��ٱ��� �ڵ�
    PDTEI_NUM              NUMBER               NOT NULL,            -- 4-B. ��ǰ��ȣ
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 4-C. ȸ�� ID
    CART_AMOUNT            NUMBER               NOT NULL,            -- 4-D. ���ż���
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID),             -- MBEI_ID(4-C) -> MBEI_ID(1-A)    
    FOREIGN KEY(PDTEI_NUM) REFERENCES PRODUCTEI_TBL(PDTEI_NUM)       -- PDTEI_NUM(4-B) -> PDTEI_NUM(3-A)     
);

create SEQUENCE seq_cart_code
;

create SEQUENCE seq_cart_code
;

-- pdtei_num, mbei_id
merge into cart_tbl c
     using dual
        on (mbei_id = '�����ID' and pdtei_num = '��ǰ�ڵ�')
 when matched then
      update set cart_amount = cart_amount + ����
 when not matched then
      insert(cart_code, pdtei_num, mbei_id, Cart_Amount)
      values(seq_cart_code.nextval, '��ǰ�ڵ�', '�����ID', '����')
;

merge into cart_tbl c
     using dual
        on (mbei_id = 'paradigm2' and pdtei_num = 64)
 when matched then
      update set cart_amount = cart_amount + 2
 when not matched then
      insert(cart_code, pdtei_num, mbei_id, Cart_Amount)
      values(seq_cart_code.nextval, 64, 'paradigm2', 2)
;

merge into cart_tbl c using dual on (?mbei_id = 'paradigm2' and pdtei_num = 6) when matched 
then update set cart_amount = cart_amount + 1 when not matched then insert(cart_code, pdtei_num, 
mbei_id, cart_amount) values(seq_cart_code.nextval, 6, 'paradigm2', 1) 
;

merge into cart_tbl c 
using dual 
on(?mbei_id = 'paradigm2' and pdtei_num = 6) 
when matched then 
    update set cart_amount = cart_amount + 1 
when not matched then 
    insert(cart_code, pdtei_num, mbei_id, cart_amount) values(seq_cart_code.nextval, 6, 'paradigm2', 1) ;

-- CartVO Ŭ���� : cart_code, pdtei_num, mbei_id, cart_amount
select *
from productei_tbl p inner join cart_tbl c
on p.pdtei_num = c.pdtei_num
where c.mbei_id = 'paradigm2'
;

-- CartVO Ŭ���� : cart_code, pdtei_num, mbei_id, cart_amount
-- ȸ���� ���ϸ������ ����
select c.cart_code, p.pdtei_image, p.pdtei_name, c.cart_amount, p.pdtei_price
from productei_tbl p inner join cart_tbl c
on p.pdtei_num = c.pdtei_num
where c.mbei_id = 'paradigm2'
;

-- �۾�1>
insert 
  into order_tbl
       (
       odr_code, mbei_id, ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price)
values()
;

create sequence seq_order_code
;

-- �۾�2>
-- 1) ���λ��
insert order_detail_table(odr_code, pdtei_num, ord_amount, ord_price)
select '�ֹ���ȣ', p.pdtei_num, c.mbei_id, c.cart_amount, p.pdtei_price
  from cart_tbl c inner join productei_tbl p
    on c.pdtei_num = p.pdtei_num
 where mbei_id = 'paradigm2'
;

-- 2) ������ȭ : pdtei_price Į���� ��ٱ��Ͽ� �߰�
insert order_detail_table(odr_code, pdtei_num, ord_amount, ord_price)
select '�ֹ���ȣ', pdtei_num, mbei_id, cart_amount, ord_price
  from cart_tbl 
 where mbei_id = 'paradigm2'
/*
ord_price : ��ǰ����
1) ����ȭ ���� : join���� ó��
2) ������ȭ �۾� : join���� ó���� ���ɻ� �����ʴٰ� �Ǵܵ� ���
   ��, ��ٱ������̺� �ʿ��� �÷��� �߰�
*/

-- �۾�3>
delete 
  from cart_tbl
 where mbei_id = 'paradigm2'
;

-- 5. �ֹ� ���̺�
CREATE TABLE ORDER_TBL (
    ODR_CODE               NUMBER               PRIMARY KEY,         -- 5-A. �ֹ� ��ȣ
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 5-B. ȸ�� ID
    ORD_NAME               VARCHAR2(30)         NOT NULL,            -- 5-C. �ֹ��� �̸�
    ORD_ZIPCODE            CHAR(5)              NOT NULL,            -- 5-D. �ֹ��� �����ȣ
    ORD_ADDR1ST            VARCHAR2(50)         NOT NULL,            -- 5-E. �ֹ��� �⺻�ּ�
    ORD_ADDR2ND            VARCHAR2(50)         NOT NULL,            -- 5-F. �ֹ��� ���ּ�
    ORD_PHONENUM           VARCHAR2(15)         NOT NULL,            -- 5-G. �ֹ��� ��ȭ��ȣ
    ORD_PRICE              NUMBER               NOT NULL,            -- 5-H. �� �ֹ� �ݾ�
    ORD_DATE             DATE DEFAULT SYSDATE   NOT NULL,            -- 5-I. �ֹ���
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID)              -- MBEI_ID(5-B) -> MBEI_ID(1-A)  
);


-- 6. �ֹ��� ���̺�
CREATE TABLE ORDER_DETAIL_TABLE (
    ODR_CODE               NUMBER               REFERENCES ORDER_TBL(ODR_CODE),      -- 6-A. �ֹ� ��ȣ
    PDTEI_NUM              NUMBER               REFERENCES PRODUCTEI_TBL(PDTEI_NUM), -- 6-B. ��ǰ ��ȣ
    ORD_AMOUNT             NUMBER               NOT NULL,                            -- 6-C. �ֹ� ����
    ORD_PRICE              NUMBER               NOT NULL,                            -- 6-D. �ֹ� ����
    PRIMARY KEY (ODR_CODE, PDTEI_NUM)                    
);

odr_code, pdtei_num, ord_amount, ord_price

odr_code, mbei_id, ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date


-- 7. �Խ��� ���̺�
CREATE TABLE BOARD_TBL (
    BRD_NUM                NUMBER               PRIMARY KEY,         -- 7-A. �Խñ� ��ȣ
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 7-B. ȸ�� ID
    BRD_TITLE              VARCHAR2(100)        NOT NULL,            -- 7-C. �Խñ� ����
    BRD_CONTENTS           VARCHAR2(2000)       NOT NULL,            -- 7-D. �Խñ� ����
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL,            -- 7-E. �Խñ� �ۼ���
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID)              -- MBEI_ID(7-B) -> MBEI_ID(1-A)  
);

/*
select * from tbl_board where bno > 0 and rownum <= 10

select * from BOARD_TBL where BRD_NUM > 0 and rownum <= 10
;
*/

select * 
  from board_tbl
 where brd_num > 0 and rownum <= 10
;  

/*
		<![CDATA[
			select bno, title, writer, content, regdate, updateDate, replyCnt
			from 
			(
				select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, writer, content,regdate, updateDate, replyCnt 
		        from tbl_board 
		        where  
	     ]]>
	        
	       <include refid="criteria"></include>
	          
	        
	     <![CDATA[    
	        rownum > 0 and rownum <= #{pageNum} * #{amount}
	        )
			where rn  > (#{pageNum}-1) * #{amount}
		 ]]>


		<![CDATA[
			select brd_num, mbei_id, brd_title, brd_contents, brd_date_reg
			from 
			(
				select /*+ index_desc(board_tbl pk_board) */ rownum rn, brd_num, mbei_id, brd_title, brd_contents, brd_date_reg 
		        from board_tbl 
		        where  
	     ]]>
	        
	       <include refid="criteria"></include>
	          
	        
	     <![CDATA[    
	        rownum > 0 and rownum <= #{pageNum} * #{amount}
	        )
			where rn  > (#{pageNum}-1) * #{amount}
		 ]]>




		select brd_num, mbei_id, brd_title, brd_contents, brd_date_reg
			from 
			(
				select /*+ index_desc(board_tbl pk_board) */ rownum rn, brd_num, mbei_id, brd_title, brd_contents, brd_date_reg 
		        from board_tbl 
		        where       
                
	        rownum > 0 and rownum <= 1
	        )
			where rn  > 0
            
            
            
		select count(*) from tbl_board where  
		
		<include refid="criteria"></include>
		<![CDATA[
		bno > 0
		]]>
        
        
		select count(*) from board_tbl where  
		
		<include refid="criteria"></include>
		<![CDATA[
		brd_num > 0
		]]>   


		select count(*) from board_tbl where  		
		brd_num > 0;
        
        
create sequence seq_board
;  
	private Long brd_num;
	private String mbei_id;
	private String brd_title;
	private String brd_contents;
	private Date brd_date_reg;

		insert into board_tbl(brd_num, mbei_id, brd_title, brd_contents)
		values(seq_board.nextval, #{mbei_id} , #{brd_title}, #{brd_contents})
        
        insert into board_tbl(brd_num, mbei_id, brd_title, brd_contents)
		values(seq_board.nextval, 'test' , '�׽�Ʈ�Դϴ�.', '�ۼ��غ��ڱ�')
        ;
        
        
		update tbl_board set title=#{title}, content=#{content},writer=#{writer}, brd_date_reg = sysdate
		where brd_num = #{brd_num}
        
		update board_tbl set brd_title=#{brd_title}, brd_contents=#{brd_contents}, mbei_id=#{mbei_id}, brd_date_reg = sysdate
		where brd_num = #{brd_num}        
        
        <![CDATA[
		SELECT bno, TITLE, CONTENT, WRITER, REGDATE, UPDATEDATE  FROM TBL_BOARD WHERE BNO = #{bno}
		]]>
        
        <![CDATA[
		SELECT brd_num, mbei_id, brd_title, brd_contents, brd_date_reg 
        FROM board_tbl 
        WHERE brd_num = #{brd_num}
		]]>

		SELECT brd_num, mbei_id, brd_title, brd_contents, brd_date_reg FROM board_tbl WHERE brd_num = 1
        ;

*/

-- 8. ���� ���̺�
CREATE TABLE REVIEW_TBL (
    RV_NUM                 NUMBER               PRIMARY KEY,         -- 8-A. ���� ��ȣ
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 8-B. ȸ�� ID
    PDTEI_NUM              NUMBER               NOT NULL,            -- 8-C. ��ǰ ��ȣ
    RV_CONTECTS            VARCHAR2(200)        NOT NULL,            -- 8-D. ���� ����
    RV_SCORE               NUMBER               NOT NULL,            -- 8-E. ����
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL,            -- 8-F. ���� �ۼ���     
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID),             -- MBEI_ID(8-B) -> MBEI_ID(1-A)
    FOREIGN KEY(PDTEI_NUM) REFERENCES PRODUCTEI_TBL(PDTEI_NUM)       -- PDTEI_NUM(8-C) -> PDTEI_NUM(3-A)
);

--9. ������ �α��� ���̺�
CREATE TABLE ADMIN_TBL(
	ADMIN_ID				VARCHAR2(15)						PRIMARY KEY,
	ADMIN_PW				VARCHAR2(30)						NOT NULL,
	ADMIN_NAME			VARCHAR2(15)						NOT NULL,
	ADMIN_DATE_LATE	DATE DEFAULT	SYSDATE			NOT NULL
);

--4. ������ ���� �߰�  ADMIN_TBL
INSERT INTO ADMIN_TBL(admin_id, ADMIN_PW, ADMIN_NAME)
VALUES('admin', '1111', 'admin')
;

INSERT INTO ADMIN_TBL(admin_id, ADMIN_PW, ADMIN_NAME)
VALUES('admin2', '1111', 'admin');

commit
;
insert into ADMIN_TBL
values('admin2', '1111', 'admin', sysdate)
;

select admin_id, admin_pw, admin_name, admin_date_late
		  from admin_tbl
		 where admin_id = #{admin_id} and admin_pw = #{admin_pw}

select admin_id, admin_pw, admin_name, admin_date_late
		  from admin_tbl
		 where admin_id = #{admin_id} and admin_pw = #{admin_pw}
;

select admin_id, admin_pw, admin_name, admin_date_late
		  from admin_tbl
		 where admin_id = 'admin' and admin_pw = '1111';



/*Data Sector*/

-- ����� ��������
create user ediosmall identified by ediosmall
;

-- ���� �ο�.
grant connect, resource, dba to ediosmall
;

/*
SELECT * FROM MBEIOS_TBL where MBEI_ID =
*/

select * from mbeios_tbl
;

delete from member_tbl where mem_id= 'qwer'
; -- demo �����̴�.

delete from mbeios_tbl where MBEI_ID= 'qwer'
;

/*
		select pdt_num, cg_code, pdt_name, pdt_price, pdt_discount, 
				pdt_company, pdt_detail, pdt_img, pdt_amount, pdt_buy, 
				pdt_date_sub, pdt_date_up
		from	(select pdt_num, cg_code, pdt_name, pdt_price, pdt_discount, 
					pdt_company, pdt_detail, pdt_img, pdt_amount, pdt_buy, 
					pdt_date_sub, pdt_date_up, row_number() over(order by pdt_num desc) p_seq
				from product_tbl
				where cg_code=#{cg_code})
		 where p_seq between #{rowStart} and #{rowEnd} 
*/

/*
-- �Խ��� ���̺�(tbl_board)
select bno, title, writer, content, regdate, updateDate
  from 
        (
        select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, writer, content,regdate, updateDate 
          from tbl_board 
        where  bno > 0 and rownum > 0 and rownum <= #{pageNum} * #{amount}
        )
        
where rn  > (#{pageNum}-1) * #{amount}
*/

-- ��ǰ ���̺� ����
select pdtei_num, cat_code, pdtei_name, 
       pdtei_price, pdtei_discount, 
       pdtei_producer, pdtei_detail, 
       pdtei_image, pdtei_amount, 
       pdtei_buy, pdtei_date_sub, pdtei_date_up
  from 
      (
       select /*+ index_desc(productei_tbl pk_board) */ rownum rn, 
              pdtei_num, cat_code, pdtei_name, 
              pdtei_price, pdtei_discount, 
              pdtei_producer, pdtei_detail, 
              pdtei_image, pdtei_amount, 
              pdtei_buy, pdtei_date_sub, pdtei_date_up 
         from PRODUCTEI_TBL 
        where  pdtei_num > 0 and rownum > 0 and rownum <= #{pageNum} * #{amount}
      )
 where rn > 0 and rownum > 0 and rownum <= #{pageNum} * #{amount}
;





-- ��ǰ ���̺� ����
-- ���̺� ������ �÷��� pk �����ϴ� ��� ���������� �����ϸ�, �ڵ����� �����ȴ�.
-- �ڵ� ������ pk���������̸��� �ε������� �ȴ�.
select 
       pdtei_num, cat_code, cat_code_prt, pdtei_name, 
       pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
       pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
  from 
      (
       select /*+ index_desc(productei_tbl SYS_C0013664) */ rownum rn, 
              pdtei_num, cat_code, cat_code_prt, pdtei_name, 
              pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
              pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
         from productei_tbl 
        where pdtei_num > 0 and rownum > 0 and rownum <= #{pageNum} * #{amount}
      )
 where rn  > (#{pageNum}-1) * #{amount}
;

select * from PRODUCTEI_TBL
;

-- ��ǰ ���̺� ���� (1)
select 
       pdtei_num, cat_code, cat_code_prt, pdtei_name, 
       pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
       pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
  from 
      (
       select /*+ index_desc(productei_tbl SYS_C0013664) */ rownum rn, 
              pdtei_num, cat_code, cat_code_prt, pdtei_name, 
              pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
              pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
         from productei_tbl 
        where pdtei_num > 0 and rownum > 0 and rownum <= 1 * 2
      )
 where rn  > (1-1) * 2
;

-- ��ǰ ���̺� ���� (2)
select 
       pdtei_num, cat_code, cat_code_prt, pdtei_name, 
       pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
       pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
  from 
      (
       select /*+ index_desc(productei_tbl SYS_C0013664) */ rownum rn, 
              pdtei_num, cat_code, cat_code_prt, pdtei_name, 
              pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
              pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
         from productei_tbl 
        where pdtei_num > 0 and rownum > 0 and rownum <= 2 * 2
      )
 where rn  > (2-1) * 2
;

-- ��ǰ ���̺� ���� (2)
select 
       pdtei_num, cat_code, cat_code_prt, pdtei_name, 
       pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
       pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
  from 
      (
       select /*+ index_desc(productei_tbl SYS_C0013664) */ rownum rn, 
              pdtei_num, cat_code, cat_code_prt, pdtei_name, 
              pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
              pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
         from productei_tbl 
        where pdtei_num > 0 and rownum > 0 and rownum <= 3 * 2
      )
 where rn  > (3-1) * 2
;

/*
delete from PRODUCTEI_TBL
;

commit
;

select * from PRODUCTEI_TBL
;
*/

select cat_code, CAT_CODE_PRT, CAT_NAME
  from CATEGORY_TBL
 where CAT_CODE_PRT is null
;

select * from PRODUCTEI_TBL
  where cat_code = 1
;


-- admin_tbl

-- admin_id, admin_pw, admin_name, admin_date_late

/*
create table admin_tbl(
	admin_id				varchar2(15)						primary key,
	admin_pw				varchar2(30)						not null,
	admin_name			varchar2(15)						not null,
	admin_date_late	date default	sysdate			not null
);
*/

-- ���̺���� : 1:N (�ϴ��)
select * from order_tbl             -- 1
;
select * from order_detail_table    -- N
;

select * 
  from order_tbl o inner join
       order_detail_table od
    on o.odr_code = od.odr_code
;


        select 
		       pdtei_num, cat_code, cat_code_prt, pdtei_name, 
		       pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
		       pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
		  from 
		      (
		       select /*+ index_desc(productei_tbl SYS_C0013664) */ rownum rn, 
		              pdtei_num, cat_code, cat_code_prt, pdtei_name, 
		              pdtei_price, pdtei_discount, pdtei_producer, pdtei_detail, 
		              pdtei_image, pdtei_amount, pdtei_buy, pdtei_date_sub, pdtei_date_up 
		         from productei_tbl 
		        where pdtei_num > 0 and 
                
               rownum > 0 and rownum <= #{pageNum} * #{amount}
		      )
		 where rn  > (#{pageNum}-1) * #{amount}
;

/*�ֹ���� ��������(����Ŭ ��Ʈ-�ε���)*/
select *
  from
      (
        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
               odr_code, mbei_id, ord_name, ord_zipcode, 
               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
          from order_tbl
         where odr_code > 0 and 
                
                 rownum > 0 and rownum <= #{pageNum} * #{amount}
      )
 where rn  > (#{pageNum}-1) * #{amount}
; 

/*
select * 
  from order_tbl
 order by odr_code desc 
;
*/

/*�ֹ���� ��������(����Ŭ ��Ʈ-�ε���) - �׽�Ʈ*/
-- ������1
select *
  from
      (
        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
               odr_code, mbei_id, ord_name, ord_zipcode, 
               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
          from order_tbl
         where odr_code > 0 and 
                
                 rownum > 0 and rownum <= 1 * 2
      )
 where rn  > 0
;


select *
  from
      (
        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
               odr_code, mbei_id, ord_name, ord_zipcode, 
               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
          from order_tbl
         where odr_code > 0 and 
                
                 rownum > 0 and rownum <= 1 * 2
      )
 where rn  > 0 and mbei_id = 'paradigm'
;


/*�ֹ���� ��������(����Ŭ ��Ʈ-�ε���) - �׽�Ʈ 2 */
-- ������ 2
select *
  from
      (
        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
               odr_code, mbei_id, ord_name, ord_zipcode, 
               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
          from order_tbl
         where odr_code > 0 and 
                
                 rownum > 0 and rownum <= 4
      )
 where rn  > 2 
; 


/*�ֹ���� ��������(����Ŭ ��Ʈ-�ε���) - �׽�Ʈ 2 */
-- ������ 2
select *
  from
      (
        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
               odr_code, mbei_id, ord_name, ord_zipcode, 
               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
          from order_tbl
         where odr_code > 0 and 
                
                 rownum > 0 and rownum <= 4
      )
 where rn  > 2 and mbei_id = 'paradigm2'
; 


select odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from
		      (
		        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
		               odr_code, mbei_id, ord_name, ord_zipcode, 
		               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		          from order_tbl
		         where odr_code > 0 and 
		
						<include refid="criteria"></include>
		
		                 rownum > 0 and rownum <= #{pageNum} * #{amount}
		      )
		 where rn  > (#{pageNum}-1) * #{amount}		

;

select odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from
		      (
		        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
		               odr_code, mbei_id, ord_name, ord_zipcode, 
		               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		          from order_tbl
		         where odr_code > 0 and 
		
		                 rownum > 0 and rownum <= 8
		      )
		 where rn  > 6	and mbei_id = 'paradigm'

;

select o.ODR_CODE, p.PDTEI_NAME, 
       p.PDTEI_IMAGE, o.ord_amount, o.ord_price
  from productei_tbl p, order_detail_table o
 where p.pdtei_num = o.pdtei_num
   and o.odr_code = #{odr_code}
; 

select o.odr_code, o.pdtei_num, p.pdtei_name, 
       P.pdtei_image, o.ord_amount, o.ord_price
  from productei_tbl p inner join order_detail_table o
    on p.pdtei_num = o.pdtei_num
 where o.odr_code = #{odr_code}
; 

select o.odr_code, o.pdtei_num, p.pdtei_name, 
       P.pdtei_image, o.ord_amount, o.ord_price
  from productei_tbl p inner join order_detail_table o
    on p.pdtei_num = o.pdtei_num
 where o.odr_code = 1
;

/*
select mbei_id, mbei_name, mbei_password, mbei_email, mbei_zipcode, mbei_addr1st, mbei_addr2nd, mbei_phonenum, mbei_nickname_u, mbei_approval, mbei_earnpoints, mbei_date_sub, mbei_date_up, mbei_date_lastlogin
from mbeios_tbl
;

		select 
			   mbei_id, mbei_name, mbei_password, mbei_email, mbei_zipcode, 
			   mbei_addr1st, mbei_addr2nd, mbei_phonenum, mbei_nickname_u, mbei_approval, 
			   mbei_earnpoints, mbei_date_sub, mbei_date_up, mbei_date_lastlogin
		  from mbeios_tbl	
          ;
*/

-- 8. ���� ���̺�
CREATE TABLE REVIEW_TBL (
    RV_NUM                 NUMBER               PRIMARY KEY,         -- 8-A. ���� ��ȣ
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 8-B. ȸ�� ID
    PDTEI_NUM              NUMBER               NOT NULL,            -- 8-C. ��ǰ ��ȣ
    RV_CONTECTS            VARCHAR2(200)        NOT NULL,            -- 8-D. ���� ����
    RV_SCORE               NUMBER               NOT NULL,            -- 8-E. ����
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL,            -- 8-F. ���� �ۼ���     
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID),             -- MBEI_ID(8-B) -> MBEI_ID(1-A)
    FOREIGN KEY(PDTEI_NUM) REFERENCES PRODUCTEI_TBL(PDTEI_NUM)       -- PDTEI_NUM(8-C) -> PDTEI_NUM(3-A)
);


/*
rv_num, mbei_id, pdtei_num, rv_contects, rv_score, brd_date_reg

select 
       rv_num, mbei_id, pdtei_num, 
       rv_contects, rv_score, brd_date_reg
  from review_tbl
where pdtei_num = #{pdtei_num}


RV_NUM, MBEI_ID, PDTEI_NUM, RV_CONTECTS, RV_SCORE, BRD_DATE_REG
*/


/*
		select 
		       rv_num, mbei_id, pdtei_num, 
		       rv_contects, rv_score, brd_date_reg
		  from 
		  	   (
		  	   select /*+ index_desc(review_tbl SYS_C0013698)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
		       	where pdtei_num = #{pdtei_num} and
        	          rv_num > 0 and  
        	          rownum > 0 and 
        	          rownum <= #{cri.pageNum} * #{cri.amount} 
		  	   )
		 where rn  > (#{cri.pageNum} - 1) * #{cri.amount}
         ;
*/

create sequence sqe_review_num
;


/*
		select 
		       rv_num, mbei_id, pdtei_num, 
		       rv_contects, rv_score, brd_date_reg
		  from 
		  	   (
		  	   select /*+ index_desc(review_tbl SYS_C0013698)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
		       	where pdtei_num = #{pdtei_num} and
        	          rv_num > 0 and  
        	          rownum > 0 and 
        	          rownum <= #{cri.pageNum} * #{cri.amount} 
		  	   )
		 where rn  > (#{cri.pageNum} - 1) * #{cri.amount}
      
		select 
		       odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from 
		  	   (
		  	   select /*+ index_desc(order_tbl SYS_C007914)*/ rownum rn,
		  	   		  odr_code, mbei_id, ord_name, ord_zipcode, 
                      ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		       	 from order_tbl
		       	where odr_code = #{odr_code} and
        	          rownum > 0 and 
        	          rownum <= #{cri.pageNum} * #{cri.amount} 
		  	   )
		 where rn  > (#{cri.pageNum} - 1) * #{cri.amount} 


		select 
		       odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from 
		  	   (
		  	   select /*+ index_desc(order_tbl SYS_C007914)*/ rownum rn,
		  	   		  odr_code, mbei_id, ord_name, ord_zipcode, 
                      ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		       	 from order_tbl
		       	where odr_code = 1 and
        	          rownum > 0 and 
        	          rownum <= 5 
		  	   )
		 where rn  > 0
         ;


*/



/*

select product_name, sum(price * amount) money 
        from cart c, product p
        where c.product_id=p.product_id
        group by product_name
        order by product_name    
*/

select p.pdtei_name, sum(p.pdtei_price * c.cart_amount) amount
  from cart_tbl c inner join productei_tbl p
    on c.pdtei_num = p.pdtei_num
group by p.pdtei_name
group by p.pdtei_name
;

select p.pdtei_name, sum(p.pdtei_price * c.cart_amount) amount
  from cart_tbl c inner join productei_tbl p
    on c.pdtei_num = p.pdtei_num
group by p.pdtei_name
group by p.pdtei_name
;

SELECT p.pdtei_name, sum(p.pdtei_price * c.cart_amount) amount
FROM cart_tbl c inner join productei_tbl p
  on c.pdtei_num = p.pdtei_num
group by p.pdtei_name
order by p.pdtei_name
;
  
  
  SELECT 	p.pdtei_name, sum(p.pdtei_price * c.cart_amount) amount
		  FROM 	cart_tbl c inner join productei_tbl p
		    on 	c.pdtei_num = p.pdtei_num
	  group by  p.pdtei_name
	  order by  p.pdtei_name;
  
  
SELECT 
			   p.pdtei_name, 
			   sum(p.pdtei_price * c.cart_amount) amount
		  FROM 
		  	   cart_tbl c inner join productei_tbl p
		       on c.pdtei_num = p.pdtei_num
	  group by p.pdtei_name
	  order by p.pdtei_name
;



-- ����н�
select * from EMPLOYEES
;

-- ��¥������ ����, ���� ������ �����ϴ�. (�ϼ����)
select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE -1, HIRE_DATE + 1 from EMPLOYEES 
;

select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE, HIRE_DATE + 1/24 from EMPLOYEES 
;

-- ��¥ ������ ���̸� ����.
select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE, sysdate - HIRE_DATE from EMPLOYEES 
;

-- ��¥�� ��¥�� ���ϴ� ���� �Ұ���
select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE, sysdate + HIRE_DATE from EMPLOYEES 
;

select sysdate, HIRE_DATE, sysdate - HIRE_DATE, 
       months_between(sysdate,HIRE_DATE), trunc(months_between(sysdate,HIRE_DATE)) 
  from EMPLOYEES 
;

-- ���ƿ��� Ư�����Ͽ� ���� ��¥ ���ϱ�
select next_day(sysdate, 'friday') from dual
;  -- �ѱ۷� �����Ǿ� �ֳ�..

select next_day(sysdate, '�ݿ���') from dual
;

select last_day(sysdate) from dual
;

select sysdate, add_mohths(sysdate, 6) from dual
; -- ���� Ȯ���غ���

-- round, trunc �Լ� ���

-- ����ȯ�Լ� : to_char(������, �����μ�), to_number(������, �����μ�), to_date(������, �����μ�)
-- �Ⱓ ���ǰ˻�(����)

select HIRE_DATE
  from EMPLOYEES
 where to_char(HIRE_DATE) >= '2006-01-01'
; -- 1) 2�� �� ����. ����

select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date('2006-01-01')
; -- 2) ���� ����


-- 2006�� 1���� �˻�
select last_day('2006-01-01') from dual
;

-- 2006�� 1�� �Ⱓ�˻�
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date('2006-01-01')
   and HIRE_DATE <= last_day('2006-01-01')
order by HIRE_DATE
;

-- 2006�� �Ⱓ�˻�
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date('2006-01-01')
   and HIRE_DATE <= last_day('2006-12-01')
order by HIRE_DATE
;

select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE between to_date('2006-01-01')
   and last_day('2006-12-01')
order by HIRE_DATE
;

/* mybatis ����
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date(#{startDate})
   and HIRE_DATE <= last_day(#{endDate})
order by HIRE_DATE

-- �ڹٿ��� ���۳���, ���ᳯ¥�� �Ķ���Ͱ� �غ�.
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date(#{startDate})
   and HIRE_DATE <= to_date(#{endDate})
order by HIRE_DATE
*/

-- level (�ǻ��÷�) : ���̺� �������� �ʴ� �÷�
-- ������ ���� (Depth) 
select level as dt
from dual
;  -- CONNECT BY �� �Բ� �ʼ��� ����ؾ� �մϴ�.

select level as dt
  from dual
connect by level <= 10
;

-- ��¥���� ���̸� ���
-- 2006�� 1�� �޷�
select level as dt, to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt2
  from dual
connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)
;


-- ��¥ ������ ����
-- 2006�� 1��(1��~����) �Ϻ� �Ի��� ������ ���ϱ�
-- 1)��¥������ ����
select to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt2 
  from dual
connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)  
;

-- 2) EMPLOYEES(���)���� HIRE_DATE(�Ի���)�� ���հ�� ������
select    /*�׷�ȭ�� �÷���, �����Լ� ��븸 ����*/
       to_char(hire_date, 'YYYY-MM-DD') as hire_date, count(*) as cnt
  from EMPLOYEES
 where hire_date between to_date('2006-01-01')
   and last_day('2006-01-01')
group by HIRE_DATE
;

-- �ζ��� �� ����

-- 1eft orter join
-- �ܰ�
-- �ζ��� �信 �ߺ��� �����Ͱ� ������ group by�� ���־�� �ϳ�
-- �׷��� �ƴ��ϸ�... 
select  b.dt, a.hiredate, a.cnt
  from 
         (
            select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
              from EMPLOYEES
             where hire_date between to_date('2006-01-01')
               and last_day('2006-01-01')
            group by HIRE_DATE     
         ) a
         ,
         (
            select to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt
              from dual
            connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)         
         ) b
 where b.dt = a.hiredate(+)
 order by dt
; 
-- b.dt, a.hiredate, a.cnt
-- 2�ܰ�
-- �Ʒ� ������ Ȱ���ؼ� ���θ� ������ ��������
select  to_char(b.dt, 'YYYY-MM-DD') as hiredate, nvl(sum(a.cnt), 0) cnt
  from 
         (
            select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
              from EMPLOYEES
             where hire_date between to_date('2006-01-01')
               and last_day('2006-01-01')
            group by HIRE_DATE     
         ) a
         ,
         (
            select to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt
              from dual
            connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)         
         ) b
 where b.dt = a.hiredate(+)
group by b.dt
order by b.dt
; 


-- �Ʒ� ������ Ȱ���ؼ� ���θ� ������ ��������
select to_char(b.dt, 'YYYY-MM-DD') as hiredate , nvl(a.cnt,0)
from (
        select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
        from employees
        where hire_date between to_date('2006-01-01', 'YYYY-MM-DD') and last_day('2006-01-01')
        group by hire_date
     ) a
     ,
     (
         select to_date('2006-01-01','YYYY-MM-DD') + level  - 1 as dt
        from dual
        connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD')+ 1)
     ) b
where b.dt = a.hiredate(+)
order by b.dt; 
; 

-- ansi ���� ����
select  to_char(b.dt, 'YYYY-MM-DD') as hiredate, nvl(sum(a.cnt), 0) cnt
  from 
         (
            select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
              from EMPLOYEES
             where hire_date between to_date('2006-01-01')
               and last_day('2006-01-01')
            group by HIRE_DATE     
         ) a
         right outer join
         (
            select to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt
              from dual
            connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)         
         ) b
 on b.dt = a.hiredate(+)
group by b.dt
order by b.dt
; 


/* mybatis����

select to_char(b.dt, 'YYYY-MM-DD') as hiredate , nvl(a.cnt,0) as cnt
from (
        select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
        from employees
        where hire_date between to_date('2006-01-01', 'YYYY-MM-DD') and last_day('2006-01-01')
        group by hire_date
     ) a
     ,
     (
         select to_date('2006-01-01','YYYY-MM-DD') + level  - 1 as dt
        from dual
        connect by level <= (to_date(#{eDate},'YYYY-MM-DD') - to_date(#{sDate},'YYYY-MM-DD')+ 1)
     ) b
where b.dt = a.hiredate(+)
order by b.dt; 

*/

-- ediosmall : dba ����

-- ���̺���(���̺� ��Ű������ �� ������ ����)
create table ediosmall.employees
as
select * from ora_user.employees
;

/*
-- ���̺� ��Ű����������(�����ʹ� ����)
create table ediosmall.employees
as
select * from ora_user.employees where 0 = 1
;
*/

select * from employees
;


/* mybatis����

select to_char(b.dt, 'YYYY-MM-DD') as hiredate, to_char(b.dt,'DY') as day,  nvl(a.cnt,0) as cnt
from (
        select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
        from employees
        where hire_date between to_date('2006-01-01', 'YYYY-MM-DD') and last_day('2006-01-01')
        group by hire_date
     ) a
     ,
     (
         select to_date('2006-01-01','YYYY-MM-DD') + level  - 1 as dt
        from dual
        connect by level <= (to_date(#{eDate},'YYYY-MM-DD') - to_date(#{sDate},'YYYY-MM-DD')+ 1)
     ) b
where b.dt = a.hiredate(+)
order by b.dt; 

*/


/* mybatis���� : �����Լ��� ������ �����ϴ�. 

select to_char(b.dt, 'YYYY-MM-DD') as hiredate, to_char(b.dt,'DY') as day,  nvl(a.cnt,0) as cnt
from (
        select to_char(hire_date, 'YYYY-MM-DD') as hiredate, count(*) as cnt
        from employees
        where hire_date between to_date('2006-01-01', 'YYYY-MM-DD') and last_day('2006-01-01')
        group by hire_date
     ) a
     ,
     (
         select to_date('2006-01-01','YYYY-MM-DD') + level  - 1 as dt
        from dual
        connect by level <= (to_date(#{eDate},'YYYY-MM-DD') - to_date(#{sDate},'YYYY-MM-DD')+ 1)
     ) b
where b.dt = a.hiredate(+)
order by b.dt; 

*/

		select odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from
		      (
		        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
		               odr_code, mbei_id, ord_name, ord_zipcode, 
		               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		          from order_tbl
		         where odr_code > 0 and 
		                 rownum > 0 and rownum <= #{pageNum} * #{amount}
                         mbei_id = #{}
		      )
		 where rn  > (#{pageNum}-1) * #{amount}		

/*
		select odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from
		      (
		        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
		               odr_code, mbei_id, ord_name, ord_zipcode, 
		               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		          from order_tbl
		         where odr_code > 0 and 
		                 rownum > 0 and 
                         rownum <= #{pageNum} * #{amount} and
                         mbei_id = #{mbei_id}
		      )
		 where rn  > (#{pageNum}-1) * #{amount}		
         
         
         select odr_code, mbei_id, ord_name, ord_zipcode, 
		       ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		  from
		      (
		        select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn,
		               odr_code, mbei_id, ord_name, ord_zipcode, 
		               ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
		          from order_tbl
		         where odr_code > 0 and 
		                 rownum > 0 and 
                         rownum <= 5 and
                         mbei_id = 'paradigm2'
		      )
		 where rn  > 0
         ;

select odr_code, mbei_id, ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, 
ord_date from 
( select /*+ index_desc(order_tbl SYS_C0013680) */ rownum rn, odr_code, mbei_id, 
ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date from order_tbl 
where odr_code > 0 and rownum > 0 and rownum <= 'paradigm2' * 'paradigm2' and mbei_id = 'paradigm2' 
)
where rn > ('paradigm2'-1) * 'paradigm2'

*/

delete from cart_tbl
where cart_code not in ('���õ� ��ǰ�ڵ�1', '���õ� ��ǰ�ڵ�2', '���õ� ��ǰ�ڵ�3', '���õ� ��ǰ�ڵ�4')
;


select sum(���ż���)
group by ��ǰ�ڵ�(��ǰ��)
order by ����


select    /*�׷�ȭ�� �÷���, �����Լ� ��븸 ����*/
       to_char(hire_date, 'YYYY-MM-DD') as hire_date, count(*) as cnt
  from EMPLOYEES
 where hire_date between to_date('2006-01-01')
   and last_day('2006-01-01')
group by HIRE_DATE
;

select    /*�׷�ȭ�� �÷���, �����Լ� ��븸 ����*/
       PDTEI_NUM, sum(*) as cnt
  from ORDER_DETAIL_TABLE
group by PDTEI_NUM
order by cnt DESC
;

select PDTEI_NUM ,sum(ORD_AMOUNT) as amount
 from ORDER_DETAIL_TABLE
group by PDTEI_NUM 
order by amount DESC
; 


select    /*�׷�ȭ�� �÷���, �����Լ� ��븸 ����*/
       o.PDTEI_NUM, count(*) as cnt
  from ORDER_DETAIL_TABLE o, PRODUCTEI_TBL p
group by o.PDTEI_NUM
order by cnt DESC
;

select p.PDTEI_NUM, a.*
  from PRODUCTEI_TBL p,
  (
      select    /*�׷�ȭ�� �÷���, �����Լ� ��븸 ����*/
           o.PDTEI_NUM, count(*) as cnt
      from ORDER_DETAIL_TABLE o, PRODUCTEI_TBL p
    group by o.PDTEI_NUM
  ) a
  ;
  
select p.PDTEI_NAME, a.*
  from PRODUCTEI_TBL p,
  (
      select PDTEI_NUM ,sum(ORD_AMOUNT) as amount
         from ORDER_DETAIL_TABLE
        group by PDTEI_NUM 
  ) a
order by a.amount DESC 
;
  
select PDTEI_NUM ,sum(ORD_AMOUNT) as amount
 from ORDER_DETAIL_TABLE
group by PDTEI_NUM 
order by amount DESC
; 


select p.PDTEI_NAME, a.*
  from PRODUCTEI_TBL p,
  (
      select PDTEI_NUM ,sum(ORD_AMOUNT) as amount
         from ORDER_DETAIL_TABLE
        group by PDTEI_NUM 
  ) a
order by a.amount DESC 
;

��ǰ���̺� �ֹ������̺� ���νõ�.

select p.PDTEI_NAME, sum(o.ORD_AMOUNT) as amount
  from ORDER_DETAIL_TABLE o, PRODUCTEI_TBL p
 where o.pdtei_num = p.pdtei_num
 group by o.PDTEI_NUM
 ;

select p.PDTEI_NAME, o.PDTEI_NUM, o.ORD_AMOUNT
  from ORDER_DETAIL_TABLE o inner join PRODUCTEI_TBL p
    on o.pdtei_num = p.pdtei_num
 group by o.PDTEI_NUM 
;



select max(p.pdtei_name) as name, max(o.pdtei_num) as code, sum(o.ORD_AMOUNT) as amount
  from ORDER_DETAIL_TABLE o inner join PRODUCTEI_TBL p
    on o.pdtei_num = p.pdtei_num
 group by o.PDTEI_NUM 
;

      select PDTEI_NUM ,sum(ORD_AMOUNT) as amount
         from ORDER_DETAIL_TABLE
        group by PDTEI_NUM ;
        

select 
       max(p.pdtei_name) as name, 
       max(o.pdtei_num) as code, 
       sum(o.ord_amount) as amount
  from order_detail_table o inner join productei_tbl p
    on o.pdtei_num = p.pdtei_num
 group by o.pdtei_num 
;



/*
		update mbeios_tbl		
		    set mbei_password = #{mbei_password}
		where MBEI_ID = #{mbei_id}	


*/
  
  
  
/*

select
				mbei_id, mbei_name, mbei_password, mbei_email, mbei_zipcode,
				mbei_addr1st, mbei_addr2nd, mbei_phonenum, mbei_nickname_u,
				mbei_approval, mbei_earnpoints, mbei_date_sub, mbei_date_up,
				mbei_date_lastlogin
		  from
		  		(
	  			select
	  					/*+ index_desc(mbeios_tbl pk_member) */ rownum rn, 
						mbei_id, mbei_name, mbei_password, mbei_email, mbei_zipcode,
						mbei_addr1st, mbei_addr2nd, mbei_phonenum, mbei_nickname_u,
						mbei_approval, mbei_earnpoints, mbei_date_sub, mbei_date_up,
						mbei_date_lastlogin
				from 	mbeios_tbl
					
				where   mbei_id is not null and
	
		        	  rownum > 0 and rownum <= 5
		  		)
		  		
		 where  rn  > 0
         
         
         
		select count(*)
		  from mbeios_tbl
		 where 
		  

		  	   mbei_id is not null         

*/  

/*
		select 
		       max(p.pdtei_name) as name, 
		       max(o.pdtei_num) as code, 
		       sum(o.ord_amount) as amount
		  from order_detail_table o inner join productei_tbl p
		    on o.pdtei_num = p.pdtei_num
		 group by o.pdtei_num
         order by amount DESC
         
		select 
		       max(p.pdtei_name) as name, 
		       max(o.pdtei_num) as code, 
		       sum(o.ord_amount) as amount,
               max(p.pdtei_amount) as p_amount
		  from order_detail_table o inner join productei_tbl p
		    on o.pdtei_num = p.pdtei_num
		 group by o.pdtei_num
         order by amount DESC   
         
         
		select 
		       max(p.pdtei_name) as name, 
		       max(o.pdtei_num) as pdtei_num, 
		       sum(o.ord_amount) as amount,
               max(p.pdtei_amount) as amount2
		  from order_detail_table o inner join productei_tbl p
		    on o.pdtei_num = p.pdtei_num
		 group by o.pdtei_num
         order by amount DESC          
*/

select pdtei_num, pdtei_name, pdtei_price, pdtei_amount
  from productei_tbl
 order by pdtei_amount DESC
; 


select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from review_tbl r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
;

select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from (
        select /*+ index_desc(review_tbl pk_review)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
                 
                 
        ) r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
;


select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from (
        select /*+ index_desc(review_tbl pk_review)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
                where
                      rownum > 0 and rownum <= 11
                 
        ) r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
 where rn  > 0  
;

/*
<![CDATA[
select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from (
        select /*+ index_desc(review_tbl pk_review)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
                where
]]>
<include refid="criteria"></include>
<![CDATA[    
	                    rownum > 0 and rownum <= #{pageNum} * #{amount}
]]>                        
                 
        ) r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
<![CDATA[
 where rn  > (#{pageNum}-1) * #{amount}
]]>  
*/

select count(*) 
from review_tbl 
where pdtei_num > 0
;


		select count(*) 
		  from review_tbl 
		 where rv_num > 0
         ;
         
select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from review_tbl r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
;

select count(*)
  from review_tbl r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
 where rv_num > 0
; 

select count(*)
  from review_tbl r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
 where r.rv_num > 0
; 

select count(r.rv_num)
  from review_tbl r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
 where r.rv_num > 0
; 


select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from (
        select /*+ index_desc(review_tbl pk_review)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
                where      
(  mbei_id like '%' || 'paradigm2' || '%' )
                rownum > 0 and rownum <= 5
                 
        ) r inner join productei_tbl p
    on r.pdtei_num = p.pdtei_num
 where rn  > 0
;


			select brd_num, mbei_id, brd_title, brd_contents, brd_date_reg
			from 
			(
				select /*+ index_desc(board_tbl pk_board) */ rownum rn, brd_num, mbei_id, brd_title, brd_contents, brd_date_reg 
		        from board_tbl 
		        where  
	       (  mbei_id like '%' || "paradigm2" || '%' )
	        rownum > 0 and rownum <= 5
	        )
			where rn  > 0
            ;
            
 
select 
       p.pdtei_num as pdtei_num,
       r.mbei_id as mbei_id,        
       p.pdtei_name as pdtei_name,        
       r.rv_score as rv_score,
       r.rv_contects as rv_contects,
       r.brd_date_reg as brd_date_reg     
  from (
        select /*+ index_desc(review_tbl pk_review)*/ rownum rn,
		  	   		  rv_num, mbei_id, pdtei_num, 
		       		  rv_contects, rv_score, brd_date_reg
		       	 from review_tbl
                where
                      rownum > 0 and rownum <= 11
                 
        ) r inner join 
        (
        select pdtei_num, pdtei_name
          from productei_tbl
         where pdtei_num > 0
        ) p       
    on r.pdtei_num = p.pdtei_num
 where rn  > 0  
;

select pdtei_num, pdtei_name
  from productei_tbl
 where pdtei_num > 0 
 
select rv_num, mbei_id, pdtei_num, rv_contects, rv_score, brd_date_reg
  from review_tbl
 where rv_num = 1
; 



		select 
		       pdtei_num, pdtei_name, pdtei_price, pdtei_amount
		  from 
		      (
		       select /*+ index_desc(productei_tbl pk_product) */ rownum rn, 
		              pdtei_num, pdtei_name, pdtei_price, pdtei_amount
		         from productei_tbl 
		        where pdtei_num > 0 and 
		 
		 
		        	  rownum > 0 and rownum <= 5		       
		      )
		      
		 where rn  > 0
		 order by pdtei_amount ASC;
         
         
         select 
		       pdtei_num, pdtei_name, pdtei_price, pdtei_amount
		  from 
		      (
		       select /*+ index_desc(productei_tbl pk_product) */ rownum rn, 
		              pdtei_num, pdtei_name, pdtei_price, pdtei_amount
		         from productei_tbl 
		        where pdtei_num > 0 and 
		 
		 
		        	  rownum > 0 and rownum <= 5		       
		      )
		      
		 where rn  > 0
         
     order by pdtei_amount ASC; 
     
     
     select 
		       pdtei_num, pdtei_name, pdtei_price, pdtei_amount
		  from 
		      (
		       select /*+ index_desc(productei_tbl pk_product) */ rownum rn, 
		              pdtei_num, pdtei_name, pdtei_price, pdtei_amount
		         from (select pdtei_num, pdtei_name, pdtei_price, pdtei_amount from productei_tbl order by pdtei_amount) 
		        where pdtei_num > 0 and 
		 
		 
		        	  rownum > 0 and rownum <= 5		       
		      )
		      
		 where rn  > 0
         


		 
         
         
         