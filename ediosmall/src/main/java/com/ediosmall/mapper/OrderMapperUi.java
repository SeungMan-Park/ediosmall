package com.ediosmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.domain.OrderVO;
import com.ediosmall.domain.ReviewVO;
import com.ediosmall.dto.Criteria;

public interface OrderMapperUi {
	
	// 사용자의 주문내역(UI) 확인
	public List<OrderVO> orderInfo_list_Ui(@Param("cri") Criteria cri, @Param("mbei_id") String mbei_id) throws Exception;
	
	public List<OrderVO> getOrderInfo_list_UiWithPaging(@Param("cri") Criteria cri, @Param("odr_code")  long odr_code) throws Exception;

	// 사용자의 주문상품개수(페이징기능에 사용)
	public int getTotalCountOrder_Ui(String mbei_id) throws Exception;	
		
	// 사용자의 주문상세정보(mypage 자세히보기)
	public List<OrderDetailSeenVO> OrderDetailSeen_Ui(@Param("odr_code") long odr_code) throws Exception;
	

}
