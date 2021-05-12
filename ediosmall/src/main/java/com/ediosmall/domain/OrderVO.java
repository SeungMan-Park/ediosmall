package com.ediosmall.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderVO {
	
	// odr_code, mbei_id, ord_name, ord_zipcode, ord_addr1st, ord_addr2nd, ord_phonenum, ord_price, ord_date
	/*
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
	*/

	private long odr_code;       // 시퀀스
	private String mbei_id;      // 세션정보
	private String ord_name;
	private String ord_zipcode;
	
	private String ord_addr1st;
	private String ord_addr2nd;
	private String ord_phonenum;
	private int ord_price;       // 총 주문 금액
	private Date ord_date;       // DB(default-sysdate)
}
