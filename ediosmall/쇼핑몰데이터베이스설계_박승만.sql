/*
작성자 : 박승만
편집일 : 2021/03/03
참고사이트 :
- http://www.darkvictory.co.kr/
- http://www.la-room.kr/

프로젝트명 : 쇼핑몰(Eidos_fashion)_능력단위평가
목표 : 쇼핑몰의 각 테이블을 생성 및 기능을 이해한다.

rv_score
*/

/*Table Sector*/

/* mbeios_tbl  */
-- 1. 회원가입 테이블

drop TABLE MBEIOS_TBL
;

CREATE TABLE MBEIOS_TBL (
    MBEI_ID                VARCHAR2(15)         PRIMARY KEY,         -- 1-A. 회원 ID
    MBEI_NAME              VARCHAR2(30)         NOT NULL,            -- 1-B. 회원 이름
    MBEI_PASSWORD          VARCHAR2(15)         NOT NULL,            -- 1-C. 회원 패스워드
    MBEI_EMAIL             VARCHAR2(50)         NOT NULL,            -- 1-D. 회원 이메일
    MBEI_ZIPCODE           CHAR(5)              NOT NULL,            -- 1-E. 회원 우편번호
    MBEI_ADDR1ST           VARCHAR2(50)         NOT NULL,            -- 1-F. 회원 기본주소
    MBEI_ADDR2ND           VARCHAR2(50)         NOT NULL,            -- 1-G. 회원 상세주소
    MBEI_PHONENUM          VARCHAR2(15)         NOT NULL,            -- 1-H. 회원 전화번호
    MBEI_NICKNAME_U        VARCHAR2(20)         NOT NULL UNIQUE,     -- 1-I. 회원 닉네임
    MBEI_APPROVAL          CHAR(1)              NOT NULL,            -- 1-J. 회원 이메일 수신여부
    MBEI_EARNPOINTS        NUMBER DEFAULT 0     NOT NULL,            -- 1-K. 회원 적립금
    MBEI_DATE_SUB        DATE DEFAULT SYSDATE   NOT NULL,            -- 1-L. 회원 가입입
    MBEI_DATE_UP         DATE DEFAULT SYSDATE   NOT NULL,            -- 1-M. 회원 정보 수정일
    MBEI_DATE_LASTLOGIN  DATE DEFAULT SYSDATE   NOT NULL             -- 1-N. 회원 마지막 접속시간

);

alter TABLE MBEIOS_TBL add(mbei_autocode CHAR(1) DEFAULT 'N' NOT NULL)
;

alter TABLE MBEIOS_TBL drop COLUMN mbei_autocode;

alter TABLE MBEIOS_TBL MODIFY( MBEI_ADDR1ST VARCHAR2(2000));
alter TABLE MBEIOS_TBL MODIFY( MBEI_ADDR2ND VARCHAR2(2000));

-- 2. 카테고리 테이블
CREATE TABLE CATEGORY_TBL (
    CAT_CODE               VARCHAR2(20)         PRIMARY KEY,         -- 2-A. 현재 카테고리 코드
    CAT_CODE_PRT           VARCHAR2(20),                             -- 2-B. 부모 카테고리 
    CAT_NAME               VARCHAR2(50)         NOT NULL,            -- 2-C. 카테고리 명
    FOREIGN KEY(CAT_CODE_PRT) REFERENCES CATEGORY_TBL(CAT_CODE)      -- CAT_CODE_PRT(2-B) -> CAT_CODE(2-A)
);

INSERT INTO CATEGORY_TBL
	VALUES('1000', NULL, '상의');
INSERT INTO CATEGORY_TBL
	VALUES('2000', NULL, '하의');
INSERT INTO CATEGORY_TBL
	VALUES('3000', NULL, '아우터');
INSERT INTO CATEGORY_TBL
	VALUES('7000', NULL, 'ACC');
INSERT INTO CATEGORY_TBL
	VALUES('1100', '1000', '셔츠/블라우스');
INSERT INTO CATEGORY_TBL
	VALUES('1200', '1000', '니트');
INSERT INTO CATEGORY_TBL
	VALUES('2100', '2000', '청바지');

commit;


