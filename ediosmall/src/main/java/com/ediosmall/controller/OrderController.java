package com.ediosmall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ediosmall.domain.CartVOList;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.domain.OrderDetailVO;
import com.ediosmall.domain.OrderVO;
import com.ediosmall.domain.ProductVO;
import com.ediosmall.service.CartService;
import com.ediosmall.service.OrderService;
import com.ediosmall.service.UserProductService;
import com.ediosmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderController {
	
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	private UserProductService userProductService;
	
	@Resource(name ="uploadPath")
	private String uploadPath;	
	

//	@PostMapping("/order")  // 즉시구매
//	@GetMapping("/order")   // 장바구니 경유     @RequestParam
	// @RequestParam(required = false)  : get 요청에 의한 해당쿼리스트링이 존재하지 않아도 처리하고자 할 때 사용. (예외발생이 안됨)
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public void order(HttpSession session, @ModelAttribute("type") String type, @RequestParam(required = false) Long pdtei_num, @RequestParam(required = false) Integer ord_amount, Model model) throws Exception{
		
		// type :  1) 즉시구매, 2) 장바구니를 기반으로 주문하기
		
		// 사용자별 장바구니 내역
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		
		if(type.equals("1")) {
			
			// 즉시구매
			log.info("즉시구매" + type);
			
			// 구매상품에 대한 정보를 표시
			ProductVO vo = userProductService.getProductByNum((long)pdtei_num);
			
			// 매개변수가 있는 생성자를 만들어서, 디폴트생성자 처리해 줄것!
			CartVOList cartvo = new CartVOList(0, vo.getPdtei_image(), vo.getPdtei_name(), (int)ord_amount, vo.getPdtei_price());
			
			List<CartVOList> cartvoList = new ArrayList<CartVOList>();
			cartvoList.add(cartvo);
			
			model.addAttribute("cartVOList", cartvoList);
			
			// 즉시구매시 상품상세정보를 폼에 삽입하기위한 Model작업
			model.addAttribute("pdtei_num", pdtei_num);
			model.addAttribute("ord_amount", ord_amount);
			model.addAttribute("ord_price", vo.getPdtei_price());
			
		}else if(type.equals("2")){
			
			log.info("장바구니 기반으로 구매" + type);
			// 구매상품을 장바구니에서 가져와서 표시
			model.addAttribute("cartVOList", cartService.list_cart(mbei_id)); 
			
			// 사용하지 않는 값이지만, 주문하기 클릭을 하게되면, OrderDetailVO vo2 파라미터에서 에러 발생이되므로,
			// 형식만 유지를 했음.
			model.addAttribute("pdtei_num", 0);
			model.addAttribute("ord_amount", 0);
			model.addAttribute("ord_price", 0);
		}		
		
		// 주문입력폼 구성작업
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displyFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
	// order.jsp 에서 type파라미터 정보를 받아와야, 즉시구매, 장바구니를 통한 구매 분기작업을 할 수가 있다.
	// OrderDetailVO vo2  : 장바구니 경유해서 주문하기는 사용이 안된다.
	@PostMapping("/order_buy")
	public String order_buy(OrderVO vo, OrderDetailVO vo2, String type, HttpSession session) throws Exception{
		
		log.info("order_buy" + vo);
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		vo.setMbei_id(mbei_id);
		
		if(type.equals("1")) {
			
			log.info("order : " + vo);
			log.info("orderDetail : " + vo2);
			
			// 장바구니 테이블은 제외. (즉시구매이므로 장바구니에 상품을 저장안함)
			// 주문, 주문상세, 장바구니 : pdtei_num, ord_amount, ord_price
			orderService.orderDirect_buy(vo, vo2);  // 즉시구매한 상품구성 해줄것.
		}else if(type.equals("2")) {
			
			// 주문, 주문상세(장바구니참조), 장바구니 삭제
			orderService.order_buy(vo, mbei_id);
		}
		return "redirect:/";
	}
}
