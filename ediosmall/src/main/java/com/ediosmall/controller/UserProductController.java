package com.ediosmall.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.service.UserProductService;
import com.ediosmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class UserProductController {
	
	@Resource(name ="uploadPath")
	private String uploadPath;	
	
	@Setter(onMethod_ = @Autowired)
	private UserProductService userProductService;
	
	@ResponseBody
	@GetMapping("/subCategoryList/{cat_code}")
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cat_code") String cat_code) throws Exception{
		
		log.info("subCategoryList: " + cat_code);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<CategoryVO>>(userProductService.getSubCategoryList(cat_code), HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 2차 카테고리에 의한 상품목록
	@GetMapping("/product_list")
	public String productListBysubCate(@ModelAttribute("cri") Criteria cri, String cat_code, Model model) throws Exception{
		
		log.info("productListBysubCate: " + cat_code);
		
		log.info("Criteria : " + cri);
		
		cri.setAmount(9);  // 상품출력 개수설정.
		
		model.addAttribute("productVOList", userProductService.getProductListBysubCate(cri, cat_code));
		
		log.info(userProductService.getProductListBysubCate(cri, cat_code).size());
		
		return "/product/product_list";
		
	}
	
	// 상품이미지 뷰
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}	
	
	// 상품상세설명(상품조회)
	@GetMapping("/product_read")
	public void product_read(@RequestParam("pdtei_num") Long pdtei_num, Model model) throws Exception{
		
		log.info("product_read : " + pdtei_num);
		
		ProductVO vo = userProductService.getProductByNum(pdtei_num);
		
		vo.setPdtei_image(FileUtils.thumbToOriginName(vo.getPdtei_image()));
		
		// 기본이미지를 설정작업
		
		model.addAttribute("productVO", vo);
		
	}

}
