package com.ediosmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.domain.OrderDetailVO;
import com.ediosmall.domain.OrderVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.OrderSaleDTO;
import com.ediosmall.dto.Order_Sale_HitDTO;

public interface OrderMapper {
	
	// 주문정보
	public void order_add(OrderVO vo) throws Exception;
	
	// 주문상세정보(주문내역)
	public void orderDetail_add(@Param("odr_code") long odr_code, @Param("mbei_id") String mbei_id) throws Exception;
	
	public void orderDirect_add(OrderDetailVO vo) throws Exception;
	
	// 주문리스트
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception;
	
	// 주문상품개수(페이징기능에 사용)
	public int getTotalCountOrder(Criteria cri) throws Exception;	
	
	// 주문상세정보(관리자모드 자세히보기)
	public List<OrderDetailSeenVO> OrderDetailSeen(@Param("odr_code") long odr_code) throws Exception;
	
	// 학습을 위한 통계자료
	public List<OrderSaleDTO> order_sale(@Param("startDate") String startDate, @Param("endDate") String endDate) throws Exception;
	
	// 히트상품 출력해보 보기
	public List<Order_Sale_HitDTO> order_sale_hit() throws Exception;
		
	
}
