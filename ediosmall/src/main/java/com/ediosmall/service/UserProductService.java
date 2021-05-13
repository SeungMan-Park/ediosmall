package com.ediosmall.service;

import java.util.List;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;

public interface UserProductService {
	
	// 1차 카테고리
	public List<CategoryVO> getCategoryList() throws Exception;
	
	// 2차 카테고리
	public List<CategoryVO> getSubCategoryList(String cat_code) throws Exception;	

	// 2차 카테고리에 해당하는 상품목록
	public List<ProductVO> getProductListBysubCate(Criteria cri, String cat_code) throws Exception;
	
	public int getTotalCountProductBySubCate(String cat_code) throws Exception;	
	
	// 상품상세설명
	public ProductVO getProductByNum(Long pdtei_num) throws Exception;	
	
	// 상품리스트(검색)
	public List<ProductVO> getProduct_list(Criteria cri) throws Exception;
	
	// 상품개수(페이징기능에 사용/검색)
	public int getTotalCountProductSearch(Criteria cri) throws Exception;
}
