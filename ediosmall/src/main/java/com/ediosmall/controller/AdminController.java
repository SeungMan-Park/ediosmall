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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ediosmall.domain.AdminVO;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.LoginDTO;
import com.ediosmall.dto.PageDTD;
import com.ediosmall.service.AdProductService;
import com.ediosmall.service.AdReviewService;
import com.ediosmall.service.AdminService;
import com.ediosmall.service.BoardService;
import com.ediosmall.service.OrderService;
import com.ediosmall.util.FileUtils;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	
	@Inject	
	private BCryptPasswordEncoder cryPassEnc;
	
	@Setter(onMethod_ = @Autowired)
	private AdminService adminService;
	
	private AdReviewService adReviewService;
	
	private BoardService adboardservice;

	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	private AdProductService adProductservice;
	
	@Resource(name ="uploadPath")
	private String uploadPath;	
	
	@GetMapping("")
	public String admin_main() {
		
		log.info("Admin_main ===================");
		
		return "/admin/admin_login";
		
	}
	
	
	// 관리자 로그인(POST)
	@PostMapping("/admin_check")
	public String admin_ok(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		log.info("admin_check : " + vo);
		
		AdminVO adVO = null;
		
		adVO = adminService.login_check(vo);
		
		if(adVO == null) {
			
			log.info("admin_check2 : " + vo);
			
			rttr.addFlashAttribute("msg", "Fail");
			return "redirect:/admin/";
		}
		
		// 세션인증작업
		session.setAttribute("adLoginStatus", adVO);
		
		return "redirect:/admin/admin_process";
	}
	
	
