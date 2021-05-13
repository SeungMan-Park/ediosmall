package com.ediosmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.mapper.UserProductMapper;

import lombok.Setter;

@Service
public class UserProductServiceImpl implements UserProductService {
	
	@Setter(onMethod_ = @Autowired)
	private UserProductMapper userProductMapper;

	@Override
	public List<CategoryVO> getCategoryList() throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCategoryList(String cat_code) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getSubCategoryList(cat_code);
	}

	@Override
	public List<ProductVO> getProductListBysubCate(Criteria cri, String cat_code) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getProductListBysubCate(cri, cat_code);
	}

	@Override
	public int getTotalCountProductBySubCate(String cat_code) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getTotalCountProductBySubCate(cat_code);
	}

	@Override
	public ProductVO getProductByNum(Long pdtei_num) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getProductByNum(pdtei_num);
	}

	@Override
	public List<ProductVO> getProduct_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getProduct_list(cri);
	}

	@Override
	public int getTotalCountProductSearch(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return userProductMapper.getTotalCountProductSearch(cri);
	}

}
