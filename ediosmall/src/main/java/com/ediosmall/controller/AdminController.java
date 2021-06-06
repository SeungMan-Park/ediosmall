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
import com.ediosmall.dto.AdminDTO;
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
	
	
	// 관리자 로그인(POST) 1. 일반적인 방식
	@PostMapping("/admin_check")
	public String admin_ok(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		AdminVO adVO = null;
		
		log.info("admin_check : " + vo);
		
		adVO = adminService.login_check(vo);
		
		if(adVO == null) {
			
			log.info("admin_check2 : " + vo);
			
			rttr.addFlashAttribute("msg", "Fail");
			return "redirect:/admin/";
		}
		
		// 세션인증작업
		session.setAttribute("adLoginStatus", adVO);
		
		AdminVO adRightVO = null;
		
		adRightVO = adminService.loginRight_check(vo);
		
		if(adRightVO == null) {
			
			rttr.addFlashAttribute("msg", "FailRight");
			return "redirect:/admin/";
		}
		
		
		return "redirect:/admin/admin_process";
	}
	
	// 관리자 로그인(POST) 2. 암호화된 패스워드 활용 - cryPassEnc, AdminDTO dto
	@PostMapping(value = "/adLoginPost")
	public String adLoginPost(AdminDTO dto, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
		
		log.info("adLoginPost : " + dto);
		
		AdminVO vo = adminService.adLogin_dto_ok(dto);
		
		log.info("dto.getAdmin_pw() : " + dto.getAdmin_pw());
		
		if(vo == null) {
			rttr.addFlashAttribute("msg", "Fail");
			
			log.info("adLoginPost vo == null: " + dto);
			log.info("dto.getAdmin_pw() vo == null : " + dto.getAdmin_pw());
			
			return "redirect:/admin/";
		}
		
		log.info("vo.getAdmin_pw() : "+vo.getAdmin_pw());
		
		if(vo != null) {
			if(cryPassEnc.matches(dto.getAdmin_pw(), vo.getAdmin_pw())) {
				
				// 인터셉터에서 참조할 모델작업
				model.addAttribute("adminVO", vo);
				
				// 세션인증작업
				session.setAttribute("adLoginStatus", vo);
				
				log.info("adLoginPost vo != null: matchesOK  : " + dto);
				log.info("dto.getAdmin_pw() vo != null : matchesOK : " + dto.getAdmin_pw());
				
			}else {
				rttr.addFlashAttribute("msg", "Fail");
				log.info("adLoginPost vo != null: matchesNot : " + dto);
				log.info("dto.getAdmin_pw() vo != null : matchesNot : " + dto.getAdmin_pw());
				return "redirect:/admin/";
			}
		}
		
		
		// 관리자 사용권한 부여
		AdminVO adRightVO = null;
		
		adRightVO = adminService.loginRight_check(vo);
		
		if(adRightVO == null) {
			
			rttr.addFlashAttribute("msg", "FailRight");
			return "redirect:/admin/";
		}
		
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
		
		log.info(vo);
		
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		
		String result = "";
		
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
	
	@GetMapping("/member/admodify")
	public void reg_edit(HttpSession session, Model model) throws Exception	{
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		
		log.info("관리자 정보 수정");
		
		model.addAttribute("vo", adminService.member_info(admin_id));		
		
	}
	
	
	@PostMapping("/member/admodify")
	public String modifyPOST(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		vo.setAdmin_id(admin_id);
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		
		adminService.modifyPOST(vo);
		log.info("정보변경 확인?  " + vo);
		
				
		return "redirect:/admin/member/admodify";
	}
	
	// 관리자 - 관리자 회원관리_리스트
	@GetMapping("/member/admin_list")
	public String admin_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("user_list ... " + cri);
		
	
		// 1) 회원 데이터
		model.addAttribute("admin_list", adminService.admin_list(cri));
		
		int totalCount = adminService.getTotalCountAdmin_list(cri);
		
		// 2) 페이징 정보.  [이전] 1 2 3 4 5 6 ... [다음]
		model.addAttribute("pageMaker", new PageDTD(cri, totalCount));
		
		return "/admin/member/admin_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "adminRightChange", method=RequestMethod.POST)
	public String adminRightChange(AdminVO vo) throws Exception{
		
		adminService.adminRightChange(vo);
		
		
		return "/admin/member/admin_list";
	}
	
	
	
	// 관리자 - 사용자 회원관리_리스트
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
	
	// 관리자 비밀번호 변경
	@GetMapping("/member/modify_pw")
	public void modify_pw() {
		log.info("관리자 비밀번호 변경");
	}
	
	@PostMapping("/member/modify_pw")
	public String modify_pw(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		vo.setAdmin_id(admin_id);
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		
		log.info("=====modify_pw... 변경전");
		log.info("=====cryPassEnc.encode(vo.getAdmin_pw()) : " + cryPassEnc.encode(vo.getAdmin_pw()));
		log.info("=====vo.getAdmin_pw() : " + vo.getAdmin_pw());
		log.info("=====vo.toString() : " + vo.toString());
		
		adminService.modify_pw(vo);
		
		log.info("=====modify_pw... 변경후");
		log.info("=====cryPassEnc.encode(vo.getAdmin_pw()) : " + cryPassEnc.encode(vo.getAdmin_pw()));
		log.info("=====vo.getAdmin_pw() : " + vo.getAdmin_pw());
		log.info("=====vo.toString() : " + vo.toString());
		
		
		return "redirect:/admin/member/modify_pw";
	}
	
	// 비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "adcheckPwPOST")
	public ResponseEntity<String> adcheckPwPOST(@RequestParam("admin_pw") String admin_pw, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		AdminVO vo = (AdminVO) session.getAttribute("adLoginStatus");
		
		log.info("=====adcheckPwPOST execute()... 인증전");
		log.info("=====admin_pw : " + admin_pw);
		log.info("=====admin_pw : " + vo.toString());
		
		if(cryPassEnc.matches(admin_pw, vo.getAdmin_pw())) {
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			log.info("=====adcheckPwPOST execute()... 인증후 : 성공");
			log.info("=====admin_pw : " + admin_pw);
			log.info("=====admin_pw : " + vo.toString());
			
		}else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			log.info("=====adcheckPwPOST execute()... 인증후 : 실패");
			log.info("=====admin_pw : " + admin_pw);
			log.info("=====admin_pw : " + vo.toString());
		}
		
		return entity;
	}
	
	// 관리자_관리자 비밀번호 변경(임시)
	@GetMapping("/member/modify_pw_imsi")
	public void modify_pw_imsi() throws Exception {
		
		log.info("modify_pw_imsi");
		
	}
	
	// 관리자_관리자 비밀번호 변경-저장(임시)
	@PostMapping("/member/modify_pw_imsi")
	public String modify_pw_imsi(AdminVO vo) throws Exception {
		
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		adminService.modify_pw(vo);
		log.info("=====admin_pw : " + vo);
		log.info("=====admin_pw(vo) : " + vo.toString());
		
		return "redirect:/admin/member/modify_pw_imsi";
	}
	
	// 관리자_관리자 탈퇴기능
	@GetMapping("/member/adRegDelete")
	public void adRegDelete(HttpSession session, Model model) throws Exception {
		
		log.info("관리자 회원기능 탈퇴");
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		
		log.info("관리자 정보 수정");
		
		model.addAttribute("vo", adminService.member_info(admin_id));
		
	}
	
	@PostMapping("/member/adRegDelete")
	public String adRegDelete(HttpSession session, RedirectAttributes rttr) throws Exception {
		
		log.info("adDeletePOST()1...");
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		
		adminService.adDeleteAdmin(admin_id);
		
		log.info("adDeletePOST()2...");
		
		session.invalidate();
		
		log.info("adDeletePOST()3...");
		
		
		return "redirect:/admin/";
	}
	

}