//	@GetMapping("/admin_process")
	@RequestMapping(value = "/admin_process", method = {RequestMethod.GET, RequestMethod.POST})	
	public String admin_process(HttpSession session, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("admin_process");
		
		String url = "";
		
		if(session.getAttribute("adLoginStatus") == null) {
			url = "redirect:/admin/"; // 관리자 로그인 주소
		}else {
			url = "/admin/admin_process";  // 관리자 메인진입주소
		}
		
		// 리뷰관련 정보
		model.addAttribute("adReview_list", adReviewService.getReviewListWithPagingAd(cri));
		int total = adReviewService.getCountByReview(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total));
		
		// 게시판 관련 정보
		model.addAttribute("list", adboardservice.getListWithSearchPaging(cri));
		int total2 = adboardservice.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total2));
		
		// 주문 관련 정보
		model.addAttribute("order_list", orderService.orderInfo_list(cri));
		int total3 = orderService.getTotalCountOrder(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total3));
		
		// 제고 관련 정보
		model.addAttribute("pro_amount", adProductservice.pro_amount2(cri));
		int total4 = adProductservice.getTotalCountProduct(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total4));
		
		return url; // redirect가 사용하면 주소의미, 사용하지않으면 jsp 파일명
	}
	
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
	
	
	@PostMapping("/admin_logout")
	public String admin_logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		
		rttr.addFlashAttribute("msg", "logout");
		return "redirect:/admin/";
	}
	
	// 회원가입 폼
	@GetMapping("/join")
	public void join() {
		
		log.info("회원가입");
	}
	
	
	// 회원가입
	@PostMapping("/join")
	public String join(AdminVO vo, RedirectAttributes rttr) throws Exception{
		
		String result = "";
		
		log.info(vo);
		
		adminService.join(vo);
		
		result = "insertSuccess";
		
		rttr.addFlashAttribute("status", result);
	
		return "redirect:/admin/";
	}	
	
	/* 아이디 중복체크(ajax요청)   /member/checkIdDuplicate  */
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "checkIdDuplicate", method=RequestMethod.POST)
	public ResponseEntity<String> checkIdDuplicate (@RequestParam("admin_id") String admin_id) throws Exception{
		
		log.info("=====checkIdDuplicate execute()...");
		ResponseEntity<String> entity = null;
		try {
			int count = adminService.checkIdDuplicate(admin_id);
			// count 가 0이면 아이디 사용가능, 1d 이면 사용 불가능.

			if(count != 0) {
				// 아이디가 존재해서 사용이 불가능.
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				// 사용가능한 아이디
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			//  여기에서 BAD_REQUEST 로 잡으면 되지 않나??? 확인 바란다.
			//	entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST); // 요청이 문제가 있다.
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST); // 요청이 문제가 있다.
		}
		
		return entity;
		
		
	}
	
	@GetMapping("/modify")
	public void reg_edit(HttpSession session, Model model) throws Exception	{
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		
		log.info("관리자 정보 수정");
		
		model.addAttribute("vo", adminService.member_info(admin_id));		
		
	}
	
	@PostMapping("/modify")
	public String modifyPOST(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		String result = "";
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		vo.setAdmin_id(admin_id);
		
		adminService.modifyPOST(vo);
		result = "modifySuccess";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/admin/modify";
	}
	
	// 관리자 회원관리_리스트
	@GetMapping("/member/user_list")
	public String user_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("user_list ... " + cri);
		
		// 1) 회원 데이터		
		model.addAttribute("user_list", adminService.user_list(cri));
		
		int totalCount = adminService.getTotalCountUser_list(cri);

		// 2) 페이징 정보.  [이전] 1 2 3 4 5 6 ... [다음]
		model.addAttribute("pageMaker", new PageDTD(cri, totalCount));
		
		return "/admin/member/user_list";
	}
	
	// 관리자 회원관리_수정폼
	@GetMapping("/member/user_modify")
	public String user_modify(@RequestParam("mbei_id") String mbei_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		log.info("modify" + mbei_id);
		
		MbeiosVO vo = adminService.user_modify(mbei_id);
		
		model.addAttribute("vo", vo);
		
		return "/admin/member/user_modify";
		
	}
	
	// 관리자 회원관리_수정폼
	@PostMapping("/member/user_modify")
	public String user_modifyPost2(LoginDTO dto, MbeiosVO vo, RedirectAttributes rttr) throws Exception {
		
		adminService.user_modifyPost2(vo);
		
		return "redirect:/admin/member/user_list";
	}
	
	// 관리자_사용자 비밀번호 변경
	@GetMapping("/member/user_modify_pw")
	public String user_modify_pw(@RequestParam("mbei_id") String mbei_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("modify : " + mbei_id);
		
		log.info("비밀번호 변경");
		
		MbeiosVO vo = adminService.user_modify(mbei_id);
		
		model.addAttribute("vo", vo);
		
		return "/admin/member/user_modify_pw";
		
	}
	
	// 관리자_사용자 비밀번호 변경(저장)
	@PostMapping("/member/user_modify_pw")
	public String user_modify_pw(MbeiosVO vo) throws Exception{
		
		vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
		
		adminService.user_modify_pw(vo);
		log.info("=====mbei_password : " + vo);
		log.info("=====mbei_password(vo) : " + vo.toString());
		
		return "redirect:/admin/member/user_list";
	}
	
	// 관리자_사용자 계정 삭제 정보 불러오기
	@GetMapping("/member/regDelete")
	public String regDelete(@RequestParam("mbei_id") String mbei_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		log.info("modify" + mbei_id);
		
		MbeiosVO vo = adminService.user_modify(mbei_id);
		
		model.addAttribute("vo", vo);
		
		return "/admin/member/regDelete";		
		
	}
	
	// 관리자_사용자 계정 삭제 정보 삭제처리
	@GetMapping("/member/user_delete")
	public String user_delete(MbeiosVO vo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		
		log.info("비밀번호 변경");
		
		String mbei_id = vo.getMbei_id();
		adminService.user_delete(mbei_id);
		
		
		return "redirect:/admin/member/user_list";
		
	}	
	
	

}
