/*
grant dba, connect, RESOURCE to demo01
*/


/*Table Sector*/

-- 1. 회원가입 테이블
CREATE TABLE MBEIOS_TBL (
    MBEI_ID                VARCHAR2(50) CONSTRAINT pk_member PRIMARY KEY,  -- 1-A. 회원 ID
    MBEI_NAME              VARCHAR2(50)         NOT NULL,                  -- 1-B. 회원 이름
    MBEI_PASSWORD          VARCHAR2(60)         NOT NULL,                  -- 1-C. 회원 패스워드
    MBEI_EMAIL             VARCHAR2(100)        NOT NULL,                  -- 1-D. 회원 이메일
    MBEI_ZIPCODE           CHAR(5)              NOT NULL,                  -- 1-E. 회원 우편번호
    MBEI_ADDR1ST           VARCHAR2(2000)       NOT NULL,                  -- 1-F. 회원 기본주소
    MBEI_ADDR2ND           VARCHAR2(2000)       NOT NULL,                  -- 1-G. 회원 상세주소
    MBEI_PHONENUM          VARCHAR2(50)         NOT NULL,                  -- 1-H. 회원 전화번호
    MBEI_NICKNAME_U        VARCHAR2(50)         NOT NULL,                  -- 1-I. 회원 닉네임
    MBEI_APPROVAL          CHAR(1)              NOT NULL,                  -- 1-J. 회원 이메일 수신여부
    MBEI_EARNPOINTS        NUMBER DEFAULT 0     NOT NULL,                  -- 1-K. 회원 적립금
    MBEI_DATE_SUB        DATE DEFAULT SYSDATE   NOT NULL,                  -- 1-L. 회원 가입입
    MBEI_DATE_UP         DATE DEFAULT SYSDATE   NOT NULL,                  -- 1-M. 회원 정보 수정일
    MBEI_DATE_LASTLOGIN  DATE DEFAULT SYSDATE   NOT NULL                   -- 1-N. 회원 마지막 접속시간
);




-- 2. 카테고리 테이블
CREATE TABLE CATEGORY_TBL (
    CAT_CODE               VARCHAR2(20) CONSTRAINT pk_cate PRIMARY KEY,    -- 2-A. 현재 카테고리 코드 
    CAT_CODE_PRT           VARCHAR2(20),                                   -- 2-B. 부모 카테고리 
    CAT_NAME               VARCHAR2(50)         NOT NULL                   -- 2-C. 카테고리 명
);

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

-- 1차 카테고리 추가 : 빠른배송(6), 계절특선(7), 추천상품(8), 히트상품(9), 할인상품(10), 재출시(11)
INSERT INTO CATEGORY_TBL
	VALUES('6', NULL, '빠른배송')
;

INSERT INTO CATEGORY_TBL
	VALUES('7', NULL, '계절특선')
;

INSERT INTO CATEGORY_TBL
	VALUES('8', NULL, '추천상품')
;

INSERT INTO CATEGORY_TBL
	VALUES('9', NULL, '히트상품')
;

INSERT INTO CATEGORY_TBL
	VALUES('10', NULL, '할인상품')
;

INSERT INTO CATEGORY_TBL
	VALUES('11', NULL, '재출시')
;

commit
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

-- 1차 카테고리 : 빠른배송(6)
-- 2차 카테고리 : 당일(601), 익일(602)
INSERT INTO CATEGORY_TBL
	VALUES('601', '6', '당일')
;
INSERT INTO CATEGORY_TBL
	VALUES('602', '6', '익일')
;

-- 1차 카테고리 : 계절특선(7)
-- 2차 카테고리 : 봄(701), 여름(702), 가을(703), 겨울(704),
INSERT INTO CATEGORY_TBL
	VALUES('701', '7', '봄')
;
INSERT INTO CATEGORY_TBL
	VALUES('702', '7', '여름')
;
INSERT INTO CATEGORY_TBL
	VALUES('703', '7', '가을')
;
INSERT INTO CATEGORY_TBL
	VALUES('704', '7', '겨울')
;

commit
;

-- 1차 카테고리 : 추천상품(8)
-- 2차 카테고리 : 코디추천(801), 구매자추천(802)
INSERT INTO CATEGORY_TBL
	VALUES('801', '8', '코디추천')
;
INSERT INTO CATEGORY_TBL
	VALUES('802', '8', '구매자추천')
;

commit
;

-- 1차 카테고리 : 히트상품(9)
-- 2차 카테고리 : 봄(901), 여름(902), 가을(903), 겨울(904),
INSERT INTO CATEGORY_TBL
	VALUES('901', '9', '봄')
;
INSERT INTO CATEGORY_TBL
	VALUES('902', '9', '여름')
;
INSERT INTO CATEGORY_TBL
	VALUES('903', '9', '가을')
;
INSERT INTO CATEGORY_TBL
	VALUES('904', '9', '겨울')
;

commit
;

-- 1차 카테고리 : 할인상품(10)
-- 2차 카테고리 : 10%(1001), 5%(1002)
INSERT INTO CATEGORY_TBL
	VALUES('1001', '10', '10%')
;
INSERT INTO CATEGORY_TBL
	VALUES('1002', '10', '5%')
;

commit
;

-- 1차 카테고리 : 재출시(11)
-- 2차 카테고리 : 상반기(1101), 하반기(1102)
INSERT INTO CATEGORY_TBL
	VALUES('1101', '11', '상반기')
;
INSERT INTO CATEGORY_TBL
	VALUES('1102', '11', '하반기')
;

commit
;