-- 1차 카테고리 : 상의(1), 하의(2), 신발(3), 가방(4), 악세사리(5)
INSERT INTO CATEGORY_TBL
	VALUES('1', NULL, '상의')
;
INSERT INTO CATEGORY_TBL
	VALUES('2', NULL, '하의')
;
INSERT INTO CATEGORY_TBL
	VALUES('3', NULL, '신발')
;
INSERT INTO CATEGORY_TBL
	VALUES('4', NULL, '가방')
;
INSERT INTO CATEGORY_TBL
	VALUES('5', NULL, '악세사리')
;

-- 1차 카테고리 : 상의(1)
-- 2차 카테고리 : 긴팔티(11), 티셔츠(12), 후드티(13), 반팔티(14)
INSERT INTO CATEGORY_TBL
	VALUES('101', '1', '긴팔티')
;
INSERT INTO CATEGORY_TBL
	VALUES('102', '1', '티셔츠')
;
INSERT INTO CATEGORY_TBL
	VALUES('103', '1', '후드티')
;
INSERT INTO CATEGORY_TBL
	VALUES('104', '1', '반팔티')
;

-- 1차 카테고리 : 하의(2)
-- 2차 카테고리 : 면바지(21), 청바지(22), 스키니(23), 반바지(24)
INSERT INTO CATEGORY_TBL
	VALUES('201', '2', '면바지')
;
INSERT INTO CATEGORY_TBL
	VALUES('202', '2', '청바지')
;
INSERT INTO CATEGORY_TBL
	VALUES('203', '2', '스키니')
;
INSERT INTO CATEGORY_TBL
	VALUES('204', '2', '반바지')
;

-- 1차 카테고리 : 신발(3)
-- 2차 카테고리 : 운동화(31), 스니커즈(32), 구두(33), 샌들(34)
INSERT INTO CATEGORY_TBL
	VALUES('301', '3', '운동화')
;
INSERT INTO CATEGORY_TBL
	VALUES('302', '3', '스니커즈')
;
INSERT INTO CATEGORY_TBL
	VALUES('303', '3', '구두')
;
INSERT INTO CATEGORY_TBL
	VALUES('304', '3', '샌들')
;

-- 1차 카테고리 : 가방(4)
-- 2차 카테고리 : 숄더백(41), 토트백(42), 크로스백(43), 크러치백(44)
INSERT INTO CATEGORY_TBL
	VALUES('401', '4', '숄더백')
;
INSERT INTO CATEGORY_TBL
	VALUES('402', '4', '토트백')
;
INSERT INTO CATEGORY_TBL
	VALUES('403', '4', '크로스백')
;
INSERT INTO CATEGORY_TBL
	VALUES('404', '4', '크러치백')
;

-- 1차 카테고리 : 악세사리(5)
-- 2차 카테고리 : 선글라스(51), 벨트(52), 스카프(53), 팔찌(54)
INSERT INTO CATEGORY_TBL
	VALUES('501', '5', '선글라스')
;
INSERT INTO CATEGORY_TBL
	VALUES('502', '5', '벨트')
;
INSERT INTO CATEGORY_TBL
	VALUES('503', '5', '스카프')
;
INSERT INTO CATEGORY_TBL
	VALUES('504', '5', '팔찌')
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

-- 3. 상품 테이블
CREATE TABLE PRODUCTEI_TBL (
    PDTEI_NUM              NUMBER               PRIMARY KEY,         -- 3-A. 상품 번호
    CAT_CODE               VARCHAR2(20)         NOT NULL,            -- 3-B. 카테고리 코드 2차!! 아니다. 이 친구가 1차이다!! 그 반대다?
    PDTEI_NAME             VARCHAR2(50)         NOT NULL,            -- 3-C. 상품 이름
    PDTEI_PRICE            NUMBER               NOT NULL,            -- 3-D. 상품 가격
    PDTEI_DISCOUNT         NUMBER               NOT NULL,            -- 3-E. 상품 할인율
    PDTEI_PRODUCER         VARCHAR2(30)         NOT NULL,            -- 3-F. 상품 개발사
    PDTEI_DETAIL           CLOB                 NOT NULL,            -- 3-G. 상품 상세소개
    PDTEI_IMAGE            VARCHAR2(50)         NOT NULL,            -- 3-H. 상품 이미지(대표)
    PDTEI_AMOUNT           NUMBER               NOT NULL,            -- 3-I. 상품 남은 수량
    PDTEI_BUY              CHAR(1)              NOT NULL,            -- 3-J. 상품 구매 날짜
    PDTEI_DATE_SUB       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-K. 상품 등록일자
    PDTEI_DATE_UP        DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. 상품 정보 수정일
    FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)          -- CAT_CODE(2-B) -> CAT_CODE(2-A)
);

