package com.oz.ozHouseAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oz.ozHouseAdmin.dto.CategoryDTO;
import com.oz.ozHouseAdmin.dto.AdminDTO;
import com.oz.ozHouseAdmin.dto.MerchantDTO;
//import com.oz.ozHouseAdmin.dto.MerchantDTO;
import com.oz.ozHouseAdmin.dto.StoreListDTO;
import com.oz.ozHouseAdmin.service.StoreAdminMapper;

@Controller
public class StoreAdminController {

	@Autowired
	private StoreAdminMapper storeAdminMapper;
	
	@RequestMapping(value="/storeList_list.do")
	public String storeAdminList(HttpServletRequest req, String like) {
		List<StoreListDTO> list = null;
		if(like.equals("all")) {
			list = storeAdminMapper.selectMerchant();
		}else if(like.equals("applicate")) {
			list = storeAdminMapper.selectMerchantApplicate();
		}else if(like.equals("complete")){
			list = storeAdminMapper.selectMerchantComplete();
		}else {
			list = storeAdminMapper.selectMerchantDelete();
		}
		int allStoreCount = storeAdminMapper.selectAllStore();
		int appliStoreCount = storeAdminMapper.selectAppliStoreCount();
		int completeStoreCount = storeAdminMapper.selectCompleteStoreCount();
		int deleteStoreCount = storeAdminMapper.selectDeleteStoreCount();
		req.setAttribute("allStoreCount", allStoreCount);
		req.setAttribute("appliStoreCount", appliStoreCount);
		req.setAttribute("completeStoreCount", completeStoreCount);
		req.setAttribute("deleteStoreCount", deleteStoreCount);
		req.setAttribute("like", like);
		req.setAttribute("storeList", list);
		return "admin/storeAdmin/storeList/storeList_list";
	}
	
	@RequestMapping(value="/storeList_detail.do")
	public String storeListDetail(HttpServletRequest req, 
			@RequestParam Map<String, String> map) {
		StoreListDTO dto = storeAdminMapper.merchantDetail(map.get("mer_num"));
		String resultCate = null;
		if(dto.getInbrand_category()==null) {
			resultCate = "미등록";
		}else {
			String cate[] = dto.getInbrand_category().split(",");
			String category[] = new String[cate.length];
			for(int i=0; i<category.length; ++i) {
				category[i] = storeAdminMapper.selectCateName(Integer.valueOf(cate[i]));
			}
			resultCate = String.join(",", category);
		}
		req.setAttribute("resultCate", resultCate);
		req.setAttribute("dto", dto);
		req.setAttribute("like", map.get("like"));
		return "admin/storeAdmin/storeList/storeList_detail";
	}
	
	@RequestMapping(value="/storeList_listSearch.do", method=RequestMethod.POST)
	public String couponListSearch(@RequestParam Map<String, String> map, HttpServletRequest req) {
		if(map.get("startDate").equals("") && map.get("endDate").equals("")) {
			map.put("startDate", null);
			map.put("endDate", null);
		}
		if(map.get("date").equals("mer_joindate")) {
			map.put("date", "m.mer_joindate");
		}else if(map.get("date").equals("inbrand_applicationdate")) {
			map.put("date", "i.inbrand_applicationdate");
		}else if(map.get("date").equals("inbrand_canceldate")) {
			map.put("date", "i.inbrand_canceldate");
		}else {
			map.put("date", "m.mer_inbranddate");
		}
		List<StoreListDTO> list;
		list = storeAdminMapper.searchStoreList(map);
		req.setAttribute("storeList", list);
		req.setAttribute("like", map.get("like"));
		return "admin/storeAdmin/storeList/storeList_list";
	}
	
	//상점 승인
	@RequestMapping(value="/storeList_adminOk.do", method=RequestMethod.POST)
	public String deleteStoreFormPost(HttpServletRequest req,
			@RequestParam Map<String, String> map, @ModelAttribute MerchantDTO dto) {
		
		if(map.get("mode").equals("approve")) {
			HttpSession session = req.getSession();
			session.setAttribute("inbrandMerchant", dto);
			MerchantDTO m = (MerchantDTO)session.getAttribute("inbrandMerchant");
		}
		req.setAttribute("mode", map.get("mode"));  //mer_num, mode
		req.setAttribute("mer_num", map.get("mer_num"));
			return "admin/storeAdmin/storeList/storeList_adminOk";
	}
	
	@RequestMapping(value="/storeList_adminOk_check.do")
	public String deleteStoreFormOK(HttpServletRequest req, 
			@RequestParam Map<String, String> map) {
		String msg = null, url = null;
		AdminDTO admin = storeAdminMapper.searchAdmin(map.get("admin_num"));
		if(!admin.getAdmin_id().equals(map.get("admin_id")) 
				&& !admin.getAdmin_passwd().equals(map.get("admin_passwd"))) {
			msg = "로그인 정보와 일치하지 않습니다.";
			url = "storeList_adminOk.do?mer_num=" + map.get("mer_num") 
				+ "&mode=" + map.get("mode");
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "forward:message.jsp";
		}
		if(map.get("mode").equals("delete")) {
			int res = storeAdminMapper.admindeleteOk(map.get("mer_num"));
			if(res>0) {
				msg = "상점이 사용중지 되었습니다.";
				url = "storeList_list.do?like='all";
				
			}else {
				msg = "상점 사용중지 중 오류가 발생하였습니다.";
				url = "storeList_list.do?like='all";
			}
		}else if(map.get("mode").equals("cancel")){
			int res = storeAdminMapper.admincancelOk(map.get("mer_num"));
			if(res>0) {
				msg = "입점이 거절되었습니다.";
				url = "storeList_list.do?like='all";
				
			}else {
				msg = "입점 거절 중 오류가 발생하였습니다.";
				url = "storeList_list.do?like='all";
			}
		}else {
			int res = storeAdminMapper.adminapproveOk(map.get("mer_num"));
			if(res>0) {
				HttpSession session = req.getSession();
				MerchantDTO dto = (MerchantDTO)session.getAttribute("inbrandMerchant");
				int update = storeAdminMapper.updateStore(dto);
				msg = "입점이 승인되었습니다.";
				url = "storeList_detail.do?mer_num=" + map.get("mer_num");
			}else {
				msg = "입점 승인중 오류가 발생하였습니다.";
				url = "storeList_detail.do?mer_num=\" + map.get(\"mer_num\")";
			}
		}
		req.setAttribute("like", "all");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "forward:message.jsp";
	}
}
