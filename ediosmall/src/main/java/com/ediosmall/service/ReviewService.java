package com.ediosmall.service;

import com.ediosmall.domain.ReviewVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.ReviewPageDTO;

public interface ReviewService {
	
	public ReviewPageDTO getReviewListWithPaging(Criteria cri, int pdtei_num) throws Exception;
	
	public void review_register(ReviewVO vo) throws Exception;
	
	public void review_modify(ReviewVO vo) throws Exception;
	
	public void review_delete(int rv_num) throws Exception;

}
