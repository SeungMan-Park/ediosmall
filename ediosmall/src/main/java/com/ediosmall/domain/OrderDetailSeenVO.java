package com.ediosmall.domain;

import lombok.Data;

@Data
public class OrderDetailSeenVO {
	
	/*o.odr_code, o.pdtei_num, p.pdtei_name, 
      p.pdtei_image, o.ord_amount, o.ord_price*/
	
	private long odr_code;
	private long pdtei_num;
	private String pdtei_name;
	private String pdtei_image;
	private int ord_amount;
	private int ord_price;

}
