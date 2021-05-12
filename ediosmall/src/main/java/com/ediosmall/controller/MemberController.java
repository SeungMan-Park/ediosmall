package com.ediosmall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.dto.EmailDTO;
import com.ediosmall.dto.LoginDTO;
import com.ediosmall.service.EmailService;
import com.ediosmall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@Setter(onMethod_ = @Autowired)
	private EmailService mailService;
	
	@Inject	
	private BCryptPasswordEncoder cryPassEnc;
	
	// 로그인 폼
	@GetMapping("/login")
	public void login() {
		
		log.info("로그인");
	}
	
	// 로그인 인증    방식 1
	@PostMapping(value = "/loginPost")
	public void login_ok(LoginDTO dto, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
		
		log.info("loginPost : " + dto);
		
		MbeiosVO vo = service.login_ok(dto);
		
		log.info("dto.getMbei_password() : " + dto.getMbei_password());
		log.info("vo.getMbei_password() : " + vo.getMbei_password());
		
//		if(vo == null) return;
		
		String result = "loginIDFail";  
		
		if(vo != null) {
			
			
			if(cryPassEnc.matches(dto.getMbei_password(), vo.getMbei_password())) {
				
				
				// 인터셉터에서 참조할 모델작업
				model.addAttribute("mbeiosVO", vo);

				// vo.setMbei_password(""); // 보안적으로 신경쓰이면... 이렇게 처리하면 된다.
				session.setAttribute("loginStatus", vo);  // 세션정보로 인증상태를 저장
				
				result = "loginSuccess";					
			}else {
				result = "loginPWFail";
				return;
			}
		}
			
		rttr.addFlashAttribute("status", result);
		
			
	}
	

	
	
	
	@GetMapping("/")
	public String member_process(HttpSession session) {
		
		log.info("member_process");
		
		String url = "";
		
		if(session.getAttribute("loginStatus") == null) {
			url = "redirect:/member/login/"; // 로그인 주소
		}else {
			url = "/";  // 메인진입주소
		}
		
		return url;
	}
	
	
	
	// 로그아웃 기능 : main페이지로 이동("/")
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		log.info("/logout");
		
		session.invalidate();
		
		String result = "logout";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
	}
	
	

	// 회원가입 폼
	@GetMapping("/join")
	public void join() {
		
		log.info("회원가입");
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(MbeiosVO vo, RedirectAttributes rttr) throws Exception{
		
		log.info(vo);
		
		vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
		
		String result = "";
		service.join(vo);
		
		result = "insertSuccess";
		
		rttr.addFlashAttribute("status", result);
	
		return "redirect:/";
	}
	
	/* 아이디 중복체크(ajax요청)   /member/checkIdDuplicate  */
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "checkIdDuplicate", method=RequestMethod.POST)
	public ResponseEntity<String> checkIdDuplicate(@RequestParam("mbei_id") String mbei_id) throws Exception {
		
		log.info("=====checkIdDuplicate execute()...");
		ResponseEntity<String> entity = null;
		try {
			int count = service.checkIdDuplicate(mbei_id);
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
	
	// 비밀번호 확인 Ajax 용도!
//	@ResponseBody
//	@RequestMapping(value = "checkPwDuplicate", method=RequestMethod.POST)
//	public ResponseEntity<String> checkPwDuplicate(LoginDTO dto, @RequestParam("mbei_password") String mbei_password, Model model, HttpSession session) throws Exception {
//		
//		log.info("=====checkPwDuplicate execute()...");
//		
//		
//		
//		//vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
//		
//	//	dto.setMbei_password(mbei_password);
//		
//	//	MbeiosVO login_check = service.login_check(vo);
//		
//		
//		ResponseEntity<String> entity = null;
//		
//		// 로그인시 세션에서 아이디를 참고 
////		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
////		vo.setMbei_id(mbei_id);
////		//vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
////		
////		log.info(dto.getMbei_password());
////		log.info(vo.getMbei_password());
////		log.info(mbei_password);
//		
//		log.info("checkPwDuplicate(dto) : " + dto);
//		MbeiosVO vo = service.login_ok(dto);
//		
//		
//
//	//	if(cryPassEnc.matches(vo.getMbei_password(), vo.getMbei_password())) {
//		if(cryPassEnc.matches(dto.getMbei_password(), vo.getMbei_password())) {	
//	//	if(cryPassEnc.matches(mbei_password, dto.getMbei_password())) {	
//			
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//			
//			log.info(dto.getMbei_password());
//			log.info(vo.getMbei_password());
//			log.info(mbei_password);
//			
//		}else {
//			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
//			
//			log.info(dto.getMbei_password());
//			log.info(vo.getMbei_password());
//			log.info(mbei_password);
//			
//		}
//		
//		return entity;
//		
//	}
	
	// 비밀번호 확인 Ajax 용도!(ver2.0)
//	@ResponseBody
//	@RequestMapping(value = "checkPwDuplicate", method=RequestMethod.POST)
//	public boolean checkPwDuplicate(@RequestParam("mbei_password") String mbei_password, MbeiosVO vo, LoginDTO dto, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {
//		
//		//MbeiosVO vo = service.login_ok(dto);
//
//		// 로그인시 세션에서 아이디를 참고 
//		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
//		vo.setMbei_id(mbei_id);
//		vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));		
//		
//		boolean checkPwDuplicate = cryPassEnc.matches(dto.getMbei_password(), vo.getMbei_password());
//		log.info("loginPost : " + dto);
//		log.info("dto.getMbei_password() : " + dto.getMbei_password());
//		log.info("vo.getMbei_password() : " + vo.getMbei_password());
//		log.info("mbei_password : " + mbei_password);
//		
//		return checkPwDuplicate;
//		
//	}
	
	
	// 비밀번호 확인 ver03
	@ResponseBody
	@RequestMapping(value = "checkPwPOST")
	public ResponseEntity<String> checkPwPOST(@RequestParam("mbei_password") String mbei_password, HttpSession session, Model model){
		
		ResponseEntity<String> entity = null;
		
		MbeiosVO vo = (MbeiosVO) session.getAttribute("loginStatus");
		
		log.info("=====checkPwPOST execute()... 인증전");
		log.info("=====mbei_password : " + mbei_password);
		log.info("=====mbei_password(vo) : " + vo.toString());
		
		if(cryPassEnc.matches(mbei_password, vo.getMbei_password())) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			log.info("=====checkPwPOST execute()... 인증후 : 성공");
			log.info("=====mbei_password : " + mbei_password);
			log.info("=====mbei_password(vo) : " + vo.toString());
			
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			log.info("=====checkPwPOST execute()... 인증후 : 실패");
			log.info("=====mbei_password : " + mbei_password);
			log.info("=====mbei_password(vo) : " + vo.toString());
		}
		
		
		return entity;
	}	
	
	/* 
	 * 이메일 인증 코드 확인   // /member/checkAuthcode
	 * - 입력된 인증 코드와 세션에 저장해 두었던 인증 코드가 일치하는지 확인
	 */
	@ResponseBody
	@RequestMapping(value = "checkAuthcode", method=RequestMethod.POST)
	public ResponseEntity<String> checkAuthcode(@RequestParam("code") String code, HttpSession session){
		
		
		
		ResponseEntity<String> entity = null;
		
		try {
			if(code.equals(session.getAttribute("authcode"))) {
				// 인증코드 일치
				entity= new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				// 인증코드 불일치
				entity= new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
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
	public String modifyPOST(LoginDTO dto, MbeiosVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		
		String result = "modifyFail";
		
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
	
	// 회원삭제(탈퇴)기능
	@GetMapping("/delete")
	public String deletePost(HttpSession session, RedirectAttributes rttr) throws Exception {
		
		log.info("deletePOST()...");
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		
		service.deleteUser(mbei_id);
		session.invalidate();
		
		// 회원탈퇴시 세션 소멸작업
		
		String result = "";
		
		result = "deleteSuccess";
		
		rttr.addFlashAttribute("status", result);
		
		return "redirect:/";
	}
	
	
	// 아이디 찾기 폼
	@GetMapping("/find_id")
	public void find_id() {
		log.info("find_id");
	}
	
	
	// 아이디 찾기기능 : 화면에 출력
	@PostMapping("/find_id")
	public ResponseEntity<String> find_id(@RequestParam("mbei_name") String mbei_name) throws Exception{
		
		log.info("이름? " + mbei_name);
				
		ResponseEntity<String> entity = null;
		
		String mbei_id = service.find_id(mbei_name);
		
		if(mbei_id != null) {
			entity = new ResponseEntity<String>(mbei_id, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	// 비밀번호 찾기 폼
	@GetMapping("/find_pwd")
	public void find_pwd() {
		
		log.info("find_pwd");
		
	}
	
	
	// 비밀번호 찾기기능(ajax 적용) : 메일전송
	@ResponseBody
	@PostMapping("/find_pwd")
	public ResponseEntity<String> find_pwd(@RequestParam("mbei_id") String mbei_id, @RequestParam("mbei_name") String mbei_name, EmailDTO dto) throws Exception{
		
		log.info("아이디? " + mbei_id);
		log.info("이름? " + mbei_name);
								
		ResponseEntity<String> entity = null;
		
		MbeiosVO vo = service.find_pwd(mbei_id, mbei_name);
		
		
		if(vo != null) {
			
			// 메일발송작업
			dto.setReceiveMail(vo.getMbei_email());
			dto.setSubject("요청하신 비밀번호입니다.");
			dto.setMessage(mbei_id + " 님의 비밀번호입니다.");
			
			mailService.sendMail(dto, vo.getMbei_password());
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
//	// 비밀번호 찾기 폼
//	@GetMapping("/pw_search")
//	public void pw_search() {
//		
//		log.info("find_pwd");
//		
//	}
//	
//	// /member/pw_search
//	@ResponseBody
	@GetMapping("/pw_search")
	public ResponseEntity<String> pw_search(String id, EmailDTO email_dto) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		LoginDTO dto = new LoginDTO();
		dto.setMbei_id(id);
		dto.setMbei_password("");
		
		MbeiosVO vo = service.login_ok(dto);
		
		String imsi_pw = "";
		
		if(vo != null) {
			
			String email = vo.getMbei_email();
			
			for(int i=0; i<12; i++) {
				imsi_pw += (char)((Math.random() * 26) + 97);
			}
			
			// 비번 암호화
			String enc_pw = cryPassEnc.encode(imsi_pw);
			dto.setMbei_password(enc_pw);
			
			// dto를 파라미터로 하여, 사용자 아이디에 해당하는 비번변경작업
			// 1) update 회원테이블 set 비번컬럼명 = 암호화된 비번 where 조건식(아이디일치)
			service.pw_search(dto);
			
			
			
			// 2) 평문 비번을 메일전송
			email_dto.setReceiveMail(email);
			email_dto.setSubject("요청하신 임시 비밀번호번호입니다. 로그인해서 비밀번호를 변경 바랍니다.");
			email_dto.setMessage(id + " 님의 비밀번호입니다.");
			
			mailService.sendMail(email_dto, imsi_pw);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}else {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
				
		
		return entity;
		
	}	
	
	
	
	

}
