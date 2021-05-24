package com.ediosmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdReviewVO {
	
	/*
    rv_num                 number               primary key,         -- 8-a. 리뷰 번호
    mbei_id                varchar2(15)         not null,            -- 8-b. 회원 id
    pdtei_num              number               not null,            -- 8-c. 상품 번호
    rv_contects            varchar2(200)        not null,            -- 8-d. 리뷰 내용
    rv_score               number               not null,            -- 8-e. 평점
    brd_date_reg         date default sysdate   not null,            -- 8-f. 리뷰 작성일     
    
    rv_num, mbei_id, pdtei_num, rv_contects, rv_score, brd_date_reg
    
    p.pdtei_num as pdtei_num,
	r.mbei_id as mbei_id,        
	p.pdtei_name as pdtei_name,        
	r.rv_score as rv_score,
	r.rv_contects as rv_contects,
	r.brd_date_reg as brd_date_reg  
    
    
	*/
	
	private Long pdtei_num;
	private String mbei_id;
	private String pdtei_name;
	private Long rv_score;
	private String rv_contects;
	private Date brd_date_reg;
	
	private int rv_num;

}
