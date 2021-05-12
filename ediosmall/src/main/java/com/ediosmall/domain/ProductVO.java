package com.ediosmall.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	/*
CREATE TABLE PRODUCTEI_TBL (
    pdtei_num              NUMBER               PRIMARY KEY,         -- 3-A. 상품 번호
    cat_code               VARCHAR2(20)         NOT NULL,            -- 3-B. 카테고리 코드 2차!!
    cat_code_prt           VARCHAR2(20)         NOT NULL,            -- 3-C  카테고리 코드 2차!!
    pdtei_name             VARCHAR2(50)         NOT NULL,            -- 3-D. 상품 이름
    pdtei_price            NUMBER               NOT NULL,            -- 3-E. 상품 가격
    pdtei_discount         NUMBER               NOT NULL,            -- 3-F. 상품 할인율
    pdtei_producer         VARCHAR2(30)         NOT NULL,            -- 3-G. 상품 개발사
    pdtei_detail           CLOB                 NOT NULL,            -- 3-H. 상품 상세소개
    pdtei_image            VARCHAR2(50)         NOT NULL,            -- 3-I. 상품 이미지(대표)
    pdtei_amount           NUMBER               NOT NULL,            -- 3-J. 상품 남은 수량
    pdtei_buy              CHAR(1)              NOT NULL,            -- 3-K. 상품 구매 날짜
    pdtei_date_sub       DATE DEFAULT SYSDATE   NOT NULL,            -- 3-L. 상품 등록일자
    pdtei_date_up        DATE DEFAULT SYSDATE   NOT NULL,            -- 3-M. 상품 정보 수정일
    
    
    FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)          -- CAT_CODE(2-B) -> CAT_CODE(2-A)
);
	*/
	
	private int		pdtei_num;
	private String  cat_code;       // 2차 카테고리
	private String  cat_code_prt;   // 1차 카테고리
	private String  pdtei_name;
	private int		pdtei_price;
	private int		pdtei_discount;
	private String  pdtei_producer;
	private String  pdtei_detail;
	private String  pdtei_image;
	private int		pdtei_amount;
	private String  pdtei_buy;
	private Date 	pdtei_date_sub;
	private Date 	pdtei_date_up;
	
	// 업로드 파일
	// 파일첨부 파라미터 작업
	private MultipartFile file1; // insert.jsp <input type="file" id="file1" name="file1" class="form-control" />


}
