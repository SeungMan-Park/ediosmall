package com.ediosmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ediosmall.domain.CartVOList;
import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.domain.OrderDetailVO;
import com.ediosmall.domain.OrderVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.OrderSaleDTO;
import com.ediosmall.dto.OrderUiPageDTO;
import com.ediosmall.dto.Order_Sale_HitDTO;
import com.ediosmall.mapper.CartMapper;
import com.ediosmall.mapper.OrderMapper;
import com.ediosmall.mapper.OrderMapperUi;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper orderMapper;
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapperUi orderMapperUi;
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;

	@Transactional
	@Override
	public void order_buy(OrderVO vo, String mbei_id) throws Exception {
		// TODO Auto-generated method stub
		
		orderMapper.order_add(vo);
		orderMapper.orderDetail_add(vo.getOdr_code(), mbei_id);
		cartMapper.cartAll_delete(mbei_id);
		
	}

	@Transactional
	@Override
	public void orderDirect_buy(OrderVO vo, OrderDetailVO vo2) throws Exception {
		// TODO Auto-generated method stub
		orderMapper.order_add(vo);  // 파라미터가 참조형(주소값)으로 전달되기 때문에
		vo2.setOdr_code(vo.getOdr_code());
		orderMapper.orderDirect_add(vo2);
		
	}

	@Override
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.orderInfo_list(cri);
	}

	@Override
	public int getTotalCountOrder(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.getTotalCountOrder(cri);
	}

	@Override
	public List<OrderDetailSeenVO> OrderDetailSeen(long odr_code) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.OrderDetailSeen(odr_code);
	}

	@Override
	public List<OrderVO> orderInfo_list_Ui(Criteria cri, String mbei_id) throws Exception {
		// TODO Auto-generated method stub
		return orderMapperUi.orderInfo_list_Ui(cri, mbei_id);
	}



	@Override
	public List<OrderDetailSeenVO> OrderDetailSeen_Ui(long odr_code) throws Exception {
		// TODO Auto-generated method stub
		return orderMapperUi.OrderDetailSeen_Ui(odr_code);
	}


	
	

	@Override
	public List<OrderSaleDTO> order_sale(String startDate, String endDate) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.order_sale(startDate, endDate);
	}

	@Override
	public int getTotalCountOrder_Ui(String mbei_id) throws Exception {
		// TODO Auto-generated method stub
		return orderMapperUi.getTotalCountOrder_Ui(mbei_id);
	}

	@Override
	public OrderUiPageDTO getOrderInfo_list_UiWithPaging(Criteria cri, long odr_code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order_Sale_HitDTO> order_sale_hit() throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.order_sale_hit();
	}

}
