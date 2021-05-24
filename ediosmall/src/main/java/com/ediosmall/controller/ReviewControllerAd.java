package com.ediosmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ediosmall.domain.ReviewVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.PageDTD;
import com.ediosmall.service.AdReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/adreview/*")
@AllArgsConstructor
public class ReviewControllerAd {
	
	private AdReviewService adReviewService;
	
	// 리스트. 주소? /admin/adreview/adreview_list
	@RequestMapping(value = "/adreview_list", method = {RequestMethod.GET, RequestMethod.POST})	
	public void list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		// 참조형 파라미터는 내부적으로 스프링에 의하여, 자동으로 기본생성자에 의하여 객체생성이된다.Criteria cri
		log.info("called list..." + cri);
		
		model.addAttribute("adReview_list", adReviewService.getReviewListWithPagingAd(cri));
		
		int total = adReviewService.getCountByReview(cri);
		
		log.info("total : " + total);
		//2)페이징정보. [이전]1 2 3 4 5 6...[다음]
		model.addAttribute("pageMaker", new PageDTD(cri, total));	
		
	}
	
	@GetMapping("/review_read")
	public void review_read(@RequestParam("rv_num") Long rv_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		log.info("cri : " + rv_num);
		
		model.addAttribute("adReview_read", adReviewService.review_read(rv_num));
		
	}
	
	@GetMapping("/admodify")
	public void admodify(@RequestParam("rv_num") Long rv_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		log.info("called admodify ... ");
		
		model.addAttribute("adReview_read", adReviewService.review_read(rv_num));
		
	}
	
	@PostMapping("/admodify")
	public String modify(ReviewVO review, Criteria cri, RedirectAttributes rttr) {
		
		log.info("called modify .... " + review);
		adReviewService.modify(review);
		
		rttr.addFlashAttribute("result", "modify"); // adreview_list.jsp에서 참조
		
		// 2)rttr.addAttribute("msg", 값)
		// 설명> /adreview/adreview_list 주소에 파라미터형태로 전달.
		
		// /board/list 주소의 메서드에서 참조.
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());		
		
		return "redirect:/admin/adreview/adreview_list";
	}
	
	// 리뷰 게시물 삭제 -> 리스트
	@PostMapping("/remove")
	public String remove(@RequestParam("rv_num") Long rv_num, Criteria cri, RedirectAttributes rttr) {
		
		log.info("called remove .... " + rv_num);
		
		adReviewService.remove(rv_num);
		
		rttr.addFlashAttribute("result", "remove");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());	
		
		
		return "redirect:/admin/adreview/adreview_list";
	}
	
	

}
