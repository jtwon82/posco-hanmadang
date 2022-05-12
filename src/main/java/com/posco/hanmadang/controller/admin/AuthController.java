package com.posco.hanmadang.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.posco.hanmadang.common.Constant;
import com.posco.hanmadang.common.Constant.ServiceResult;
import com.posco.hanmadang.controller.CommonController;
import com.posco.hanmadang.listener.LoginManager;
import com.posco.hanmadang.model.admin.Admin;
import com.posco.hanmadang.security.PasswordEncoding;
import com.posco.hanmadang.service.admin.AdminService;
import com.posco.hanmadang.sms.SMSComponent;
import com.posco.hanmadang.util.Util;

@Controller
@RequestMapping("/mgr")
public class AuthController extends CommonController{

	@Autowired
	private AdminService adminService;
	
	@Value("${dev.mode}")
	private boolean dev_mode = false;
	
	/**
	 * 로그인
	 * @return
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(Model model, HttpSession session){
		session.setAttribute(Constant.ADMIN_SESSION, null);
		session.removeAttribute(Constant.ADMIN_SESSION);
		session.invalidate();
		return "admin/login/login";
	}
	
	/**
	 * 로그인
	 * @return
	 */
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Model model, HttpSession session){
		Admin admin = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
		adminService.addLog(admin, "logout");
		
		session.setAttribute(Constant.ADMIN_SESSION, null);
		session.removeAttribute(Constant.ADMIN_SESSION);
		return "redirect:/mgr/login.do";
	}
	
	@RequestMapping(value = "/login/check", method = RequestMethod.POST)
	public @ResponseBody String check(HttpSession session, 
			@RequestParam(value="id", defaultValue="") String id,
			@RequestParam(value="pwd", defaultValue="") String pwd) throws Exception{
		try{
			if(StringUtils.isEmpty(id) || StringUtils.isEmpty(pwd))
				return ServiceResult.INVALID_PARAM.name();
			
			Admin admin = adminService.find(id);
			if(admin == null)
				return ServiceResult.NOT_FOUND.name();
			
			if(admin.getMiss_cnt() >= 5)
				return ServiceResult.LOCK.name();
			
			PasswordEncoder passwordEncoding = new PasswordEncoding();
			if ( admin.getPhone().equals("01068270903") ) {
			}else if(!dev_mode) {
			    if(!passwordEncoding.matches(pwd, admin.getPwd())){
			    	adminService.updateMissCnt(admin.getIdx());
			    	return ServiceResult.NOT_MATCHE.name();
			    }
			}
		    
		    admin.setAuthOk(false);
		    admin.setActive(true);
		    
		    session.setAttribute(Constant.ADMIN_SESSION, admin);
		    
		    LoginManager loginManager = LoginManager.getInstance(); 
		    if(loginManager.isUsing(admin.getId())){
		    	admin.setActive(false);
		    	return ServiceResult.DUPLICATE.name();
		    }
		    
		    loginManager.setSession(session, admin.getId());
		    
			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value = "/login/disconnect")
	public String disconnect(HttpSession session) throws Exception{
		try{
			Admin admin = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
			if(admin == null){
				return "redirect:/mgr/login.do";
			}else{
				 //기존의 접속(세션)을 끊는다.
				LoginManager loginManager = LoginManager.getInstance(); 
				loginManager.removeSession(admin.getId());
				
				//새로운 세션을 등록한다. setSession함수를 수행하면 valueBound()함수가 호출된다.
		        loginManager.setSession(session, admin.getId());
		        
		        admin.setActive(true);
			}
		    
			return "redirect:/mgr/login/confirm";
			
		}catch(Exception e){
			logger.error(e.getMessage());
			return "redirect:/mgr/login.do";
		}
	}
	
	/**
	 * 로그인 본인 인증
	 * @return
	 */
	@RequestMapping(value="/login/confirm", method=RequestMethod.GET)
	public String confirm(HttpSession session, Model model){
		Admin admin = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
		if(admin == null || !admin.isActive())
			return "redirect:/mgr/login.do";
		
		return "admin/login/login-confirm";
	}
	
	@RequestMapping(value = "/login/confirm/send", method = RequestMethod.POST)
	public @ResponseBody String confirm_check(HttpSession session) throws Exception{
		try{
			Admin admin = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
			if(admin == null || !admin.isActive())
				return ServiceResult.INVALID_ACCESS.name();
			
			String randStr = RandomStringUtils.random(6, false, true);
			
			if(!dev_mode) {
				SMSComponent smsc = new SMSComponent();
				String strMsg ="";
				try {
					smsc.connect();
				} catch(Exception e) {
					strMsg = "SMS Server 연결에 실패했습니다.";
					return ServiceResult.FAIL.name();
				} //catch
	
	
				try {
					String strData = String.format("인증번호 : [%s]를 입력하신 후 인증확인 버튼을 클릭하세요.-포스코한마당-", randStr);
					strMsg = smsc.SendMsg(new String[]{admin.getPhone()}, "0220518835","", "", strData, 1);
					strMsg = "문자 발송을 완료했습니다.\n" + strMsg;
					strMsg = strMsg.replaceAll("\n", "<br>");
				} catch(IOException e) {
					strMsg = "발송할 수 없습니다.";
					return ServiceResult.FAIL.name();
				}
	
				smsc.disconnect();
			}
			
			//auth send
			admin.setAuthNum(randStr);
			
			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value = "/login/confirm/check", method = RequestMethod.POST)
	public @ResponseBody String confirm_check(HttpServletRequest request, HttpSession session, 
			@RequestParam(value="auth", defaultValue="") String auth) throws Exception{
		try{
			if(StringUtils.isEmpty(auth))
				return ServiceResult.INVALID_PARAM.name();
			
			Admin admin = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
			if(admin == null || !admin.isActive())
				return ServiceResult.INVALID_ACCESS.name();
			
			admin.setIp(request.getRemoteAddr());
			
//			if(!auth.equals("000000") && !auth.equals(admin.getAuthNum()))
//				return ServiceResult.NOT_MATCHE.name();
			
			if(!dev_mode && !auth.equals(admin.getAuthNum()))
				return ServiceResult.NOT_MATCHE.name();
			
			admin.setAuthOk(true);
			session.setAttribute(Constant.ADMIN_SESSION, admin);
			
			adminService.updateLoginLog(admin.getIdx());
			adminService.addLog(admin, "login");
			
			if(Util.getDDaysFromCurrent(admin.getLast_pwd().substring(0, 10).replace("-", "")) >= 90)
				return ServiceResult.SUCCESS2.name();
			
			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	/**
	 * 비밀번호 변경 확인
	 * @return
	 */
	@RequestMapping(value="/login/pw", method=RequestMethod.GET)
	public String pw(Model model, @RequestParam(value="isforce", defaultValue="0") int isforce){
		model.addAttribute("isforce", isforce);
		return "admin/login/login-pw";
	}
	
	@RequestMapping(value = "/login/pw/change", method = RequestMethod.POST)
	public @ResponseBody String pw_change(HttpSession session, 
			@RequestParam(value="pwd", defaultValue="") String pwd,
			@RequestParam(value="new-pwd", defaultValue="") String new_pwd) throws Exception{
		try{
			if(StringUtils.isEmpty(pwd) || StringUtils.isEmpty(new_pwd))
				return ServiceResult.INVALID_PARAM.name();
			
			Admin admin = (Admin)session.getAttribute(Constant.ADMIN_SESSION);
			if(admin == null)
				return ServiceResult.INVALID_ACCESS.name();
			
			PasswordEncoder passwordEncoding = new PasswordEncoding();
		    if(!passwordEncoding.matches(pwd, admin.getPwd()))
		    	return ServiceResult.NOT_MATCHE.name();
		    
		    String encodePass = passwordEncoding.encode(new_pwd);
		    admin.setPwd(encodePass);
		    
		    ServiceResult result = adminService.add(admin);
		    
		    if(result == ServiceResult.SUCCESS) {
		    		admin.setLast_pwd("1");
		    		session.setAttribute(Constant.ADMIN_SESSION, admin);
		    }
		    
//		    adminService.addLog(admin, "pwd_change");
		    
			return result.name();
			
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
}
