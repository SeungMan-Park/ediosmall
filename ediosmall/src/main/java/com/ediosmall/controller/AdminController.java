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
	
	
	// ????????? ?????????(POST) 1. ???????????? ??????
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
		
		// ??????????????????
		session.setAttribute("adLoginStatus", adVO);
		
		AdminVO adRightVO = null;
		
		adRightVO = adminService.loginRight_check(vo);
		
		if(adRightVO == null) {
			
			rttr.addFlashAttribute("msg", "FailRight");
			return "redirect:/admin/";
		}
		
		
		return "redirect:/admin/admin_process";
	}
	
	// ????????? ?????????(POST) 2. ???????????? ???????????? ?????? - cryPassEnc, AdminDTO dto
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
				
				// ?????????????????? ????????? ????????????
				model.addAttribute("adminVO", vo);
				
				// ??????????????????
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
		
		
		// ????????? ???????????? ??????
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
			url = "redirect:/admin/"; // ????????? ????????? ??????
		}else {
			url = "/admin/admin_process";  // ????????? ??????????????????
		}
		
		// ???????????? ??????
		model.addAttribute("adReview_list", adReviewService.getReviewListWithPagingAd(cri));
		int total = adReviewService.getCountByReview(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total));
		
		// ????????? ?????? ??????
		model.addAttribute("list", adboardservice.getListWithSearchPaging(cri));
		int total2 = adboardservice.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total2));
		
		// ?????? ?????? ??????
		model.addAttribute("order_list", orderService.orderInfo_list(cri));
		int total3 = orderService.getTotalCountOrder(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total3));
		
		// ?????? ?????? ??????
		model.addAttribute("pro_amount", adProductservice.pro_amount2(cri));
		int total4 = adProductservice.getTotalCountProduct(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total4));
		
		return url; // redirect??? ???????????? ????????????, ????????????????????? jsp ?????????
	}
	
	// ajax?????? ????????? ???????????? ??????????????? ????????? ???????????????????????? ????????? ???????????? ??????.
	// ???????????? ??????????????? ?????????. odr_code??? ????????? ??????????????? ???????????? ??????.
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
	
	// ??????????????? ???
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
	
	// ???????????? ???
	@GetMapping("/join")
	public void join() {
		
		log.info("????????????");
	}
	
	
	// ????????????
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
	
	/* ????????? ????????????(ajax??????)   /member/checkIdDuplicate  */
	// ????????? ????????????
	@ResponseBody
	@RequestMapping(value = "checkIdDuplicate", method=RequestMethod.POST)
	public ResponseEntity<String> checkIdDuplicate (@RequestParam("admin_id") String admin_id) throws Exception{
		
		log.info("=====checkIdDuplicate execute()...");
		ResponseEntity<String> entity = null;
		try {
			int count = adminService.checkIdDuplicate(admin_id);
			// count ??? 0?????? ????????? ????????????, 1d ?????? ?????? ?????????.

			if(count != 0) {
				// ???????????? ???????????? ????????? ?????????.
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				// ??????????????? ?????????
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			//  ???????????? BAD_REQUEST ??? ????????? ?????? ????????? ?????? ?????????.
			//	entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST); // ????????? ????????? ??????.
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST); // ????????? ????????? ??????.
		}
		
		return entity;
		
		
	}
	
	@GetMapping("/member/admodify")
	public void reg_edit(HttpSession session, Model model) throws Exception	{
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		
		log.info("????????? ?????? ??????");
		
		model.addAttribute("vo", adminService.member_info(admin_id));		
		
	}
	
	
	@PostMapping("/member/admodify")
	public String modifyPOST(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception{
		
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		vo.setAdmin_id(admin_id);
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		
		adminService.modifyPOST(vo);
		log.info("???????????? ???????  " + vo);
		
				
		return "redirect:/admin/member/admodify";
	}
	
	// ????????? - ????????? ????????????_?????????
	@GetMapping("/member/admin_list")
	public String admin_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("user_list ... " + cri);
		
	
		// 1) ?????? ?????????
		model.addAttribute("admin_list", adminService.admin_list(cri));
		
		int totalCount = adminService.getTotalCountAdmin_list(cri);
		
		// 2) ????????? ??????.  [??????] 1 2 3 4 5 6 ... [??????]
		model.addAttribute("pageMaker", new PageDTD(cri, totalCount));
		
		return "/admin/member/admin_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "adminRightChange", method=RequestMethod.POST)
	public String adminRightChange(AdminVO vo) throws Exception{
		
		adminService.adminRightChange(vo);
		
		
		return "/admin/member/admin_list";
	}
	
	
	
	// ????????? - ????????? ????????????_?????????
	@GetMapping("/member/user_list")
	public String user_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("user_list ... " + cri);
		
		// 1) ?????? ?????????		
		model.addAttribute("user_list", adminService.user_list(cri));
		
		int totalCount = adminService.getTotalCountUser_list(cri);

		// 2) ????????? ??????.  [??????] 1 2 3 4 5 6 ... [??????]
		model.addAttribute("pageMaker", new PageDTD(cri, totalCount));
		
		return "/admin/member/user_list";
	}
	
	// ????????? ????????????_?????????
	@GetMapping("/member/user_modify")
	public String user_modify(@RequestParam("mbei_id") String mbei_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		log.info("modify" + mbei_id);
		
		MbeiosVO vo = adminService.user_modify(mbei_id);
		
		model.addAttribute("vo", vo);
		
		return "/admin/member/user_modify";
		
	}
	
	// ????????? ????????????_?????????
	@PostMapping("/member/user_modify")
	public String user_modifyPost2(LoginDTO dto, MbeiosVO vo, RedirectAttributes rttr) throws Exception {
		
		adminService.user_modifyPost2(vo);
		
		return "redirect:/admin/member/user_list";
	}
	
	// ?????????_????????? ???????????? ??????
	@GetMapping("/member/user_modify_pw")
	public String user_modify_pw(@RequestParam("mbei_id") String mbei_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("modify : " + mbei_id);
		
		log.info("???????????? ??????");
		
		MbeiosVO vo = adminService.user_modify(mbei_id);
		
		model.addAttribute("vo", vo);
		
		return "/admin/member/user_modify_pw";
		
	}
	
	// ?????????_????????? ???????????? ??????(??????)
	@PostMapping("/member/user_modify_pw")
	public String user_modify_pw(MbeiosVO vo) throws Exception{
		
		vo.setMbei_password(cryPassEnc.encode(vo.getMbei_password()));
		
		adminService.user_modify_pw(vo);
		log.info("=====mbei_password : " + vo);
		log.info("=====mbei_password(vo) : " + vo.toString());
		
		return "redirect:/admin/member/user_list";
	}
	
	// ?????????_????????? ?????? ?????? ?????? ????????????
	@GetMapping("/member/regDelete")
	public String regDelete(@RequestParam("mbei_id") String mbei_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		log.info("modify" + mbei_id);
		
		MbeiosVO vo = adminService.user_modify(mbei_id);
		
		model.addAttribute("vo", vo);
		
		return "/admin/member/regDelete";		
		
	}
	
	// ?????????_????????? ?????? ?????? ?????? ????????????
	@GetMapping("/member/user_delete")
	public String user_delete(MbeiosVO vo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		
		log.info("???????????? ??????");
		
		String mbei_id = vo.getMbei_id();
		adminService.user_delete(mbei_id);
		
		
		return "redirect:/admin/member/user_list";
		
	}	
	
	// ????????? ???????????? ??????
	@GetMapping("/member/modify_pw")
	public void modify_pw() {
		log.info("????????? ???????????? ??????");
	}
	
	@PostMapping("/member/modify_pw")
	public String modify_pw(AdminVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		vo.setAdmin_id(admin_id);
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		
		log.info("=====modify_pw... ?????????");
		log.info("=====cryPassEnc.encode(vo.getAdmin_pw()) : " + cryPassEnc.encode(vo.getAdmin_pw()));
		log.info("=====vo.getAdmin_pw() : " + vo.getAdmin_pw());
		log.info("=====vo.toString() : " + vo.toString());
		
		adminService.modify_pw(vo);
		
		log.info("=====modify_pw... ?????????");
		log.info("=====cryPassEnc.encode(vo.getAdmin_pw()) : " + cryPassEnc.encode(vo.getAdmin_pw()));
		log.info("=====vo.getAdmin_pw() : " + vo.getAdmin_pw());
		log.info("=====vo.toString() : " + vo.toString());
		
		
		return "redirect:/admin/member/modify_pw";
	}
	
	// ???????????? ??????
	@ResponseBody
	@RequestMapping(value = "adcheckPwPOST")
	public ResponseEntity<String> adcheckPwPOST(@RequestParam("admin_pw") String admin_pw, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		AdminVO vo = (AdminVO) session.getAttribute("adLoginStatus");
		
		log.info("=====adcheckPwPOST execute()... ?????????");
		log.info("=====admin_pw : " + admin_pw);
		log.info("=====admin_pw : " + vo.toString());
		
		if(cryPassEnc.matches(admin_pw, vo.getAdmin_pw())) {
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			log.info("=====adcheckPwPOST execute()... ????????? : ??????");
			log.info("=====admin_pw : " + admin_pw);
			log.info("=====admin_pw : " + vo.toString());
			
		}else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			log.info("=====adcheckPwPOST execute()... ????????? : ??????");
			log.info("=====admin_pw : " + admin_pw);
			log.info("=====admin_pw : " + vo.toString());
		}
		
		return entity;
	}
	
	// ?????????_????????? ???????????? ??????(??????)
	@GetMapping("/member/modify_pw_imsi")
	public void modify_pw_imsi() throws Exception {
		
		log.info("modify_pw_imsi");
		
	}
	
	// ?????????_????????? ???????????? ??????-??????(??????)
	@PostMapping("/member/modify_pw_imsi")
	public String modify_pw_imsi(AdminVO vo) throws Exception {
		
		vo.setAdmin_pw(cryPassEnc.encode(vo.getAdmin_pw()));
		adminService.modify_pw(vo);
		log.info("=====admin_pw : " + vo);
		log.info("=====admin_pw(vo) : " + vo.toString());
		
		return "redirect:/admin/member/modify_pw_imsi";
	}
	
	// ?????????_????????? ????????????
	@GetMapping("/member/adRegDelete")
	public void adRegDelete(HttpSession session, Model model) throws Exception {
		
		log.info("????????? ???????????? ??????");
		
		String admin_id = ((AdminVO) session.getAttribute("adLoginStatus")).getAdmin_id();
		
		log.info("????????? ?????? ??????");
		
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
