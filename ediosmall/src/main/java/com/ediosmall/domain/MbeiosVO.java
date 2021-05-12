package com.ediosmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MbeiosVO {
	
	/*
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
    
    인증코드? MBEI_AUTOCODE   CHAR(1) Default 'N'
    
    MEM_AUTHCODE		CHAR(1) DEFAULT 'N'				NOT NULL,
	MEM_SESSION_KEY	VARCHAR2(50),
	MEM_SESSION_LIMIT	TIMESTAMP
 
	*/
	
	private String	mbei_id;
	private String	mbei_name;
	private String	mbei_password;
	private String	mbei_email;
	private String	mbei_zipcode;
	private String	mbei_addr1st;
	private String	mbei_addr2nd;
	private String	mbei_phonenum;
	private String	mbei_nickname_u;
	private String	mbei_approval;
	
	private int 	mbei_earnpoints;
	private Date 	mbei_date_sub;
	private Date 	mbei_date_up;
	private Date 	mbei_date_lastlogin;
	

}
