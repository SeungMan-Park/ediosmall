package com.ediosmall.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ediosmall.domain.CartVO;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.dto.CartDTO;
import com.ediosmall.service.CartService;
import com.ediosmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/cart/*")  // 공통주소로 사용 또는 jsp폴더명
public class CartController {
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
	@Resource(name ="uploadPath")
	private String uploadPath;	
	
	@ResponseBody
	@PostMapping("/add")
	public ResponseEntity<String> cart_add(long pdtei_num, int pdtei_amount, HttpSession session, HttpServletResponse response) throws Exception{
		
//		log.info("cart_add : " + pdtei_num);
//		log.info("cart_add : " + pdtei_amount);
		
		
		
		
		
		ResponseEntity<String> entity = null;
		
		// 인증체크작업
		if(session.getAttribute("loginStatus") == null) {
			
			log.info("로그인이 안되었습니다.");
			
			entity = new ResponseEntity<String>("LoginRequired", HttpStatus.OK);
			
			return entity;
		}
		
		// loginStatus
		
		MbeiosVO vo = (MbeiosVO) session.getAttribute("loginStatus");
		
		// CartVO cart = new CartVO(0, pdtei_num, vo.getMbei_id(), pdtei_amount);
		CartVO cart = new CartVO(0, pdtei_num, vo.getMbei_id(), pdtei_amount);
		
		log.info("cart_add" + cart);
		
		try {
			cartService.add_cart(cart);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session, Model model) throws Exception{
		
		log.info("cart_list");
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		model.addAttribute("cartVOList", cartService.list_cart(mbei_id));
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displyFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
	// 장바구니 개별 삭제
	@ResponseBody
	@PostMapping("/delete")
	public ResponseEntity<String> cart_delete(int cart_code) throws Exception{
		
		log.info("delete : " + cart_code);
		
		ResponseEntity<String> entity = null; 
		
		cartService.deleteCart(cart_code);
		
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		
		return entity;
	}
	
	// 선택상품 주문
	@PostMapping("/cart_check_order")
	@ResponseBody
	public ResponseEntity<String> cart_check_order(@RequestParam ("checkArr[]") List<Integer> checkArr) throws Exception{
		
		log.info("cart_check_order : " + checkArr);
		
		ResponseEntity<String> entity = null; 
		
		try {
			cartService.cart_not_check_delete(checkArr);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}	
	
	
	// 장바구니 비우기
	@GetMapping("/cart_all_delete")
	public String cartAll_delete(HttpSession session) throws Exception{
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		cartService.cartAll_delete(mbei_id);
		
		return "redirect:/cart/cart_list";
	}
	
	// 장바구니 비우기2
	@PostMapping("/cart_all_delete2")
	@ResponseBody
	public ResponseEntity<String> cartAll_ajaxdelete(HttpSession session) throws Exception{
		
		ResponseEntity<String> entity = null; 
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		
		try {
			cartService.cartAll_delete(mbei_id);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@PostMapping("/cart_check_delete")
	@ResponseBody
	public ResponseEntity<String> cart_check_delete(@RequestParam ("checkArr[]") List<Integer> checkArr) throws Exception{
		
		log.info("cart_check_delete : " + checkArr);
		
		ResponseEntity<String> entity = null; 
		
		try {
			cartService.cart_check_delete(checkArr);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@PostMapping("/cart_amount_update")
	@ResponseBody
	public ResponseEntity<String> cart_amount_update(int cart_code, int cart_amount) throws Exception{
		
		ResponseEntity<String> entity = null; 
		
		try {
			cartService.cart_amount_update(cart_code, cart_amount);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@GetMapping("/chart_sample")
	public void chart_sample(Model model) {
		
		List<CartDTO> items = new ArrayList<CartDTO>();
		
		Random random = new Random();
		
		for(int i=1; i<=5; i++) {
			CartDTO cart = new CartDTO();
			int price = random.nextInt(10000 - 1000 + 1) + 1000;
			cart.setCart_amount(price);
			cart.setPdtei_name("전자제품"+ i);
			
			items.add(cart);
		}
		
	
		/*
		pie chart sample data
		[
          ['상품명', '가격'],
          ['전자제품1', 15000],
          ['전자제품2', 25000],
          ['전자제품3', 18000],
          ['전자제품4', 16500],
          ['전자제품5', 35000]
        ]
		 */
		int num = 0;
		String str = "[";
		str += "['상품명', '가격'],";
		for(CartDTO dto : items) {
			str += "['";
			str += dto.getPdtei_name();
			str += "',";
			str += dto.getCart_amount();
			str += "]";
			
			num++;
			if(num < items.size()) str += ",";
		}
		
		str += "]";
		
		log.info(str);
		
		model.addAttribute("chartData", str);
		
		
		
	}

}
