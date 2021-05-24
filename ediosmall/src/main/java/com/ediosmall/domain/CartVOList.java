package com.ediosmall.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CartVOList {

	// c.cart_code, p.pdtei_image, p.pdtei_name, p.pdtei_amount, p.pdtei_num, c.cart_amount, p.pdtei_price
	
	private long cart_code;
	private String pdtei_image;
	private String pdtei_name;
	private int pdtei_amount;
	private int pdtei_num;
	private int cart_amount;
	private long pdtei_price;	
	
}
