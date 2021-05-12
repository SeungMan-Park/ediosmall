package com.ediosmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {
	
	// admin_id, admin_pw, admin_name, admin_date_late
	
	/*
create table admin_tbl(
	admin_id				varchar2(15)						primary key,
	admin_pw				varchar2(30)						not null,
	admin_name			varchar2(15)						not null,
	admin_date_late	date default	sysdate			not null
);
	*/
	
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private Date admin_date_late;

}
