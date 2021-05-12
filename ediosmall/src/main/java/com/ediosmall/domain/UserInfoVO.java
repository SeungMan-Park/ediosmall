package com.ediosmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserInfoVO {
	
	private String	user_id;
	private String	user_name;
	private String	user_password;
	private String	user_email;
	private String	user_zipcode;
	private String	user_addr1st;
	private String	user_addr2nd;
	private String	user_phonenum;
	private String	user_nickname_u;
	private String	user_approval;
	
	private int 	user_earnpoints;
	private Date 	user_date_sub;
	private Date 	user_date_up;
	private Date 	user_date_lastlogin;
	

}
