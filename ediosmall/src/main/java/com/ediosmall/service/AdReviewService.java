package com.ediosmall.service;

import java.util.List;

import com.ediosmall.domain.ReviewVO;
import com.ediosmall.dto.Criteria;

public interface AdReviewService {
	
	public List<ReviewVO> getReviewListWithPagingAd(Criteria cri) throws Exception;
	
	public int getCountByReview(Criteria cri);
	
	public ReviewVO review_read(Long rv_num);
	
	public int modify(ReviewVO review);
	
	public int remove(Long rv_num);

}
