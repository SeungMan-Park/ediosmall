package com.ediosmall.service;

import java.util.List;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;

public interface AdProductService {

	public List<CategoryVO> getCategoryList() throws Exception;
	
	public List<CategoryVO> getSubCategoryList(String cat_code) throws Exception;
	
	public void product_insert(ProductVO vo) throws Exception;
	
	public List<ProductVO> product_list(Criteria cri) throws Exception;
	
	public int getTotalCountProduct(Criteria cri) throws Exception;
	
	// 상품수정폼
	public ProductVO product_modify(Long pdtei_num) throws Exception;
	
	// 상품 수정하기
	public void product_modify(ProductVO vo) throws Exception;
	
	// 상품 삭제하기
	public void product_delete(long pdtei_num) throws Exception;
	
	// 상품관리를 위한 리스트(amount)
	public List<ProductVO> pro_amount() throws Exception;
	
	// 메인페이지의 상품관리를 위한 리스트(amount)
	public List<ProductVO> pro_amount2(Criteria cri) throws Exception;

}
