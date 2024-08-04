package com.oz.ozHouseAdmin;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oz.ozHouseAdmin.dto.ListDTO;
import com.oz.ozHouseAdmin.service.SalesMapper;

@Controller
public class SalesController {

	@Autowired
	private SalesMapper salesMapper;
	
	private Calendar cal = Calendar.getInstance();
	
	@RequestMapping(value="/sales_list.do")
	public String salesList(@RequestParam Map<String, String> map, HttpServletRequest req) {
		List<ListDTO> list = null;
		//�씪蹂꾩“�쉶
		if(map.get("mode").equals("day")) {
			if(!map.containsKey("startDate") && !map.containsKey("endDate")) {
				String today = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH)+1) + "/" + cal.get(Calendar.DATE);
				today = today.substring(2);
				map.put("startDate", today);
				map.put("endDate", today);
			}
			try {
				if(map.get("searchString").equals("")) {
					map.put("searchString", null);
				}
			}catch (NullPointerException e) {
				map.put("searchString", null);
			}
			list = salesMapper.selectListDay(map);
		//�썡蹂꾩“�쉶
		}else if(map.get("mode").equals("month")) {
			Map options = selectMonth(map.get("sYear"), map.get("sMonth"),map.get("eYear"), map.get("eMonth"));  //jsp �꽭�똿
			Map date = settingMonth(map.get("sYear"), map.get("sMonth"),map.get("eYear"), map.get("eMonth"));		//query �꽭�똿
			map.put("startDate", (String)date.get("startDate"));
			map.put("endDate", (String)date.get("endDate"));
			list = salesMapper.selectListMonth(map);
			req.setAttribute("options", options);
		//�뿰蹂꾩“�쉶
		}else {
			Map options = selectYear(map.get("sYear"), map.get("eYear"));
			Map date = settingYear(map.get("sYear"),map.get("eYear"));
			map.put("startYear", (String)date.get("startYear"));
			map.put("endYear", (String)date.get("endYear"));
			list = salesMapper.selectListYear(map);
			req.setAttribute("options", options);
		}
		req.setAttribute("map", map);
		req.setAttribute("salesList", list);
		return "admin/storeAdmin/sales/sales_list";
	}
	
	//�궗�슜�옄 �꽑�깮 �뿰�룄, �궗�슜�옄 �꽑�깮 �썡 jsp�뙆�씪�뿉 �꽭�똿
	private Map selectMonth (String sYear, String sMonth, String eYear, String eMonth) {  
		Map <String, String> options = new HashMap<String, String>();
		int nowYear = cal.get(Calendar.YEAR);		//�쁽�옱�쓽 �뿰�룄 �꽕�젙
		int nowMonth = cal.get(Calendar.MONTH)+1;	//�쁽�옱�쓽 �썡 �꽕�젙
		String oldDate = salesMapper.month();
		int startYear = Integer.parseInt(oldDate.substring(0,2))+2000;
		int settingYear = startYear;
		int startMonth = Integer.parseInt(oldDate.substring(3));
		int endYear = nowYear;
		int endMonth = nowMonth;
		
		if(sYear != null && sMonth != null) {
			startYear = Integer.parseInt(sYear);	//�꽑�깮�썡�씠 �엳�쑝硫� int濡� 諛붽퓭二쇨린
			startMonth = Integer.parseInt(sMonth);
		}
		if(eYear != null && eMonth != null) {
			endYear = Integer.parseInt(eYear);	//�꽑�깮�썡�씠 �엳�쑝硫� int濡� 諛붽퓭二쇨린
			endMonth = Integer.parseInt(eMonth);
		}
		
		//option �꽑�깮�빐二쇰뒗 紐낅졊
		String syOptions = "";  //媛��옣 �삗�궇 �뿰�룄
		for(int year=settingYear; year<=nowYear; ++year) {
			if(sYear == null && year == startYear) {		//泥섏쓬 李쎌쓣 �뿴�뿀�쓣 �븣
				syOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else if(sYear != null && year == startYear) {
				syOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else {
				syOptions += "<option value ='" + year + "'>" + year + "년</option>";
			}
		}
		String smOptions = "";  //媛��옣 �삗�궇 �썡
		for(int month=1; month<=12; ++month) {
			if(sMonth == null && month == startMonth) {		//泥섏쓬 李쎌쓣 �뿴�뿀�쓣 �븣
				smOptions += "<option value ='" + month + "' selected='selected'>" + month + "�썡</option>";
			}else if(sMonth != null && month == startMonth) {
				smOptions += "<option value ='" + month + "' selected='selected'>" + month + "�썡</option>";
			}else {
				smOptions += "<option value ='" + month + "'>" + month + "�썡</option>";
			}
		}
		String eyOptions = "";  //媛��옣 理쒖떊 �뿰�룄
		for(int year=settingYear; year<=nowYear; ++year) {
			if(sYear == null && year == nowYear) {		//泥섏쓬 李쎌쓣 �뿴�뿀�쓣 �븣
				eyOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else if(sYear != null && year == endYear) {
				eyOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else {
				eyOptions += "<option value ='" + year + "'>" + year + "년</option>";
			}
		}
		String emOptions = "";  //媛��옣 理쒖떊 �썡
		for(int month=1; month<=12; ++month) {
			if(sMonth == null && month == nowMonth) {		//泥섏쓬 李쎌쓣 �뿴�뿀�쓣 �븣
				emOptions += "<option value ='" + month + "' selected='selected'>" + month + "�썡</option>";
			}else if(sMonth != null && month == endMonth) {
				emOptions += "<option value ='" + month + "' selected='selected'>" + month + "�썡</option>";
			}else {
				emOptions += "<option value ='" + month + "'>" + month + "�썡</option>";
			}
		}
		options.put("syOptions", syOptions);
		options.put("smOptions", smOptions);
		options.put("eyOptions", eyOptions);
		options.put("emOptions", emOptions);
		return options;
	}
		
	private Map selectYear (String sYear, String eYear) {  
		Map <String, String> options = new HashMap<String, String>();
		int nowYear = cal.get(Calendar.YEAR);		//�쁽�옱�쓽 �뿰�룄 �꽕�젙
		String oldDate = salesMapper.month();
		int startYear = Integer.parseInt(oldDate.substring(0,2))+2000;
		int settingsYear = startYear;
		int endYear = nowYear;
		
		if(sYear != null) {
			startYear = Integer.parseInt(sYear);	//�꽑�깮�썡�씠 �엳�쑝硫� int濡� 諛붽퓭二쇨린
		}
		if(eYear != null) {
			endYear = Integer.parseInt(eYear);	//�꽑�깮�썡�씠 �엳�쑝硫� int濡� 諛붽퓭二쇨린
		}
		String syOptions = "";  //媛��옣 �삗�궇 �뿰�룄
		for(int year=settingsYear; year<=nowYear; ++year) {
			if(sYear == null && year == startYear) {		//泥섏쓬 李쎌쓣 �뿴�뿀�쓣 �븣
				syOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else if(sYear != null && year == startYear) {
				syOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else {
				syOptions += "<option value ='" + year + "'>" + year + "년</option>";
			}
		}
		String eyOptions = "";  //媛��옣 理쒖떊 �뿰�룄
		for(int year=settingsYear; year<=nowYear; ++year) {
			if(sYear == null && year == nowYear) {		//泥섏쓬 李쎌쓣 �뿴�뿀�쓣 �븣
				eyOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else if(sYear != null && year == endYear) {
				eyOptions += "<option value ='" + year + "' selected='selected'>" + year + "년</option>";
			}else {
				eyOptions += "<option value ='" + year + "'>" + year + "년</option>";
			}
		}
		options.put("syOptions", syOptions);
		options.put("eyOptions", eyOptions);
		return options;
	}
	
	//�썡蹂꾩“�쉶�떆 議고쉶�븷 �뿰�룄,�썡 �꽭�똿 -> input 荑쇰━
		private Map settingMonth(String sYear, String sMonth, String eYear, String eMonth) {
			Map <String, String> date = new HashMap<String, String>();
			if(sYear==null&&sMonth==null&&eYear==null&&eMonth==null) {
				String oldDate = salesMapper.month();  // 寃곌낵媛� : 22/11
				String endYear = String.valueOf(cal.get(Calendar.YEAR)-2000);
				String endMonth = String.valueOf(cal.get(Calendar.MONTH)+1);
				if(endMonth.length()==1) endMonth = "0" + endMonth;
				date.put("startDate", oldDate);
				date.put("endDate", endYear + "/" + endMonth);
			}else {
				date.put("startDate", sYear.substring(2) + "/" + sMonth);
				date.put("endDate", eYear.substring(2) + "/" + eMonth);
			}
			return date;
		}
	
	//�뿰蹂꾩“�쉶�떆 議고쉶�븷 �뿰�룄 �꽭�똿 -> input 荑쇰━
	private Map settingYear(String sYear,String eYear) {
		Map <String, String> date = new HashMap<String, String>();
		if(sYear==null&&eYear==null) {
			String oldYear = salesMapper.month().substring(0,2);  // 寃곌낵媛� : 22
			String endYear = String.valueOf(cal.get(Calendar.YEAR)-2000);
			String endMonth = String.valueOf(cal.get(Calendar.MONTH)+1);
			if(endMonth.length()==1) endMonth = "0" + endMonth;
			date.put("startYear", oldYear);
			date.put("endYear", endYear);
		}else {
			date.put("startYear", sYear.substring(2));
			date.put("endYear", eYear.substring(2));
		}
		return date;
	}
}
