package com.ediosmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.ReviewVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.mapper.AdReviewMapper;

import lombok.Setter;

@Service
public class AdReviewServiceImpl implements AdReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private AdReviewMapper adReviewMapper;

	@Override
	public List<ReviewVO> getReviewListWithPagingAd(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adReviewMapper.getReviewListWithPagingAd(cri);
	}

	@Override
	public int getCountByReview(Criteria cri) {
		// TODO Auto-generated method stub
		return adReviewMapper.getCountByReview(cri);
	}

	@Override
	public ReviewVO review_read(Long rv_num) {
		// TODO Auto-generated method stub
		return adReviewMapper.review_read(rv_num);
	}

	@Override
	public int modify(ReviewVO review) {
		// TODO Auto-generated method stub
		return adReviewMapper.modify(review);
	}

	@Override
	public int remove(Long rv_num) {
		// TODO Auto-generated method stub
		return adReviewMapper.remove(rv_num);
	}

	@Override
	public List<ReviewVO> getRListWithPagingAd_pro(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adReviewMapper.getRListWithPagingAd_pro(cri);
	}

	@Override
	public List<ReviewVO> review_read_pro(Long pdtei_num) throws Exception {
		// TODO Auto-generated method stub
		return adReviewMapper.review_read_pro(pdtei_num);
	}

	
	

}
