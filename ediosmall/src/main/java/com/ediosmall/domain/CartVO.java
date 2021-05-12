package com.ediosmall.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class CartVO {

	// cart_code, pdtei_num, mbei_id, cart_amount
	private long cart_code;
	private long pdtei_num;
	private String mbei_id;
	private int cart_amount;
}
