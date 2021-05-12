package com.ediosmall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.OrderUiPageDTO;
import com.ediosmall.dto.PageDTD;
import com.ediosmall.service.MemberService;
import com.ediosmall.service.OrderService;
import com.ediosmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;	
	
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Resource(name ="uploadPath")
	private String uploadPath;

	@Inject	
	private BCryptPasswordEncoder cryPassEnc;
	
	@GetMapping("/mypage")
	public void mypage() {
		log.info("mypage .......");
	}
	
	// 회원수정 폼 : db에서 회원정보를 가져와서 출력
	@GetMapping("/modify")
	public void reg_edit(HttpSession session, Model model) throws Exception {
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		
		/*
		MbeiosVO vo = service.member_info(mbei_id);
		model.addAttribute("vo", vo);
		*/
		
		log.info("회원수정 확인");
		
		// model.addAttribute(service.member_info(mbei_id));  // jsp에 전달되는 데이터의 키? mbeiosVO
		model.addAttribute("vo" , service.member_info(mbei_id));
	}
	
	// 회원수정 저장
	@PostMapping("/modify")
	public String modifyPOST(MbeiosVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		
		String result = "";
		
//		if(service.modifyPOST(vo) == true) {
//			result = "modifySuccess";
//		}else {
//			result = "modifyFail";
//		}
		
		// 로그인시 세션에서 아이디를 참고 
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		vo.setMbei_id(mbei_id);
		vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
		
		// MbeiosVO vo의 회원수정폼에서 아이디 파라미터가 존재한 경우
		
		service.modifyPOST(vo);
		result = "modifySuccess";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
	}
	
	@GetMapping("/regDelete")
	public void regDelete(HttpSession session, Model model) throws Exception {
	
		log.info("회원탈퇴");

		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		
		/*
		MbeiosVO vo = service.member_info(mbei_id);
		model.addAttribute("vo", vo);
		*/
		
		
		// model.addAttribute(service.member_info(mbei_id));  // jsp에 전달되는 데이터의 키? mbeiosVO
		model.addAttribute("vo" , service.member_info(mbei_id));		
		
	}

	
	// @GetMapping("/order_list")
//	@RequestMapping(value = "/order_list", method = {RequestMethod.GET, RequestMethod.POST})
//	public void cart_list(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri) throws Exception{
//		
//		log.info("order_list : " + cri);
//		
//		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
//		
//		model.addAttribute("order_list", orderService.orderInfo_list(cri));
//		
//		model.addAttribute("order_list", orderService.orderInfo_list_Ui(mbei_id));
//		
//		int total = orderService.getTotalCountOrder(cri);
//		
//		model.addAttribute("pageMaker", new PageDTD(cri, total));
//		
//	}
	
	@GetMapping("/order_list")
	public void cart_list(HttpSession session, Model model, @ModelAttribute("cri") Criteria cri) throws Exception{
		
		log.info("order_list");
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		model.addAttribute("order_list", orderService.orderInfo_list_Ui(cri, mbei_id));
		
		int totalCount = orderService.getTotalCountOrder_Ui(mbei_id);
		
		
		// 2) 페이징 정보.  [이전] 1 2 3 4 5 6 ... [다음]
		model.addAttribute("pageMaker", new PageDTD(cri, totalCount));
		
	}
	
//	@GetMapping(value = "/order_list")
//	public ResponseEntity<OrderUiPageDTO> order_list_getOrderListPage(long odr_code, int page){
//		
//		ResponseEntity<OrderUiPageDTO> entity = null;
//		
//		Criteria cri = new Criteria(page, 5);
//		
//		log.info("주문번호" + odr_code);
//		log.info("cri : " + cri);
//		
//		try {
//			entity = new ResponseEntity<OrderUiPageDTO>(orderService.getOrderInfo_list_UiWithPaging(cri, odr_code), HttpStatus.OK);
//		}catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<OrderUiPageDTO>(HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	
	
	// ajax에서 넘어온 주문번호 파라미터를 가지고 주문상세테이블에 쿼리를 구성해야 한다.
	// 조건식에 주문번호를 넣는다. odr_code를 받아서 상세정보를 알아내야 한다.
	@GetMapping("/orderDetailSeen")
	@ResponseBody
	public ResponseEntity<List<OrderDetailSeenVO>> OrderDetailSeen(long odr_code) throws Exception {
		
		log.info("OrderDetailSeen : "+ odr_code);
		
		ResponseEntity<List<OrderDetailSeenVO>> entity = null;
		
		
		try {
			entity = new ResponseEntity<List<OrderDetailSeenVO>>(orderService.OrderDetailSeen(odr_code), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<OrderDetailSeenVO>>(HttpStatus.BAD_REQUEST);
		}
				
		return entity;
	}
	
	// 상품이미지 뷰
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
	@GetMapping("/modify_pw")
	public void modify_pw() {
		
		log.info("비밀번호 변경");
	}
	
	@PostMapping("/modify_pw")
	public String modify_pw(MbeiosVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		
		String result = "";
		
//		if(service.modifyPOST(vo) == true) {
//			result = "modifySuccess";
//		}else {
//			result = "modifyFail";
//		}
		
		// 로그인시 세션에서 아이디를 참고 
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		vo.setMbei_id(mbei_id);
		vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
		
		// MbeiosVO vo의 회원수정폼에서 아이디 파라미터가 존재한 경우
		
		service.modify_pw(vo);
		result = "modify_pw_Success";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
	}

}
