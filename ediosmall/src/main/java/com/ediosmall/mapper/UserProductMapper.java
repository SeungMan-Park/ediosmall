package com.ediosmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;

public interface UserProductMapper {
	
	// 1차 카테고리
	public List<CategoryVO> getCategoryList() throws Exception;
	
	// 2차 카테고리
	public List<CategoryVO> getSubCategoryList(String cat_code) throws Exception;
	
	// 2차 카테고리에 해당하는 상품목록
	// mapper 인터페이스에서 xml mapper 파일의 sql 구문에 파라미터 적용하는 규칙
	// 파라미터가 1개일 경우에는 필드명을 사용하여 getter메서드를 호출한다.
	// 파라미터가 2개일 경우(타입이 참조형일 경우에는 객체명.필드 형태로 사용해야 한다.)
	// 기본형일 경우에는 직접 사용해야 한다.
	public List<ProductVO> getProductListBysubCate(@Param("cri") Criteria cri, @Param("cat_code_prt") String cat_code_prt) throws Exception;
	
	public int getTotalCountProductBySubCate(String cat_code) throws Exception;
	
	// 상품상세설명
	public ProductVO getProductByNum(Long pdtei_num) throws Exception;
	
	// 상품리스트(검색)
	public List<ProductVO> getProduct_list(Criteria cri) throws Exception;
	
	// 상품개수(페이징기능에 사용/검색)
	public int getTotalCountProductSearch(Criteria cri) throws Exception;
}
