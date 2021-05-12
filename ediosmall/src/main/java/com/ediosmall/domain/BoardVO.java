package com.ediosmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	/*
    brd_num                number               primary key,         -- 7-a. 게시글 번호
    mbei_id                varchar2(15)         not null,            -- 7-b. 회원 id
    brd_title              varchar2(100)        not null,            -- 7-c. 게시글 제목
    brd_contents           varchar2(2000)       not null,            -- 7-d. 게시글 내용
    brd_date_reg         date default sysdate   not null,            -- 7-e. 게시글 작성일
	*/
	
	private Long brd_num;
	private String mbei_id;
	private String brd_title;
	private String brd_contents;
	private Date brd_date_reg;
	

}
