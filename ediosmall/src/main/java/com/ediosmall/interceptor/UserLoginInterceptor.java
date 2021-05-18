package com.ediosmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

// 인증처리작업 : HttpSession 로그인 생성
@Log4j  // 되는지 확인해보자구
public class UserLoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(UserLoginInterceptor.class);
	private static final String LOGIN = "loginStatus"; 
	
	// Object handler : URL Mapping 주소에 해당하는 메서드 자체를 가리킴
	// 아래 클래스를 빼면 자동(부모에 있는 - HandlerInterceptorAdapter - 작동)으로 작동이 됩니다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
//		HttpSession session =  request.getSession();
//		MbeiosVO mbeiosVO = (MbeiosVO) session.getAttribute("mbeiosVO");
//		
//		if(mbeiosVO == null) {
//			response.sendRedirect("/member/login");
//			return false;
//		}


		return true;
	}

	// 컨트롤러의 매핑주소 /member/loginPost (메서드호출) -> postHandle 메서드 -> 뷰(jsp)화면처리 작업이 진행됨(loginPost.jsp 있어야 한다는 의미다.) 
	// ModelAndView : (Model + View) 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		/*  강사님 코드를 확인해보자구
		MemberVO vo = new MemberVO();
		modelAndView.setViewName("member");
		modelAndView.addObject("memberVO", vo);
		*/
		
		// 로그인시 인증처리하기위한 세선객체 확보
		HttpSession session =  request.getSession();
		
		// 로그인시 Model정보를 참조하는 작업
		ModelMap modelMap = modelAndView.getModelMap();
		Object mbeiosVO = modelMap.get("mbeiosVO");
		
//		if(mbeiosVO == null) {
//			response.sendRedirect("/member/login");
//			return;
//		}
		
		if(mbeiosVO != null) {
			
			logger.info("로그인 성공");
			
			log.info("롬북 테스트. 되면 롬북을 쓰도록 하자");
			session.setAttribute(LOGIN, mbeiosVO);
			
			Object targetUrl = session.getAttribute("targetUrl");
			
			response.sendRedirect(targetUrl != null ? (String) targetUrl : "/");
			
		}
		
		// response.sendRedirect("/");  이 위치에서는 지원이 안됨(중요***)
		// ajax요청시 인터셉터는 정상작동 되지 않음.
		
	}
	
}
