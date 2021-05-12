package com.ediosmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.ReviewVO;
import com.ediosmall.dto.Criteria;

public interface ReviewMapper {
	
	public List<ReviewVO> getReviewListWithPaging(@Param("cri") Criteria cri, @Param("pdtei_num")  int pdtei_num) throws Exception;

	public int getCountByProduct_pdtei_num(long pdtei_num);
	
	public void review_register(ReviewVO vo) throws Exception;
	
	public void review_modify(ReviewVO vo) throws Exception;
	
	public void review_delete(int rv_num) throws Exception;
	
}
