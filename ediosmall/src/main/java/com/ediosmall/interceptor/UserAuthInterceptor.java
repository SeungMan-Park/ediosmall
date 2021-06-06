package com.ediosmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class UserAuthInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(UserAuthInterceptor.class);
	private static final String LOGIN = "loginStatus"; 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		// 인증체크작업
		if(session.getAttribute(LOGIN) == null) {
			
			logger.info("로그인이 안되었습니다.");
			log.info("롬북 되는지 확인합시다. ...............");
			
			targetSave(request);
			
			if(isAjaxRequest(request)) {
				response.sendError(-1);
				System.out.println("AjaxRequest요청");				
//				response.sendRedirect("/member/login");
//				System.out.println("/member/login 주소이동 확인?");
//				return false;
			}else {
				response.sendRedirect("/member/login");  // /member/login -> /member/loginPost(인터셉터 설정)
				return false;  // Controller로 제어가 넘어가지 아니함
			}
			
			response.sendRedirect("/member/login");  // /member/login -> /member/loginPost(인터셉터 설정)
			return false;  // Controller로 제어가 넘어가지 아니함
		}

		return true; // Controller로 제어가 넘어감
	}

	// ajax 요청 체크
	private boolean isAjaxRequest(HttpServletRequest req) {
		
		System.out.println("isAjaxRequest 메서드 확인");
		
		String header = req.getHeader("AJAX");
		
		
		if("true".equals(header)) {
			System.out.println("isAjaxRequest 메서드 확인2");
			return true;
		}else {
			System.out.println("isAjaxRequest 메서드 확인3");
			//response.sendRedirect("/member/login");
			return false;
		}		
	}
	
	// ajax 요청 체크
//	private boolean isAjaxRequest(HttpServletRequest req) {
//		
//		System.out.println("isAjaxRequest 메서드 확인");
//		
//		String header = req.getHeader("AJAX");
//		
//		if("false".equals(header)) {
//			System.out.println("isAjaxRequest 메서드 확인2");
//			return false;
//		}else {
//			System.out.println("isAjaxRequest 메서드 확인3");
//			return true;
//		} 
//	}
	
	
	
	// ajax 요청 체크
//	private boolean isAjaxRequest(HttpServletRequest req) {
//		
//		System.out.println("isAjaxRequest 메서드 확인");
//		
//		String header = req.getHeader("X-Requested-With");
//		
//		if("XMLHttpRequest".equals(header)) {
//			System.out.println("isAjaxRequest 메서드 확인2");
//			return true;
//		}else {
//			System.out.println("isAjaxRequest 메서드 확인3");
//			return false;
//		}		
//	}

	// 세션이 소멸된 상태이거나 비로그인시 요청한 주소를 저장
	// 사용자가 로그인이 진행이되면, 요청한 주소가 있으면 그곳으로 이동. 없으면 루트로 이동.
	private void targetSave(HttpServletRequest request) {
		
		//  /member/modify?userid=paradigm2
		String uri = request.getRequestURI();
		String queryString = request.getQueryString();  
		
		if(queryString == null || queryString.equals("null")) {
			queryString = "";
		}else {
			queryString = "?" + queryString;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("targetSave : " + (uri + queryString));
			log.info("롬북 되는지 확인합시다. ...............");
			request.getSession().setAttribute("targetUrl", uri + queryString);
			
		}
		
	}

}