-- 1차 카테고리 추가해야 한다. 아니다. 2차 카테고리이다!! 그 반대다?
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
    PDTEI_NUM              NUMBER               PRIMARY KEY,         -- 3-A. 상품 번호
    CAT_CODE               VARCHAR2(20)         NOT NULL,            -- 3-B. 카테고리 코드 2차!!
    PDTEI_NAME             VARCHAR2(50)         NOT NULL,            -- 3-C. 상품 이름
    PDTEI_PRICE            NUMBER               NOT NULL,            -- 3-D. 상품 가격
    PDTEI_DISCOUNT         NUMBER               NOT NULL,            -- 3-E. 상품 할인율
    PDTEI_PRODUCER         VARCHAR2(30)         NOT NULL,            -- 3-F. 상품 개발사
    PDTEI_DETAIL           CLOB                 NOT NULL,            -- 3-G. 상품 상세소개
    PDTEI_IMAGE            VARCHAR2(50)         NOT NULL,            -- 3-H. 상품 이미지(대표)
    PDTEI_AMOUNT           NUMBER               NOT NULL,            -- 3-I. 상품 남은 수량
    PDTEI_BUY              CHAR(1)              NOT NULL,            -- 3-J. 상품 구매 날짜
    PDTEI_DATE_SUB       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-K. 상품 등록일자
    PDTEI_DATE_UP        DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. 상품 정보 수정일
    FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)          -- CAT_CODE(2-B) -> CAT_CODE(2-A)
);


-- 4. 장바구니 테이블
CREATE TABLE CART_TBL (
    CART_CODE              NUMBER               PRIMARY KEY,         -- 4-A. 장바구니 코드
    PDTEI_NUM              NUMBER               NOT NULL,            -- 4-B. 상품번호
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 4-C. 회원 ID
    CART_AMOUNT            NUMBER               NOT NULL,            -- 4-D. 구매수량
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
        on (mbei_id = '사용자ID' and pdtei_num = '상품코드')
 when matched then
      update set cart_amount = cart_amount + 수량
 when not matched then
      insert(cart_code, pdtei_num, mbei_id, Cart_Amount)
      values(seq_cart_code.nextval, '상품코드', '사용자ID', '수량')
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

-- CartVO 클래스 : cart_code, pdtei_num, mbei_id, cart_amount
select *
from productei_tbl p inner join cart_tbl c
on p.pdtei_num = c.pdtei_num
where c.mbei_id = 'paradigm2'
;

-- CartVO 클래스 : cart_code, pdtei_num, mbei_id, cart_amount
-- 회원의 마일리지기능 적용
select c.cart_code, p.pdtei_image, p.pdtei_name, c.cart_amount, p.pdtei_price
from productei_tbl p inner join cart_tbl c
on p.pdtei_num = c.pdtei_num
where c.mbei_id = 'paradigm2'
;

-- 작업1>
insert 
  into order_tbl
       (
       odr_code, mbei_id, ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price)
values()
;

create sequence seq_order_code
;

-- 작업2>
-- 1) 조인사용
insert order_detail_table(odr_code, pdtei_num, ord_amount, ord_price)
select '주문번호', p.pdtei_num, c.mbei_id, c.cart_amount, p.pdtei_price
  from cart_tbl c inner join productei_tbl p
    on c.pdtei_num = p.pdtei_num
 where mbei_id = 'paradigm2'
;

-- 2) 역정규화 : pdtei_price 칼럼을 장바구니에 추가
insert order_detail_table(odr_code, pdtei_num, ord_amount, ord_price)
select '주문번호', pdtei_num, mbei_id, cart_amount, ord_price
  from cart_tbl 
 where mbei_id = 'paradigm2'
