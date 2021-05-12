package com.ediosmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.domain.OrderDetailVO;
import com.ediosmall.domain.OrderVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.OrderSaleDTO;
import com.ediosmall.dto.OrderUiPageDTO;
import com.ediosmall.dto.Order_Sale_HitDTO;

public interface OrderService {
	
	public void order_buy(OrderVO vo, String mbei_id) throws Exception;
	
	public void orderDirect_buy(OrderVO vo, OrderDetailVO vo2) throws Exception;
	
	// 주문리스트
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception;
	
	// 주문상품개수(페이징기능에 사용)
	public int getTotalCountOrder(Criteria cri) throws Exception;	
	
	// 주문상세정보(관리자모드 자세히보기)
	public List<OrderDetailSeenVO> OrderDetailSeen(long odr_code) throws Exception;
	
	// 사용자의 주문내역(UI) 확인
	public List<OrderVO> orderInfo_list_Ui(Criteria cri, String mbei_id) throws Exception;
	
	// 사용자의 주문상품개수(페이징기능에 사용)
	public int getTotalCountOrder_Ui(String mbei_id) throws Exception;	

			
	// 사용자의 주문상세정보(mypage 자세히보기)
	public List<OrderDetailSeenVO> OrderDetailSeen_Ui(long odr_code) throws Exception;	
	
	public OrderUiPageDTO getOrderInfo_list_UiWithPaging(Criteria cri, long odr_code) throws Exception;
	
	// 학습을 위한 통계자료
	public List<OrderSaleDTO> order_sale(String startDate, String endDate) throws Exception;

	// 히트상품 출력해보 보기
	public List<Order_Sale_HitDTO> order_sale_hit() throws Exception;

}
