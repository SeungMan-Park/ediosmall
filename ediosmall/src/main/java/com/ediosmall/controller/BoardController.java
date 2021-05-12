package com.ediosmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

import com.ediosmall.controller.BoardController;
import com.ediosmall.domain.BoardVO;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.PageDTD;
import com.ediosmall.service.BoardService;
import com.ediosmall.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/board/*")
@AllArgsConstructor // 클래스의 모든필드를 대상으로 파라미터를 구성하는 생성자메서드 생성.  bean name : boardController
public class BoardController {
	
	private BoardService service;
	
	private MemberService Mbservice;
	
	
	// 리스트. 주소? /mypage/board/list
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		
		// 참조형 파라미터는 내부적으로 스프링에 의하여, 자동으로 기본생성자에 의하여 객체생성이된다.Criteria cri
		log.info("called list..." + cri);
		
		// 1) 게시물 데이터
		model.addAttribute("list", service.getListWithSearchPaging(cri));
		
		int total = service.getTotalCount(cri);
		
		log.info("total : " + total);
		//2)페이징정보. [이전]1 2 3 4 5 6...[다음]
		model.addAttribute("pageMaker", new PageDTD(cri, total));
		
	}
	
	// 글쓰기 폼
	@GetMapping("/register")
	public void register(HttpSession session, Model model) {
		log.info("called register......");
	}
	
	//글저장 -> 리스트
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr, Model model, HttpSession session) {
		
		
		log.info("called register... " + board);
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		board.setMbei_id(mbei_id);
				
		service.insert(board);
		
		
		
		return "redirect:/mypage/board/list";
	}
	
	// 글조회
	@GetMapping("/read")
	public void read(@RequestParam("brd_num") Long brd_num, @ModelAttribute("cri") Criteria cri, Model model, HttpSession session, BoardVO board) {
		log.info("cri : " + cri);
		log.info("called read : " + brd_num);
		
		String mbei_id = ((MbeiosVO) session.getAttribute("loginStatus")).getMbei_id();
		board.setMbei_id(mbei_id);
		
		model.addAttribute("board", service.read(brd_num));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("brd_num") Long brd_num, @ModelAttribute("cri") Criteria cri, Model model, BoardVO board) {
		log.info("called modify ... ");
		
		model.addAttribute("board", service.read(brd_num));
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		
		log.info("called modify .... " + board);
		service.modify(board);
		
		// 1)rttr.addFlashAttribute("msg", 값) : 
		// 설명> /board/list 주소에서 사용하는 View(JSP)에 데이터 전달. 
		// 내부적으로 세션으로 저장했다가 뷰에서 사용하고 즉시 소멸되는 정보.(일회성).
		
		rttr.addFlashAttribute("result", "modify"); // list.jsp에서 참조
		
		// 2)rttr.addAttribute("msg", 값)
		// 설명> /board/list 주소에 파라미터형태로 전달.
		
		// /board/list 주소의 메서드에서 참조.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		
		return "redirect:/mypage/board/list";
		
	}
	
	// 게시물 삭제 -> 리스트
	@PostMapping("/remove")
	public String remove(@RequestParam("brd_num") Long brd_num, Criteria cri, RedirectAttributes rttr) {
		
		log.info("called remove .... " + brd_num);
		
		service.remove(brd_num);
		
		// 1)rttr.addFlashAttribute("msg", 값) : 
		// 설명> /board/list 주소에서 사용하는 View(JSP)에 데이터 전달. 
		// 내부적으로 세션으로 저장했다가 뷰에서 사용하고 즉시 소멸되는 정보.(일회성).
		
		rttr.addFlashAttribute("result", "remove"); // list.jsp에서 참조
		
		// 2)rttr.addAttribute("msg", 값)
		// 설명> /board/list 주소에 파라미터형태로 전달.
		
		// /board/list 주소의 메서드에서 참조.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());		
		
		
		
		return "redirect:/mypage/board/list";
	}
	
	
	
	
	

}