/*
ord_price : 상품가격
1) 정규화 유지 : join으로 처리
2) 역정규화 작업 : join으로 처리가 성능상 좋지않다고 판단될 경우
   즉, 장바구니테이블에 필요한 컬럼을 추가
*/

-- 작업3>
delete 
  from cart_tbl
 where mbei_id = 'paradigm2'
;

-- 5. 주문 테이블
CREATE TABLE ORDER_TBL (
    ODR_CODE               NUMBER               PRIMARY KEY,         -- 5-A. 주문 번호
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 5-B. 회원 ID
    ORD_NAME               VARCHAR2(30)         NOT NULL,            -- 5-C. 주문자 이름
    ORD_ZIPCODE            CHAR(5)              NOT NULL,            -- 5-D. 주문자 우편번호
    ORD_ADDR1ST            VARCHAR2(50)         NOT NULL,            -- 5-E. 주문자 기본주소
    ORD_ADDR2ND            VARCHAR2(50)         NOT NULL,            -- 5-F. 주문자 상세주소
    ORD_PHONENUM           VARCHAR2(15)         NOT NULL,            -- 5-G. 주문자 전화번호
    ORD_PRICE              NUMBER               NOT NULL,            -- 5-H. 총 주문 금액
    ORD_DATE             DATE DEFAULT SYSDATE   NOT NULL,            -- 5-I. 주문일
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID)              -- MBEI_ID(5-B) -> MBEI_ID(1-A)  
);


-- 6. 주문상세 테이블
CREATE TABLE ORDER_DETAIL_TABLE (
    ODR_CODE               NUMBER               REFERENCES ORDER_TBL(ODR_CODE),      -- 6-A. 주문 번호
    PDTEI_NUM              NUMBER               REFERENCES PRODUCTEI_TBL(PDTEI_NUM), -- 6-B. 상품 번호
    ORD_AMOUNT             NUMBER               NOT NULL,                            -- 6-C. 주문 수량
    ORD_PRICE              NUMBER               NOT NULL,                            -- 6-D. 주문 가격
    PRIMARY KEY (ODR_CODE, PDTEI_NUM)                    
);

odr_code, pdtei_num, ord_amount, ord_price

odr_code, mbei_id, ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date


