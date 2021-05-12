package com.ediosmall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdBoardVO {
	
	private Long brd_num;
	private String admin_id;
	private String brd_title;
	private String brd_contents;
	private Date brd_date_reg;	

}
