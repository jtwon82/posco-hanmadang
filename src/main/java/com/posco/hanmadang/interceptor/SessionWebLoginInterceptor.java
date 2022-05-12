package com.posco.hanmadang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.posco.hanmadang.common.Constant;
import com.posco.hanmadang.model.Member;


public class SessionWebLoginInterceptor implements HandlerInterceptor{
	private final Log log = LogFactory.getLog(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

//		if(request.isSecure()) {
//			response.sendRedirect("/");
//		}
		
//		if (request.getRemoteUser() != null && request.getScheme().equals("https")) {
//            String url = "http://" + request.getServerName()
//                    + request.getContextPath() + request.getServletPath();
//            if (request.getPathInfo() != null) {
//                url += request.getPathInfo();
//            }
//            response.sendRedirect(url);
//		}
		
		// 세션체크
		HttpSession session = request.getSession();
		Member account = (Member)session.getAttribute(Constant.MEMBER_SESSION);
		if(account == null){
			response.sendRedirect("/my/login");
			return false;
		}

		return true;
	}
 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