-- 7. 게시판 테이블
CREATE TABLE BOARD_TBL (
    BRD_NUM                NUMBER               PRIMARY KEY,         -- 7-A. 게시글 번호
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 7-B. 회원 ID
    BRD_TITLE              VARCHAR2(100)        NOT NULL,            -- 7-C. 게시글 제목
    BRD_CONTENTS           VARCHAR2(2000)       NOT NULL,            -- 7-D. 게시글 내용
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL,            -- 7-E. 게시글 작성일
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
		values(seq_board.nextval, 'test' , '테스트입니다.', '작성해보자구')
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

-- 8. 리뷰 테이블
CREATE TABLE REVIEW_TBL (
    RV_NUM                 NUMBER               PRIMARY KEY,         -- 8-A. 리뷰 번호
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 8-B. 회원 ID
    PDTEI_NUM              NUMBER               NOT NULL,            -- 8-C. 상품 번호
    RV_CONTECTS            VARCHAR2(200)        NOT NULL,            -- 8-D. 리뷰 내용
    RV_SCORE               NUMBER               NOT NULL,            -- 8-E. 평점
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL,            -- 8-F. 리뷰 작성일     
    FOREIGN KEY(MBEI_ID) REFERENCES MBEIOS_TBL(MBEI_ID),             -- MBEI_ID(8-B) -> MBEI_ID(1-A)
    FOREIGN KEY(PDTEI_NUM) REFERENCES PRODUCTEI_TBL(PDTEI_NUM)       -- PDTEI_NUM(8-C) -> PDTEI_NUM(3-A)
);

--9. 관리자 로그인 테이블
CREATE TABLE ADMIN_TBL(
	ADMIN_ID				VARCHAR2(15)						PRIMARY KEY,
	ADMIN_PW				VARCHAR2(30)						NOT NULL,
	ADMIN_NAME			VARCHAR2(15)						NOT NULL,
	ADMIN_DATE_LATE	DATE DEFAULT	SYSDATE			NOT NULL
);

--4. 관리자 계정 추가  ADMIN_TBL
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

-- 사용자 계정생성
create user ediosmall identified by ediosmall
;

-- 권한 부여.
grant connect, resource, dba to ediosmall
;

/*
SELECT * FROM MBEIOS_TBL where MBEI_ID =
*/

select * from mbeios_tbl
;

delete from member_tbl where mem_id= 'qwer'
; -- demo 쿼리이다.

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
-- 게시판 테이블(tbl_board)
select bno, title, writer, content, regdate, updateDate
  from 
        (
        select /*+ index_desc(tbl_board pk_board) */ rownum rn, bno, title, writer, content,regdate, updateDate 
          from tbl_board 
        where  bno > 0 and rownum > 0 and rownum <= #{pageNum} * #{amount}
        )
        
where rn  > (#{pageNum}-1) * #{amount}
*/

-- 상품 테이블 참조
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





-- 상품 테이블 참조
-- 테이블 생성시 컬럼에 pk 생성하는 경우 제약조건을 생략하면, 자동으로 생성된다.
-- 자동 생성된 pk제약조건이름이 인덱스명이 된다.
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

-- 상품 테이블 참조 (1)
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

-- 상품 테이블 참조 (2)
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

-- 상품 테이블 참조 (2)
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

-- 테이블관계 : 1:N (일대다)
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

/*주문목록 쿼리생성(오라클 힌트-인덱스)*/
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

/*주문목록 쿼리생성(오라클 힌트-인덱스) - 테스트*/
-- 페이지1
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


/*주문목록 쿼리생성(오라클 힌트-인덱스) - 테스트 2 */
-- 페이지 2
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


/*주문목록 쿼리생성(오라클 힌트-인덱스) - 테스트 2 */
-- 페이지 2
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

-- 8. 리뷰 테이블
CREATE TABLE REVIEW_TBL (
    RV_NUM                 NUMBER               PRIMARY KEY,         -- 8-A. 리뷰 번호
    MBEI_ID                VARCHAR2(15)         NOT NULL,            -- 8-B. 회원 ID
    PDTEI_NUM              NUMBER               NOT NULL,            -- 8-C. 상품 번호
    RV_CONTECTS            VARCHAR2(200)        NOT NULL,            -- 8-D. 리뷰 내용
    RV_SCORE               NUMBER               NOT NULL,            -- 8-E. 평점
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL,            -- 8-F. 리뷰 작성일     
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



-- 통계학습
select * from EMPLOYEES
;

-- 날짜데잍터 덧셈, 뺄셈 연산이 가능하다. (일수계산)
select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE -1, HIRE_DATE + 1 from EMPLOYEES 
;

select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE, HIRE_DATE + 1/24 from EMPLOYEES 
;

-- 날짜 간격의 차이를 구함.
select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE, sysdate - HIRE_DATE from EMPLOYEES 
;

-- 날짜와 날짜를 더하는 것은 불가능
select employee_id, FIRST_NAME, LAST_NAME, HIRE_DATE, sysdate + HIRE_DATE from EMPLOYEES 
;

select sysdate, HIRE_DATE, sysdate - HIRE_DATE, 
       months_between(sysdate,HIRE_DATE), trunc(months_between(sysdate,HIRE_DATE)) 
  from EMPLOYEES 
;

-- 돌아오는 특정요일에 대한 날짜 구하기
select next_day(sysdate, 'friday') from dual
;  -- 한글로 설정되어 있네..

select next_day(sysdate, '금요일') from dual
;

select last_day(sysdate) from dual
;

select sysdate, add_mohths(sysdate, 6) from dual
; -- 쿼리 확인해봐라

-- round, trunc 함수 사용

-- 형변환함수 : to_char(데이터, 포맷인수), to_number(데이터, 포맷인수), to_date(데이터, 포맷인수)
-- 기간 조건검색(성능)

select HIRE_DATE
  from EMPLOYEES
 where to_char(HIRE_DATE) >= '2006-01-01'
; -- 1) 2가 더 좋다. 비추

select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date('2006-01-01')
; -- 2) 성능 좋다


-- 2006년 1월달 검색
select last_day('2006-01-01') from dual
;

-- 2006년 1월 기간검색
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date('2006-01-01')
   and HIRE_DATE <= last_day('2006-01-01')
order by HIRE_DATE
;

-- 2006년 기간검색
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

/* mybatis 구문
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date(#{startDate})
   and HIRE_DATE <= last_day(#{endDate})
order by HIRE_DATE

-- 자바에서 시작날까, 종료날짜의 파라미터값 준비.
select HIRE_DATE
  from EMPLOYEES
 where HIRE_DATE >= to_date(#{startDate})
   and HIRE_DATE <= to_date(#{endDate})
order by HIRE_DATE
*/

-- level (의사컬럼) : 테이블에 존재하지 않는 컬럼
-- 계층형 깊이 (Depth) 
select level as dt
from dual
;  -- CONNECT BY 와 함께 필수로 사용해야 합니다.

select level as dt
  from dual
connect by level <= 10
;

-- 날짜간의 차이를 계산
-- 2006년 1월 달력
select level as dt, to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt2
  from dual
connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)
;


