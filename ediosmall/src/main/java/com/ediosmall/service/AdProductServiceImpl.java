package com.ediosmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.mapper.AdProductMapper;

import lombok.Setter;

@Service
public class AdProductServiceImpl implements AdProductService {

	@Setter(onMethod_ = @Autowired)
	private AdProductMapper pro_mapper;
	
	
	@Override
	public List<CategoryVO> getCategoryList() throws Exception {
		// TODO Auto-generated method stub
		return pro_mapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCategoryList(String cat_code) throws Exception {
		// TODO Auto-generated method stub
		
		return pro_mapper.getSubCategoryList(cat_code);
	}

	@Override
	public void product_insert(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		pro_mapper.product_insert(vo);
	}

	@Override
	public List<ProductVO> product_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return pro_mapper.product_list(cri);
	}

	@Override
	public int getTotalCountProduct(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return pro_mapper.getTotalCountProduct(cri);
	}

	@Override
	public ProductVO product_modify(Long pdtei_num) throws Exception {
		// TODO Auto-generated method stub
		return pro_mapper.product_modify(pdtei_num);
	}

	@Override
	public void product_modify(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		pro_mapper.product_modifyOk(vo);
	}

	@Override
	public void product_delete(long pdtei_num) throws Exception {
		// TODO Auto-generated method stub
		pro_mapper.product_deleteOk(pdtei_num);
	}

}
