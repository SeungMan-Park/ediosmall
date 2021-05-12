package com.ediosmall.dto;

import java.util.List;

import com.ediosmall.domain.OrderVO;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OrderUiPageDTO {
	
	private int orderCnt;  // 구매목록 개수 (order_list.jsp 에서 쓰일 예정)
	private List<OrderVO> list; // 구매목록

}
