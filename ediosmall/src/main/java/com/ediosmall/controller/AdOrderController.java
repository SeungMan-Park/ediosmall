package com.ediosmall.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ediosmall.domain.OrderDetailSeenVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.dto.OrderUiPageDTO;
import com.ediosmall.dto.PageDTD;
import com.ediosmall.service.HiredateService;
import com.ediosmall.service.OrderService;
import com.ediosmall.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/order/*")
public class AdOrderController {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Resource(name ="uploadPath")
	private String uploadPath;
	
	@Setter(onMethod_ = @Autowired)
	private HiredateService hiredateService;
	
	// @RequestMapping(value = {"/order_list", "/order_detail_list"}, method = {RequestMethod.GET, RequestMethod.POST})
	@RequestMapping(value = "/order_list", method = {RequestMethod.GET, RequestMethod.POST})
	public void order_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		log.info("order_list : " + cri);
		
		model.addAttribute("order_list", orderService.orderInfo_list(cri));
		
		int total = orderService.getTotalCountOrder(cri);
		
		model.addAttribute("pageMaker", new PageDTD(cri, total));
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
	
	// ????????????
	@GetMapping("/order_sale")
	public void order_sale(Model model, @RequestParam(required = false) Integer year, @RequestParam(required = false) Integer month) throws Exception {
		
		log.info("order_sale");
		
		// ?????? ?????????, ?????? ?????????
		Calendar cal = Calendar.getInstance();
		
		log.info(cal);
		
		int cur_year;
		int cur_month;
		
		if(year != null && month != null) {
			cur_year = (int) year;
			cur_month = ((int) month) -1;  // ????????????????????? ????????? ?????? 4??? ????????? 4-1??? ???????????? ??????.
			
		}else {
			cur_year = cal.get(Calendar.YEAR);
			cur_month = cal.get(Calendar.MONTH);
		}
		
		model.addAttribute("sel_year", cur_year);
		model.addAttribute("sel_month", cur_month+1);
		
		log.info("sel_year : " + cur_year);
		log.info("sel_month : " + cur_month);
		
		cal.set(cur_year, cur_month, 1);  // ??? 0~11 : 
		
		// log.info("???????????? : " + cal);
		
		int start_day = cal.getActualMinimum(Calendar.DAY_OF_MONTH);
		int end_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		cal.set(cur_year, cur_month, start_day);
		
		String startDate = dateFormat.format(cal.getTime());
		cal.set(cur_year, cur_month, end_day);
		String endDate = dateFormat.format(cal.getTime());
		
		log.info("????????? : " + startDate); // ????????? : 2021-04-01
		log.info("?????? : " + endDate);  // ?????? : 2021-04-30
		
		model.addAttribute("order_salelist", orderService.order_sale(startDate, endDate));
		
	}
	
	// ????????????
	@GetMapping("/order_sale_hit")
	public void order_sale_hit(Model model) throws Exception {
		
		model.addAttribute("order_sale_hit", orderService.order_sale_hit());
		
	}
	
	
}
