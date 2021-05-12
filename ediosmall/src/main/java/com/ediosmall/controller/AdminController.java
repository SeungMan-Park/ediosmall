package com.ediosmall.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ediosmall.domain.AdminVO;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.service.AdminService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService adminService;

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
	
	
	@GetMapping("/admin_process")
	public String admin_process(HttpSession session) {
		
		log.info("admin_process");
		
		String url = "";
		
		if(session.getAttribute("adLoginStatus") == null) {
			url = "redirect:/admin/"; // 관리자 로그인 주소
		}else {
			url = "/admin/admin_process";  // 관리자 메인진입주소
		}
		
		return url; // redirect가 사용하면 주소의미, 사용하지않으면 jsp 파일명
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
	
	

}
