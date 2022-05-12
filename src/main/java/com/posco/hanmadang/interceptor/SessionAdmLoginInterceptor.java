package com.posco.hanmadang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.posco.hanmadang.common.Constant;
import com.posco.hanmadang.mapper.posco.AdminMapper;
import com.posco.hanmadang.model.admin.Admin;
import com.posco.hanmadang.model.admin.AdminLog;


public class SessionAdmLoginInterceptor implements HandlerInterceptor{
	private final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		// 세션체크
		HttpSession session = request.getSession();
		Admin account = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
		if(account == null || !account.isAuthOk()){
			response.sendRedirect("/mgr/login.do");
			return false;
		}
		
		if(!request.getRequestURI().contains("/mgr/login/pw") && 
				account.getRegidate().equals(account.getLast_pwd())) {
			response.sendRedirect("/mgr/login/pw?isforce=1");
			return false;
		}
			
		
		logger.info("############:" + request.getRequestURI());
		
//		String me = request.getMethod();
//		if(request.getMethod().equals("POST")){
//			System.out.println("############:" + request.getRequestURI());
			account.setIp(request.getRemoteAddr());
			AdminLog log = new AdminLog();
			log.setId(account.getId());
			log.setIp(account.getIp());
			log.setName(account.getName());
			log.setAction(request.getRequestURI());
			adminMapper.insertLog(log);
//		}
		
		
		//권한철 접근 확인
		if(!account.getPath_role().contains("all")){
			if((request.getRequestURI().contains("/mgr/content/") && !account.getPath_role().contains(",content")) ||
					(request.getRequestURI().contains("/mgr/employee/") && !account.getPath_role().contains(",member")) || 
					(request.getRequestURI().contains("/mgr/entry/") && !account.getPath_role().contains(",lecture")) ||
					(request.getRequestURI().contains("/mgr/class/") && !account.getPath_role().contains(",class")) ||
					(request.getRequestURI().contains("/mgr/rent/") && !account.getPath_role().contains(",rent")) ||
					(request.getRequestURI().contains("/mgr/stats/") && !account.getPath_role().contains(",stats")) ||
					(request.getRequestURI().contains("/mgr/gym/") && !account.getPath_role().contains(",gym")) ||
					(request.getRequestURI().contains("/mgr/role/") && !account.getPath_role().contains(",admin"))){
				response.sendRedirect("/mgr/main");
				return false;
			}
			
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