-- 날짜 데이터 가공
-- 2006년 1월(1월~말일) 일별 입사한 직원수 구하기
-- 1)날짜데이터 가공
select to_date('2006-01-01', 'YYYY-MM-DD') + level - 1 as dt2 
  from dual
connect by level <= (last_day('2006-01-01') - to_date('2006-01-01','YYYY-MM-DD') + 1)  
;

-- 2) EMPLOYEES(사원)에서 HIRE_DATE(입사일)별 집합계산 데이터
select    /*그룹화된 컬럼명, 집계함수 사용만 가능*/
       to_char(hire_date, 'YYYY-MM-DD') as hire_date, count(*) as cnt
  from EMPLOYEES
 where hire_date between to_date('2006-01-01')
   and last_day('2006-01-01')
group by HIRE_DATE
;

-- 인라인 뷰 구문

-- 1eft orter join
-- 단계
-- 인라인 뷰에 중복된 데이터가 있으면 group by를 해주어야 하나
-- 그렇지 아니하면... 
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
-- 2단계
-- 아래 쿼리를 활용해서 쇼핑몰 쿼리를 구성하자
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


-- 아래 쿼리를 활용해서 쇼핑몰 쿼리를 구성하자
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

-- ansi 문법 적용
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


/* mybatis구문

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

-- ediosmall : dba 권한

-- 테이블복사(테이블 스키마구조 및 데이터 복사)
create table ediosmall.employees
as
select * from ora_user.employees
;

/*
-- 테이블 스키마구조복사(데이터는 제외)
create table ediosmall.employees
as
select * from ora_user.employees where 0 = 1
;
*/

select * from employees
;


/* mybatis구문

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


/* mybatis구문 : 집계함수로 추출이 가능하다. 

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
where cart_code not in ('선택된 상품코드1', '선택된 상품코드2', '선택된 상품코드3', '선택된 상품코드4')
;


select sum(수매수량)
group by 상품코드(상품명)
order by 정렬


select    /*그룹화된 컬럼명, 집계함수 사용만 가능*/
       to_char(hire_date, 'YYYY-MM-DD') as hire_date, count(*) as cnt
  from EMPLOYEES
 where hire_date between to_date('2006-01-01')
   and last_day('2006-01-01')
group by HIRE_DATE
;

select    /*그룹화된 컬럼명, 집계함수 사용만 가능*/
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


select    /*그룹화된 컬럼명, 집계함수 사용만 가능*/
       o.PDTEI_NUM, count(*) as cnt
  from ORDER_DETAIL_TABLE o, PRODUCTEI_TBL p
group by o.PDTEI_NUM
order by cnt DESC
;

select p.PDTEI_NUM, a.*
  from PRODUCTEI_TBL p,
  (
      select    /*그룹화된 컬럼명, 집계함수 사용만 가능*/
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

상품테이블 주문상세테이블 조인시도.

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
         


		 
         
         
         