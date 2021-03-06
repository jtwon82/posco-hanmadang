package com.posco.hanmadang.controller.admin;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.posco.hanmadang.common.Constant;
import com.posco.hanmadang.common.Constant.ServiceResult;
import com.posco.hanmadang.controller.CommonController;
import com.posco.hanmadang.model.ClassDate;
import com.posco.hanmadang.model.ClassDrawFactor;
import com.posco.hanmadang.model.ClassInfo;
import com.posco.hanmadang.model.ClassUser;
import com.posco.hanmadang.model.ClassUserPagedList;
import com.posco.hanmadang.model.admin.SearchParam;
import com.posco.hanmadang.model.admin.VIPMember;
import com.posco.hanmadang.service.ClassService;
import com.posco.hanmadang.util.Paging;
import com.posco.hanmadang.util.Util;

@Controller
@RequestMapping("/mgr/entry")
public class EntryController extends CommonController{
	
	@Autowired
	private ClassService classService;
	
	/**
	 * ???????????? ?????? ??????
	 * @return
	 */
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String info(Model model, HttpServletRequest request,
			@RequestParam(value="mode", defaultValue="0") int mode){
		model.addAttribute("mode", mode);
		
		ClassDate classDate = classService.getActiveClassDate();
		model.addAttribute("classDate", classDate);
		
		List<ClassInfo> mainClass = classService.getMainClass();
		model.addAttribute("mainClass", mainClass);
		
		List<ClassInfo> subClass = classService.getAllSubClass();
		model.addAttribute("subClass", subClass);
		
		return "admin/lecture/lecture-list";
	}
	
	@RequestMapping(value="/class/item/{idx}", method=RequestMethod.GET)
	public String class_get(Model model, HttpServletRequest request,
			@PathVariable(value="idx") long idx_no){
		ClassInfo classInfo = classService.findClass(idx_no);
		model.addAttribute("classInfo", classInfo);
		
		List<ClassInfo> mainClass = classService.getMainClass();
		model.addAttribute("mainClass", mainClass);
		
		return "admin/lecture/lecture-list-pop";
	}
	
