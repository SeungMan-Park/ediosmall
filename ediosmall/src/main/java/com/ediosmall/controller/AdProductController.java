package com.ediosmall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ediosmall.domain.CategoryVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.PageDTD;
import com.ediosmall.service.AdProductService;
import com.ediosmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/product/*")
public class AdProductController {
	
	@Setter(onMethod_ = @Autowired)
	private AdProductService service;
	
	@Resource(name ="uploadPath")  // 상품등록시 상품이미지 경로
	private String uploadPath;  // servlet-context.xml에 설정

	// 상품등록폼 : 1차 카테고리정보 출력
	@GetMapping("/product_insert")
	public void product_insert(Model model) throws Exception{
		
		log.info("product_insert");
		
		model.addAttribute("categoryList", service.getCategoryList());
		
	}
	
	// 2차 카테고리정보
	@ResponseBody
	@GetMapping("/subCategoryList/{cat_code}")
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("cat_code") String cat_code) throws Exception{
		
		log.info("subCategoryList" + cat_code);
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<CategoryVO>>(service.getSubCategoryList(cat_code), HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 상품등록
	@PostMapping("/insert")
	public String product_insert(ProductVO vo, RedirectAttributes rttr) throws Exception{
		
		log.info("insert : " + vo);  // 상품이미지명 없는 상태
		
		// 1) 파일업로드 작업
		vo.setPdtei_image(FileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1()));
		
		// 2) 상품정보 DB 삽입작업
		service.product_insert(vo);  // 상품 이미지명이 있는 상태
		
		return "redirect:/admin/product/pro_list";
	}
	
	
	// CKEditor 4.0 업로드처리(상품상세설명에서 사용하는 이미지에 대한 업로드)
	@PostMapping("/imgUpload")
	public void imgUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		// 1) CKEditor를 통하여 업로드된 작업처리
		// 2) 업로드처리를 한 후, 파일정보를 CKEditor에게 돌려줌.
		
		// 출력스트림을 이용하여, 파일업로드 작업
		// 기능핵심 : 클래스의 메서드 학습
		
		log.info("imgUpload");
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			// was(tomcat 9.0)에서 관리하는 프로젝트의 루트경로를 참고해서, 실제 업로드 경로를 반환
			String uploadPath = "/usr/local/tomcat/tomcat-9/webapps/upload/";
			

			//String uploadPath = req.getSession().getServletContext().getRealPath("/") + "resources\\upload\\";			
			
			// File uploadFolder = new File(uploadPath);
			
			if(!new File(uploadPath).exists()) new File(uploadPath).mkdir();
			
//			if(!uploadFolder.exists()) {
//				uploadFolder.mkdir();
//			}
			
			// if(!new File(uploadPath).exists()) new File(uploadPath).mkdir();  // 폴더를 생성해준다. 중요하다!!
			
			uploadPath = uploadPath + fileName;
			
			log.info("ckeditor 파일업로드 경로" + uploadPath);
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			
			// CKEditor에게 업로드한 파일정보를 돌려줘야 한다.
			
			printWriter = res.getWriter();
			// 클라이언트가 직접 이미지를 요청하는 작업
			//String fileUrl = "/upload/" + fileName;
			String fileUrl = "/ckeditor/upload/" + fileName;
			
			// String fileUrl = "/upload/" + fileName;
			
			// ckeditor 4에서 제공하는 형식
			// ﻿{"filename":"abc.gif", "uploaded":1, "url":"/upload/abc.gif"}  json 포맷
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
			printWriter.flush(); // 전송 (return과 같은 역할: 클라이언트로 보냄)

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(printWriter != null) {
				printWriter.close();
			}
		}
		
	}
	
	// 상품관리를 위한 리스트(amount)
	@GetMapping("/pro_amount")
	public void pro_amount(Model model) throws Exception {
		
		model.addAttribute("pro_amount", service.pro_amount());
		
	}
		
	// 상품리스트
	@GetMapping("/pro_list")
//	@RequestMapping(value = "/pro_list", method = {RequestMethod.GET, RequestMethod.POST})
	public String product_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("called pro_list ... " + cri);
		
		// 1) 게시물 데이터
		model.addAttribute("pro_list", service.product_list(cri));
		
		int totalCount = service.getTotalCountProduct(cri);
		
		
		// 2) 페이징 정보.  [이전] 1 2 3 4 5 6 ... [다음]
		model.addAttribute("pageMaker", new PageDTD(cri, totalCount));
		
		return "/admin/product/product_list";
	}
	
	// 상품이미지 뷰
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
		
	// 상품수정폼
	@GetMapping("/modify")
	public String modify(@RequestParam("pdtei_num") Long pdtei_num, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		log.info("modify" + pdtei_num);
		
		// 1차 카테고리
		model.addAttribute("categoryList", service.getCategoryList());
		
		ProductVO vo = service.product_modify(pdtei_num);
		
		// 1차 카테고리
		String cat_code = vo.getCat_code();
		
		// 상품정보(1차카테고리, 2차카테고리)
		model.addAttribute("productVO", vo);
		
		// 2차 카테고리
		model.addAttribute("subCategoryList", service.getSubCategoryList(cat_code));
		
		return "/admin/product/product_modify";
	}
	
	// 상품수정하기
	@PostMapping("/modify")
	public String modify(ProductVO vo, Criteria cri, RedirectAttributes rttr) throws Exception{
		
		log.info("modify : " + vo);  // DB 상품이미지명 있는 상태

		
		// 1) 파일업로드 작업(상품이미지 변경시)
		if(vo.getFile1() != null && vo.getFile1().getSize() > 0) {
			
			// 기존이미지파일 삭제
			String oldImageFileName = vo.getPdtei_image();
			
			FileUtils.deleteFile(uploadPath, oldImageFileName);
			
			// 변경이미지 파일정보
			vo.setPdtei_image(FileUtils.uploadFile(uploadPath, vo.getFile1().getOriginalFilename(), vo.getFile1()));
		}
		
		// 2) 상품정보 DB 삽입작업
		service.product_modify(vo);  // 상품 이미지명이 있는 상태
		
		log.info("Criteria : " + cri);
		
		// 리스트 원래상태정보(Criteria cri ->페이징, 검색포함)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/pro_list";
	}
	
	
	// 상품삭제
	
	@GetMapping("/delete")
	public String delete(long pdtei_num, String pdtei_image, Criteria cri, RedirectAttributes rttr) throws Exception{
		
		log.info("delete : " + pdtei_num);  // DB 상품이미지명 있는 상태
		
		
		// DB에서 상품정보 삭제
		service.product_delete(pdtei_num);
		
		// 상품이미지 삭제
		FileUtils.deleteFile(uploadPath, pdtei_image);

		
		// 리스트 원래상태정보(Criteria cri ->페이징, 검색포함)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/product/pro_list";	
		
				
	}
	
	
	
	
	
	
	
}
