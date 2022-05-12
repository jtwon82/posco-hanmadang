package com.posco.hanmadang.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.posco.hanmadang.interceptor.RootHandlerInterseceptor;
import com.posco.hanmadang.interceptor.SessionAdmLoginInterceptor;
import com.posco.hanmadang.interceptor.SessionWebLoginInterceptor;

@Configuration 
//@EnableWebMvc
public class HttpInterceptorConfig extends WebMvcConfigurerAdapter 
{ 
	@Bean
	public SessionAdmLoginInterceptor sessionAdmLoginInterceptor() {
	    return new SessionAdmLoginInterceptor();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor((HandlerInterceptor) sessionAdmLoginInterceptor()).addPathPatterns("/mgr/**")
				.excludePathPatterns("/mgr/login.do", "/mgr/login/check", "/mgr/login/disconnect",
						"/mgr/login/confirm/**");

		registry.addInterceptor((HandlerInterceptor) new SessionWebLoginInterceptor())
				.addPathPatterns("/my/**", "/login/**").excludePathPatterns("/my/login", "/login/member/check",
						"/login/find/**", "/my/lecture/pay/return", "/login/dormant/**");

		registry.addInterceptor((HandlerInterceptor) new RootHandlerInterseceptor()).addPathPatterns("/**");
	}
}