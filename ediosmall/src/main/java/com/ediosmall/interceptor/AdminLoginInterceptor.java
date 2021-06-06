package com.ediosmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "adLoginStatus";
	
	// Object handler : URL Mapping 주소에 해당하는 메서드 자체를 가리킴
	// 아래 클래스를 빼면 자동(부모에 있는 - HandlerInterceptorAdapter - 작동)으로 작동이 됩니다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

	
		return true;  // Controller로 제어가 넘어감
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		// 로그인시 인증처리하기위한 세선객체 확보
		HttpSession session = request.getSession();
		
		// 로그인시 Model정보를 참조하는 작업
		ModelMap modelMap = modelAndView.getModelMap();
		Object adminVO = modelMap.get("adminVO");
		
		if(adminVO != null) {
			session.setAttribute(LOGIN, adminVO);
			
			Object targetUrl = session.getAttribute("targetUrl");
			response.sendRedirect(targetUrl != null ? (String) targetUrl : "/admin/admin_process");
		}
		
	}

	

}
