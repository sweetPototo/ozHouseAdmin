package com.oz.ozHouseAdmin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.oz.ozHouseAdmin.dto.Mer_CouponListDTO;
import com.oz.ozHouseAdmin.dto.MsgDTO;
import com.oz.ozHouseAdmin.service.CouponMapper;

@Controller
public class CouponController {
	

	@Autowired
	private CouponMapper couponMapper;
	
	@RequestMapping(value="/coupon_list.do", method=RequestMethod.GET)
	public String couponList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<Mer_CouponListDTO> list = couponMapper.selectCoupon();
		int allCount = couponMapper.allCount();
		int appliCount = couponMapper.appliCount();
		int completeCount = couponMapper.completeCount();
		session.setAttribute("allCount", allCount);
		session.setAttribute("appliCount", appliCount);
		session.setAttribute("completeCount", completeCount);
		req.setAttribute("coupon", list);
		return "admin/storeAdmin/coupon/coupon_list";
	}
	
	@RequestMapping(value="/coupon_listSearch.do", method=RequestMethod.POST)
	public String couponListSearch(@RequestParam Map<String, String> map, HttpServletRequest req) {
		if(map.get("startDate").equals("") && map.get("endDate").equals("")) {
			map.put("startDate", null);
			map.put("endDate", null);
		}
		if(map.get("searchString")==null || map.get("searchString").equals("")) {
			map.put("searchString", null);
		}
		
		List<Mer_CouponListDTO> list;
		list = couponMapper.searchCouponList(map);
		req.setAttribute("coupon", list);
		return "admin/storeAdmin/coupon/coupon_list";
	}
	
	@RequestMapping(value="/coupon_detail.do", method=RequestMethod.GET)
	public String couponDetail(HttpServletRequest req, int mer_couponnum) {
		Mer_CouponListDTO dto = couponMapper.couponDetail(mer_couponnum);
		req.setAttribute("coupon", dto);
		return "admin/storeAdmin/coupon/coupon_detail";
	}
	
	@RequestMapping(value="/coupon_detail.do", method=RequestMethod.POST) 
	public String couponImgInput(HttpServletRequest req, int mer_couponnum) {
        String msg = null;
	    String url = "coupon_detail.do?mer_couponnum=" + mer_couponnum;
        
        int res = couponMapper.inputImg(mer_couponnum);
	    if(res>0) {
	    	msg = "쿠폰이 승인되었습니다.";
	    }else {
	    	msg = "쿠폰 승인을 실패하였습니다.";
	    }
        req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "forward:message.jsp";	
	
	}
	
	@RequestMapping(value="/coupon_cancel.do")
	public String brandCancel(HttpServletRequest req, int mer_couponnum, @ModelAttribute MsgDTO dto) {
		int res = couponMapper.couponCancelUpdate(mer_couponnum);
		String msg = null;
		String url = null;
		int msgRes = couponMapper.msgin_cou(dto);
		if (res > 0 && msgRes>0) {
			msg = "승인이 취소되었습니다.";
			url = "coupon_list.do";
		}else {
			msg = "승인취소를 실패하였습니다.";
			url = "coupon_detail.do?mer_couponnum=" + mer_couponnum;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "forward:message.jsp";
	}
	
	@RequestMapping(value="/coupon_delete.do")
	public ModelAndView couponDelete(HttpServletRequest req, @RequestParam Map<String, String> map) {
		int res = couponMapper.couponDelete(map.get("mer_couponnum"));
		ModelAndView mav = new ModelAndView("forward:message.jsp");
		String msg = null;
		String url = "coupon_list.do";
		if (res > 0) {
			msg = "쿠폰삭제가 완료되었습니다.";
		}else {
			msg = "쿠폰삭제를 실패햐였습니다.";
		}
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
}
