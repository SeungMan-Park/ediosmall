package com.ediosmall.service;

import java.util.List;

import org.json.simple.JSONObject;

import com.ediosmall.domain.CartVO;
import com.ediosmall.domain.CartVOList;
import com.ediosmall.dto.CartDTO;

public interface CartService {
	
	// 장바구니 추가
	public void add_cart(CartVO vo) throws Exception;
	
	// 장바구니 가져오기
	public List<CartVOList> list_cart(String mbei_id) throws Exception;
	
	// 장바구니 삭제
	public void deleteCart(int cart_code) throws Exception;
	
	// 장바구니 모두 삭제
	public void cartAll_delete(String mbei_id) throws Exception;
	
	public void cart_amount_update(int cart_code, int cart_amount) throws Exception;
	
	public void cart_check_delete(List<Integer> checkArr) throws Exception;
	
	public List<CartDTO> cart_money() throws Exception;
	
	public JSONObject getCharData();
	
	// 선택상품 구매하기
	public void cart_not_check_delete(List<Integer> checkArr) throws Exception;	

}
