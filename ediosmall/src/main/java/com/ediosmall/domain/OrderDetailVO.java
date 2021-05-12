package com.ediosmall.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderDetailVO {

	// odr_code, pdtei_num, ord_amount, ord_price
	/*
CREATE TABLE ORDER_DETAIL_TABLE (
    ODR_CODE               NUMBER               REFERENCES ORDER_TBL(ODR_CODE),      -- 6-A. 주문 번호
    PDTEI_NUM              NUMBER               REFERENCES PRODUCTEI_TBL(PDTEI_NUM), -- 6-B. 상품 번호
    ORD_AMOUNT             NUMBER               NOT NULL,                            -- 6-C. 주문 수량
    ORD_PRICE              NUMBER               NOT NULL,                            -- 6-D. 주문 가격
    PRIMARY KEY (ODR_CODE, PDTEI_NUM)                    
);	 
	*/
	
	private long odr_code;   // 시퀀스
	private long pdtei_num;
	private int ord_amount;
	private int ord_price;

}