-- 3. 상품 테이블
CREATE TABLE PRODUCTEI_TBL (
    PDTEI_NUM              NUMBER CONSTRAINT pk_product PRIMARY KEY, -- 3-A. 상품 번호
    CAT_CODE               VARCHAR2(20)         NOT NULL,            -- 3-B. 카테고리 코드
    CAT_CODE_prt           VARCHAR2(20)         NOT NULL,            -- 3-C. 카테고리 코드
    PDTEI_NAME             VARCHAR2(50)         NOT NULL,            -- 3-D. 상품 이름
    PDTEI_PRICE            NUMBER               NOT NULL,            -- 3-E. 상품 가격
    PDTEI_DISCOUNT         NUMBER               NOT NULL,            -- 3-F. 상품 할인율
    PDTEI_PRODUCER         VARCHAR2(30)         NOT NULL,            -- 3-G. 상품 개발사
    PDTEI_DETAIL           CLOB                 NOT NULL,            -- 3-H. 상품 상세소개
    PDTEI_IMAGE            VARCHAR2(100)        NOT NULL,            -- 3-I. 상품 이미지(대표)
    PDTEI_AMOUNT           NUMBER               NOT NULL,            -- 3-J. 상품 남은 수량
    PDTEI_BUY              CHAR(1)              NOT NULL,            -- 3-K. 상품 구매 날짜
    PDTEI_DATE_SUB       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. 상품 등록일자
    PDTEI_DATE_UP        DATE DEFAULT SYSDATE   NOT NULL             -- 3-M. 상품 정보 수정일
);

create SEQUENCE seq_pdtei_num
;



-- 4. 장바구니 테이블
CREATE TABLE CART_TBL (
    CART_CODE              NUMBER CONSTRAINT pk_cart PRIMARY KEY,    -- 4-A. 장바구니 코드
    PDTEI_NUM              NUMBER               NOT NULL,            -- 4-B. 상품번호
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 4-C. 회원 ID
    CART_AMOUNT            NUMBER               NOT NULL             -- 4-D. 구매수량
);

create SEQUENCE seq_cart_code
;




-- 5. 주문 테이블
CREATE TABLE ORDER_TBL (
    ODR_CODE               NUMBER CONSTRAINT pk_order PRIMARY KEY,   -- 5-A. 주문 번호
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 5-B. 회원 ID
    ORD_NAME               VARCHAR2(50)         NOT NULL,            -- 5-C. 주문자 이름
    ORD_ZIPCODE            CHAR(5)              NOT NULL,            -- 5-D. 주문자 우편번호
    ORD_ADDR1ST            VARCHAR2(50)         NOT NULL,            -- 5-E. 주문자 기본주소
    ORD_ADDR2ND            VARCHAR2(50)         NOT NULL,            -- 5-F. 주문자 상세주소
    ORD_PHONENUM           VARCHAR2(15)         NOT NULL,            -- 5-G. 주문자 전화번호
    ORD_PRICE              NUMBER               NOT NULL,            -- 5-H. 총 주문 금액
    ORD_DATE             DATE DEFAULT SYSDATE   NOT NULL            -- 5-I. 주문일
);

create sequence seq_order_code
;

-- 6. 주문상세 테이블
CREATE TABLE ORDER_DETAIL_TABLE (
    ODR_CODE               NUMBER CONSTRAINT pk_order_d   NOT NULL,  -- 6-A. 주문 번호
    PDTEI_NUM              NUMBER CONSTRAINT pk_product_d NOT NULL,  -- 6-B. 상품 번호
    ORD_AMOUNT             NUMBER               NOT NULL,            -- 6-C. 주문 수량
    ORD_PRICE              NUMBER               NOT NULL             -- 6-D. 주문 가격
);


-- 7. 게시판 테이블
CREATE TABLE BOARD_TBL (
    BRD_NUM                NUMBER CONSTRAINT pk_board PRIMARY KEY,   -- 7-A. 게시글 번호
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 7-B. 회원 ID
    BRD_TITLE              VARCHAR2(100)        NOT NULL,            -- 7-C. 게시글 제목
    BRD_CONTENTS           VARCHAR2(2000)       NOT NULL,            -- 7-D. 게시글 내용
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL             -- 7-E. 게시글 작성일
);

create sequence seq_board
;  


-- 8. 리뷰 테이블
CREATE TABLE REVIEW_TBL (
    RV_NUM                 NUMBER CONSTRAINT pk_review PRIMARY KEY,  -- 8-A. 리뷰 번호
    MBEI_ID                VARCHAR2(50)         NOT NULL,            -- 8-B. 회원 ID
    PDTEI_NUM              NUMBER               NOT NULL,            -- 8-C. 상품 번호
    RV_CONTECTS            VARCHAR2(200)        NOT NULL,            -- 8-D. 리뷰 내용
    RV_SCORE               NUMBER               NOT NULL,            -- 8-E. 평점
    BRD_DATE_REG         DATE DEFAULT SYSDATE   NOT NULL             -- 8-F. 리뷰 작성일     
);

create sequence sqe_review_num
;

--9. 관리자 로그인 테이블
CREATE TABLE ADMIN_TBL(
	ADMIN_ID			   VARCHAR2(50) CONSTRAINT pk_admin	PRIMARY KEY, -- 9-A. 관리자 ID
	ADMIN_PW			   VARCHAR2(60)			NOT NULL,
	ADMIN_NAME			   VARCHAR2(50)			NOT NULL,
	ADMIN_DATE_LATE	     DATE DEFAULT SYSDATE	NOT NULL
);

commit
;



