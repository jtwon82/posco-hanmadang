package com.posco.hanmadang.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.posco.hanmadang.model.CalVO;
import com.posco.hanmadang.model.Test;
import com.posco.hanmadang.service.TestService;

@Controller
public class WebController {

	@Autowired
	private TestService testService;
	
	@RequestMapping("/")
	public @ResponseBody String home(){
		Test test = testService.find("test");
		if(test != null)
			return test.getName();
		
		return "hello hanmadang";
	}

	@RequestMapping(value = "/{menu}/{page}")
	public String simpleview2(Model model, @PathVariable String menu, @PathVariable String page) {
		if (menu != null) {
			return menu + "/" + page;	
		} else {
			return page;
		}
		
	}

	@RequestMapping("/test/cal")
	public String test_cal(@RequestParam(value="month", defaultValue="") String month, ModelMap model) throws Exception{
		return "/cal";
	}
	
	@RequestMapping("/test/cal1")
	public String test_cal1(@RequestParam(value="month", defaultValue="") String month, ModelMap model) throws Exception{
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		Calendar cal = Calendar.getInstance();
		if(StringUtils.isEmpty(month))
			month = format.format(cal.getTime());
		
		cal.setTime(format.parse(month));
		cal.set(Calendar.DAY_OF_MONTH, 1);
		
		int curMon = cal.get(Calendar.MONTH);
		
		// 임의의 데이터 만들기
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
		List<CalVO> dataList = new ArrayList<CalVO>();
		Random generator = new Random();        
		while(true) {
			
			CalVO tmpCal = new CalVO();
			tmpCal.setTime_date(format2.format(cal.getTime()));
			tmpCal.setLock_yn((generator.nextInt(10) % 2) == 0);
			tmpCal.setConfirm_yn((generator.nextInt(10) % 2) == 0);
			dataList.add(tmpCal);
			
			cal.add(Calendar.DAY_OF_MONTH, 1);
			
			int mon = cal.get(Calendar.MONTH);
			if(curMon != mon)
				break;
		}
		
		model.addAttribute("list", dataList);
		model.addAttribute("month", month);
		return "/cal1";
	}
	
}
