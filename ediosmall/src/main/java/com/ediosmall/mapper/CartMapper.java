package com.ediosmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.CartVO;
import com.ediosmall.domain.CartVOList;
import com.ediosmall.dto.CartDTO;

public interface CartMapper {

	public void add_cart(CartVO vo) throws Exception;
	
	public List<CartVOList> list_cart(String mbei_id) throws Exception;
	
	public void deleteCart(int cart_code) throws Exception;
	
	public void cartAll_delete(String mbei_id) throws Exception;
	
	public void cart_amount_update(@Param("cart_code") int cart_code, @Param("cart_amount") int cart_amount) throws Exception;
	
	public void cart_check_delete(List<Integer> checkArr) throws Exception;
	
	public List<CartDTO> cart_money() throws Exception;
	
	// 선택상품 구매하기
	public void cart_not_check_delete(List<Integer> checkArr) throws Exception;
	
}