	@RequestMapping(value="/class/date", method=RequestMethod.POST)
	public @ResponseBody String add_class_date(@RequestParam(value="startdate", defaultValue="") String startdate,
			@RequestParam(value="enddate", defaultValue="") String enddate){
		try{
			if(StringUtils.isEmpty(startdate) || StringUtils.isEmpty(enddate))
				return ServiceResult.INVALID_PARAM.name();
			
			startdate = startdate + " 00:00:00.0";
			enddate = enddate + " 00:00:00.0";
			
			ServiceResult result = classService.addClassDate(startdate, enddate);
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/class/main/add", method=RequestMethod.POST)
	public @ResponseBody String main_class_add(@ModelAttribute(value="classInfo") ClassInfo classInfo){
		try{
			ServiceResult result = classService.addMainCate(classInfo);
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/class/main/del", method=RequestMethod.POST)
	public @ResponseBody String main_class_del(@RequestParam(value="idx_no", defaultValue="0") int idx_no){
		try{
			if(idx_no <= 0)
				return ServiceResult.INVALID_PARAM.name();
			
			ServiceResult result = classService.removeClass(idx_no);
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/class/sub/add", method=RequestMethod.POST)
	public @ResponseBody String sub_class_add(@ModelAttribute(value="classInfo") ClassInfo classInfo){
		try{
			ServiceResult result = classService.addSubClass(classInfo);
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/class/sub/del", method=RequestMethod.POST)
	public @ResponseBody String sub_class_del(@RequestParam(value="idx_no", defaultValue="0") int idx_no){
		try{
			if(idx_no <= 0)
				return ServiceResult.INVALID_PARAM.name();
			
			ServiceResult result = classService.removeClass(idx_no);
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/class/sub/view", method=RequestMethod.POST)
	public @ResponseBody String sub_class_view(@RequestParam(value="idx_no", defaultValue="0") int idx_no,
			@RequestParam(value="view_yn", defaultValue="Y") String view_yn){
		try{
			if(idx_no <= 0)
				return ServiceResult.INVALID_PARAM.name();
			
			ServiceResult result = classService.setClassShow(idx_no, view_yn);
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/apply/excel", method=RequestMethod.GET)
	public void apply_excel(Model model, HttpServletResponse response,
			@ModelAttribute(value="param") SearchParam param) throws IOException {
		response.setHeader("Content-disposition", "attachment; filename=class_apply.xls"); //target?????? ??????????????? ??????
		
		List<ClassUser> list = classService.getClassUserList(Constant.ClassUserListMode.class_all.name(), param);
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("?????????????????????") ;

		//iterating r number of rows
		HSSFRow row = sheet.createRow(0);
		row.createCell(0).setCellValue("????????????");
		row.createCell(1).setCellValue("?????????");
		row.createCell(2).setCellValue("????????????");
		row.createCell(3).setCellValue("????????????");
		row.createCell(4).setCellValue("????????????");
		row.createCell(5).setCellValue("????????????");
		row.createCell(6).setCellValue("??????");
		row.createCell(7).setCellValue("?????????");
		row.createCell(8).setCellValue("??????");
		row.createCell(9).setCellValue("??????");
		row.createCell(10).setCellValue("??????");
		
		int idx = 1;
		for (ClassUser user : list)
		{
			row = sheet.createRow(idx++);
	
			//iterating c number of columns

				row.createCell(0).setCellValue(user.getClassInfo().getB_cate_name());
				row.createCell(1).setCellValue(user.getClassInfo().getClass_name());
				row.createCell(2).setCellValue(user.getClassInfo().getClass_time());
				if("01".equals(user.getEm_type()))
					row.createCell(3).setCellValue("??????????????????");
				else if("02".equals(user.getEm_type()))
					row.createCell(3).setCellValue("??????????????????");
				else if("03".equals(user.getEm_type()))
					row.createCell(3).setCellValue("????????????");
				
				row.createCell(4).setCellValue(user.getO_name());
				row.createCell(5).setCellValue(user.getHp());
				row.createCell(6).setCellValue(user.getE_no());
				row.createCell(7).setCellValue(user.getE_name());
				row.createCell(8).setCellValue(user.getPartname());
				row.createCell(9).setCellValue(user.getMem_type());
				row.createCell(10).setCellValue("1".equals(user.getGender()) ? "??????" : "??????");
		}
		
		wb.write(response.getOutputStream());
//		new ExcelExporter().exportHtml(excel_data, response.getOutputStream());
		return;
	}
	
	/**
	 * ???????????? ?????? ?????????
	 * @return
	 */
	@RequestMapping(value="/apply/list")
	public String apply_list(Model model, HttpServletRequest request,
			@RequestParam(value="pageNumber", defaultValue="1")int pageNumber,
			@RequestParam(value="mode", defaultValue="0") int mode,
			@ModelAttribute(value="param") SearchParam param){
		
		model.addAttribute("mode", mode);
		model.addAttribute("param", param);
		
		List<ClassInfo> mainClass = classService.getMainClass();
		model.addAttribute("mainClass", mainClass);
		
		String class_user_mode = Constant.ClassUserListMode.class_all.name();
		
		if(mode == 1)
			class_user_mode = Constant.ClassUserListMode.class_none.name();
		
		ClassUserPagedList pagedList = classService.getClassUserPagedList(pageNumber, class_user_mode, param);
		if(pagedList != null){
			String baseUrlFormat = Util.getPagingBaseUrl("list", request.getQueryString(), pageNumber);
			Paging paging = pagedList.getPaging();
			paging.setBaseUrlFormat(baseUrlFormat);
			
			model.addAttribute("list", pagedList.getList());
			model.addAttribute("paging", paging);
		}
		
		return "admin/lecture/lecture-member-list";
	}
	
	@PostMapping("/apply/vip") 
    public @ResponseBody String set_vip(@RequestParam("file") MultipartFile file, HttpSession session) {
    	
        if (file == null || file.isEmpty())
        	return ServiceResult.INVALID_PARAM.name();
        
        String ext = Util.getExtension(file.getOriginalFilename()).toLowerCase();
        if(!"xlsx".equals(ext) && !"xls".equals(ext))
			return ServiceResult.NOT_MATCHE.name();
			
        List<VIPMember> dataList = new ArrayList<VIPMember>();
        Workbook workbook = null;
		
        try {
        	if("xls".equals(ext))
        		workbook = new HSSFWorkbook(file.getInputStream());
        	else
        		workbook = new XSSFWorkbook(file.getInputStream());
        	//sheet??? ??????
			int sheetCn = workbook.getNumberOfSheets();
			logger.info("sheet??? : " + sheetCn);
			
			if(sheetCn < 1)
				return ServiceResult.NOT_MATCHE.name();
			
			//0?????? sheet ?????? ??????
			Sheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			logger.info(workbook.getSheetName(0) + " sheet??? row??? : " + rows);
			
			if(rows > 3){
				//????????? row?????? ???????????? cell??? ??????
				int cells = sheet.getRow(1).getPhysicalNumberOfCells(); //
				logger.info(workbook.getSheetName(0) + " sheet??? row??? ???????????? cell??? : " + cells);
				
				if(cells != 6)
					return ServiceResult.NOT_MATCHE.name();
				
				for (int r = 3; r < rows; r++) {
					Row row = sheet.getRow(r); // row ????????????
					if (row != null) {
						VIPMember vipData = new VIPMember();
						for (int c = 0; c < cells + 2; c++) {
							Cell cell = row.getCell(c);
							if (cell != null) {
								
								cell.setCellType(Cell.CELL_TYPE_STRING);
								String value = "" + cell.getStringCellValue();
								
								if(c == Constant.VIPXLSFile.name.ordinal())
									vipData.setName(value);
								else if(c == Constant.VIPXLSFile.class_name.ordinal())
									vipData.setClass_name(value);
								else if(c == Constant.VIPXLSFile.class_time.ordinal())
									vipData.setClass_time(value);
								else if(c == Constant.VIPXLSFile.phone.ordinal())
									vipData.setPhone(value.replaceAll("-", ""));
								else if(c == Constant.VIPXLSFile.em_name.ordinal())
									vipData.setEm_name(value);
								else if(c == Constant.VIPXLSFile.em_type.ordinal())
									vipData.setEm_type(value);
								else if(c == Constant.VIPXLSFile.type.ordinal())
									vipData.setType(value);
							
//								System.out.print(value + "\t");
							} else {
//								System.out.print("[null]\t");
							}
						} // for(c) ???
//						
//						System.out.print("\n");
						if(!StringUtils.isEmpty(vipData.getName()) &&
								!StringUtils.isEmpty(vipData.getPhone()) &&
								!StringUtils.isEmpty(vipData.getType()) &&
								!StringUtils.isEmpty(vipData.getEm_type())){
							try{
//								Integer.parseInt(employeeData.getEm_no());
								if(!"????????????".equals(vipData.getEm_type()) && "??????".equals(vipData.getType()))
									vipData.setEm_name(vipData.getName());
								
								if("?????????".equals(vipData.getEm_type()))
									vipData.setEm_type("01");
								
								else if("?????????".equals(vipData.getEm_type()))
									vipData.setEm_type("02");
								
								else if("????????????".equals(vipData.getEm_type()))
									vipData.setEm_type("03");
								
								dataList.add(vipData);
//								log.info("added data :" + employeeData.toString());
							}catch(NumberFormatException e){
								logger.info("error data :" + vipData.toString());
								logger.error(e.getMessage());
							}
						}
					}
				} // for(r) ???
			}

        } catch (IOException e) {
        	logger.error(e.getMessage());
			return Constant.ServiceResult.FAIL.name();
        }
        
        ServiceResult result = classService.setVipUser(dataList);
        return result.name();
    }
	
	@RequestMapping(value="/apply/result/change", method=RequestMethod.POST)
	public @ResponseBody String apply_result_change(@RequestParam(value="class_ok", defaultValue="") String class_ok,
			@RequestParam(value="class_re", defaultValue="") String class_re){
		try{
			List<Integer> class_ok_idx = new ArrayList<Integer>();
			String[] oks = class_ok.split("#");
			for(String idx : oks){
				if(!StringUtils.isEmpty(idx))
					class_ok_idx.add(Integer.parseInt(idx));
			}
			
			List<Integer> class_re_idx = new ArrayList<Integer>();
			String[] res = class_re.split("#");
			for(String idx : res){
				if(!StringUtils.isEmpty(idx))
					class_re_idx.add(Integer.parseInt(idx));
			}
			
			classService.setDrawStatus(class_ok_idx, Constant.YesNoStatus.Y.name());
			classService.setDrawStatus(class_re_idx, Constant.YesNoStatus.D.name());
			
			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/apply/result/cancel", method=RequestMethod.POST)
	public @ResponseBody String apply_result_cancel(@RequestParam(value="idx", defaultValue="0") int idx){
		try{
			
			if(idx <= 0)
				return ServiceResult.INVALID_PARAM.name();
			
			List<Integer> list = new ArrayList<Integer>();
			list.add(idx);
			
			ServiceResult result = classService.setDrawStatus(list, Constant.YesNoStatus.N.name());
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	/**
	 * ????????????
	 * @return
	 */
	@RequestMapping(value="/draw/list", method=RequestMethod.GET)
	public String draw_list(Model model, HttpServletRequest request){
//		List<ClassInfo> mainClass = classService.getMainClass();
//		model.addAttribute("mainClass", mainClass);
		
		Calendar cal = Calendar.getInstance();
		String dateFormat = "yyyy??? MM??? dd??? HH??? mm???";
		SimpleDateFormat formatter = new SimpleDateFormat(dateFormat);
		String disdate = formatter.format(cal.getTime());
		model.addAttribute("date", disdate);
		
//		List<ClassDrawFactor> factors = classService.getDrawFactor();
//		model.addAttribute("factors", factors);
		
		ClassDate classDate = classService.getActiveClassDate();
		model.addAttribute("classDate", classDate);
		
		List<ClassInfo> subClass = classService.getAllSubClass();
		model.addAttribute("subClass", subClass);
		
		int view_cnt = classService.countDrawView();
		model.addAttribute("view_cnt", view_cnt);
		
		int end_cnt = classService.countPreDrawEnd();
		model.addAttribute("end_cnt", end_cnt);
		
		return "admin/lecture/lecture-draw";
	}
	
	@RequestMapping(value="/draw/factor", method=RequestMethod.POST)
	public @ResponseBody String change_draw_factor(@ModelAttribute(value="drawFactor") ClassDrawFactor factor){
		try{
			
			ClassInfo info = classService.findClass(factor.getIdx_no());
			if(info == null)
				return ServiceResult.NOT_FOUND.name();
			
			int class_c_count = (factor.getGeneral() * factor.getTotal() ) / 100;
			int class_b_count = (factor.getAssociate() * factor.getTotal() ) / 100;
			int class_a_count = factor.getTotal() - class_b_count - class_c_count;
			
			info.setClass_a_count(class_a_count);
			info.setClass_b_count(class_b_count);
			info.setClass_c_count(class_c_count);
			info.setClass_man_per(factor.getMan());
			info.setClass_women_per(factor.getWomen());
			
			classService.changDrawFactor(info);
			
			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/draw/proc", method=RequestMethod.POST)
	public @ResponseBody String proc_draw(){
		try{
			classService.procDraw(0);
			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/draw/open", method=RequestMethod.POST)
	public @ResponseBody String open_draw_result(){
		try{
			ServiceResult result = classService.openDrawResult();
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/draw/reset", method=RequestMethod.POST)
	public @ResponseBody String reset_draw(){
		try{
			ServiceResult result = classService.resetDrawResult();
			return result.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	@RequestMapping(value="/draw/end", method=RequestMethod.POST)
	public @ResponseBody String end_draw(){
		try{
			ServiceResult result = classService.procCompletClass();
			return result.name();
			
//			return ServiceResult.SUCCESS.name();
		}catch(Exception e){
			logger.error(e.getMessage());
			return ServiceResult.FAIL.name();
		}
	}
	
	/**
	 * ??????/????????? ?????????
	 * @return
	 */
	@RequestMapping(value="/result/list")
	public String result_list(Model model, HttpServletRequest request,
			@RequestParam(value="pageNumber", defaultValue="1")int pageNumber,
			@ModelAttribute(value="param") SearchParam param){
		List<ClassInfo> mainClass = classService.getMainClass();
		model.addAttribute("mainClass", mainClass);
		
		ClassUserPagedList pagedList = classService.getClassUserPagedList(pageNumber, Constant.ClassUserListMode.class_ok.name(), param);
		if(pagedList != null){
			String baseUrlFormat = Util.getPagingBaseUrl("list", request.getQueryString(), pageNumber);
			Paging paging = pagedList.getPaging();
			paging.setBaseUrlFormat(baseUrlFormat);
			
			model.addAttribute("list", pagedList.getList());
			model.addAttribute("paging", paging);
		}
		
		return "admin/lecture/lecture-standby";
	}
	
	@RequestMapping(value="/result/excel", method=RequestMethod.GET)
	public void stats_excel(Model model, HttpServletResponse response,
			@ModelAttribute(value="param") SearchParam param) throws IOException {
		response.setHeader("Content-disposition", "attachment; filename=class_result.xls"); //target?????? ??????????????? ??????
		
		List<ClassUser> list = classService.getClassUserList1(Constant.ClassUserListMode.class_ok.name(), param);
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("???????????????") ;

		//iterating r number of rows
		HSSFRow row = sheet.createRow(0);
		row.createCell(0).setCellValue("????????????");
		row.createCell(1).setCellValue("?????????");
		row.createCell(2).setCellValue("????????????");
		row.createCell(3).setCellValue("????????????");
		row.createCell(4).setCellValue("????????????");
		row.createCell(5).setCellValue("????????????");
		row.createCell(6).setCellValue("??????");
		row.createCell(7).setCellValue("?????????");
		row.createCell(8).setCellValue("??????");
		row.createCell(9).setCellValue("??????");
		row.createCell(10).setCellValue("??????");
		row.createCell(11).setCellValue("??????");
		
		int idx = 1;
		for (ClassUser user : list)
		{
			row = sheet.createRow(idx++);
	
			//iterating c number of columns

				row.createCell(0).setCellValue(user.getClassInfo().getB_cate_name());
				row.createCell(1).setCellValue(user.getClassInfo().getClass_name());
				row.createCell(2).setCellValue(user.getClassInfo().getClass_time());
				if("01".equals(user.getEm_type()))
					row.createCell(3).setCellValue("??????????????????");
				else if("02".equals(user.getEm_type()))
					row.createCell(3).setCellValue("??????????????????");
				else if("03".equals(user.getEm_type()))
					row.createCell(3).setCellValue("????????????");
				
				row.createCell(4).setCellValue(user.getO_name());
				row.createCell(5).setCellValue(user.getHp());
				row.createCell(6).setCellValue(user.getE_no());
				row.createCell(7).setCellValue(user.getE_name());
				row.createCell(8).setCellValue(user.getPartname());
				row.createCell(9).setCellValue(user.getMem_type());
				row.createCell(10).setCellValue("1".equals(user.getGender()) ? "??????" : "??????");
				
				if("Y".equals(user.getClass_yn()))
					row.createCell(11).setCellValue("??????");
				else if("D".equals(user.getClass_yn()))
					row.createCell(11).setCellValue("?????? "+ user.getRankFormat());
				else
					row.createCell(11).setCellValue("?????????");
				
		}
		
		list = classService.getClassUserList1(Constant.ClassUserListMode.class_none.name(), param);
		for (ClassUser user : list)
		{
			row = sheet.createRow(idx++);
	
			//iterating c number of columns

				row.createCell(0).setCellValue(user.getClassInfo().getB_cate_name());
				row.createCell(1).setCellValue(user.getClassInfo().getClass_name());
				row.createCell(2).setCellValue(user.getClassInfo().getClass_time());
				if("01".equals(user.getEm_type()))
					row.createCell(3).setCellValue("??????????????????");
				else if("02".equals(user.getEm_type()))
					row.createCell(3).setCellValue("??????????????????");
				else if("03".equals(user.getEm_type()))
					row.createCell(3).setCellValue("????????????");
				
				row.createCell(4).setCellValue(user.getO_name());
				row.createCell(5).setCellValue(user.getHp());
				row.createCell(6).setCellValue(user.getE_no());
				row.createCell(7).setCellValue(user.getE_name());
				row.createCell(8).setCellValue(user.getPartname());
				row.createCell(9).setCellValue(user.getMem_type());
				row.createCell(10).setCellValue("1".equals(user.getGender()) ? "??????" : "??????");
				row.createCell(11).setCellValue("?????????");
		}
		
		wb.write(response.getOutputStream());
//		new ExcelExporter().exportHtml(excel_data, response.getOutputStream());
		return;
	}
	
	/**
	 * ?????? ??????/????????? ?????????
	 * @return
	 */
	@RequestMapping(value="/before/list")
	public String before_list(Model model, HttpServletRequest request,
			@RequestParam(value="pageNumber", defaultValue="1")int pageNumber,
			@RequestParam(value="mode", defaultValue="0") int mode,
			@ModelAttribute(value="param") SearchParam param){
		
		model.addAttribute("mode", mode);
		model.addAttribute("param", param);
		
		List<ClassDate> classDate = classService.getAllClassDate();
		model.addAttribute("classDate", classDate);
		
		List<ClassInfo> mainClass = classService.getMainClass();
		model.addAttribute("mainClass", mainClass);
		
		String class_user_mode = Constant.ClassUserListMode.class_all.name();
		
		if(mode == 1)
			class_user_mode = Constant.ClassUserListMode.class_ok.name();
		
		ClassUserPagedList pagedList = classService.getBeforeClassUserPagedList(pageNumber, class_user_mode, param);
		if(pagedList != null){
			String baseUrlFormat = Util.getPagingBaseUrl("list", request.getQueryString(), pageNumber);
			Paging paging = pagedList.getPaging();
			paging.setBaseUrlFormat(baseUrlFormat);
			
			model.addAttribute("list", pagedList.getList());
			model.addAttribute("paging", paging);
		}
		
		return "admin/lecture/lecture-before";
	}
	
	@RequestMapping(value="/before/excel", method=RequestMethod.GET)
	public void before_excel(Model model, HttpServletResponse response,
			@RequestParam(value="mode", defaultValue="0") int mode,
			@ModelAttribute(value="param") SearchParam param) throws IOException {
		response.setHeader("Content-disposition", "attachment; filename=class_before.xls"); //target?????? ??????????????? ??????
		
		String class_user_mode = Constant.ClassUserListMode.class_all.name();
		if(mode == 1)
			class_user_mode = Constant.ClassUserListMode.class_ok.name();
		
		if(param.getDidx() <= 0) {
			List<ClassDate> classDate = classService.getAllClassDate();
			model.addAttribute("classDate", classDate);
			param.setDidx(classDate.get(0).getIdx_no());
		}
			
		List<ClassUser> list = classService.getBeforeClassList(class_user_mode, param);
		
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("?????????????????????") ;

		//iterating r number of rows
		HSSFRow row = sheet.createRow(0);
		row.createCell(0).setCellValue("????????????");
		row.createCell(1).setCellValue("?????????");
		row.createCell(2).setCellValue("????????????");
		row.createCell(3).setCellValue("????????????");
		row.createCell(4).setCellValue("????????????");
		row.createCell(5).setCellValue("????????????");
		row.createCell(6).setCellValue("??????");
		row.createCell(7).setCellValue("?????????");
		row.createCell(8).setCellValue("??????");
		row.createCell(9).setCellValue("??????");
		row.createCell(10).setCellValue("??????");
		row.createCell(11).setCellValue("??????");
		
		int idx = 1;
		for (ClassUser user : list)
		{
			row = sheet.createRow(idx++);
	
			//iterating c number of columns

				row.createCell(0).setCellValue(user.getClassInfo().getB_cate_name());
				row.createCell(1).setCellValue(user.getClassInfo().getClass_name());
				row.createCell(2).setCellValue(user.getClassInfo().getClass_time());
				if("01".equals(user.getEm_type()))
					row.createCell(3).setCellValue("?????????");
				else if("02".equals(user.getEm_type()))
					row.createCell(3).setCellValue("?????????");
				else if("03".equals(user.getEm_type()))
					row.createCell(3).setCellValue("????????????");
				
				row.createCell(4).setCellValue(user.getO_name());
				row.createCell(5).setCellValue(user.getHp());
				row.createCell(6).setCellValue(user.getE_no());
				row.createCell(7).setCellValue(user.getE_name());
				row.createCell(8).setCellValue(user.getPartname());
				row.createCell(9).setCellValue(user.getMem_type());
				row.createCell(10).setCellValue("1".equals(user.getGender()) ? "??????" : "??????");
				
				if("Y".equals(user.getClass_yn()))
					row.createCell(11).setCellValue("??????");
				else if("D".equals(user.getClass_yn()))
					row.createCell(11).setCellValue("??????");
				else
					row.createCell(11).setCellValue("??????");
		}
		
		wb.write(response.getOutputStream());
//		new ExcelExporter().exportHtml(excel_data, response.getOutputStream());
		return;
	}
	
}
