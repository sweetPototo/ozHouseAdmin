package com.oz.ozHouseAdmin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oz.ozHouseAdmin.bean.AdminLoginBean;
import com.oz.ozHouseAdmin.dto.MemberDTO;
import com.oz.ozHouseAdmin.service.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping(value="/member_list.do")
	public String memberList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		AdminLoginBean loginOk = (AdminLoginBean)session.getAttribute("loginMember");
		if(loginOk == null) {
			req.setAttribute("msg", "로그인을 진행하신 후 이용하여주시기 바랍니다.");
			req.setAttribute("url", "admin_main.do");
			return "forward:message.jsp";
		}
		List<MemberDTO> list = memberMapper.allMember();
		int count = memberMapper.countMember();
		req.setAttribute("setting", settinOption("all"));
		req.setAttribute("member", list);
		req.setAttribute("allCount", count);
		return "admin/memberAdmin/memberAdmin_list";
	}
	
	@RequestMapping(value="/member_listSearch.do", method=RequestMethod.POST)
	public String memberListSearch(HttpServletRequest req, @RequestParam Map<String, String> map) {
		if((map.get("startDate") == null || map.get("startDate").equals("")) && 
			    (map.get("endDate") == null || map.get("endDate").equals(""))) {
			map.put("startDate", null);
			map.put("endDate", null);
		}
		List<MemberDTO> list;
		list = memberMapper.searchMemberList(map);
		int count = memberMapper.countMember();
		req.setAttribute("setting", settinOption(map.get("search")));
		req.setAttribute("map", map);
		req.setAttribute("member", list);
		req.setAttribute("allCount", count);
		return "admin/memberAdmin/memberAdmin_list";
	}
	
	@RequestMapping(value="/memberAdmin_detail.do")
	public String memberView(HttpServletRequest req, String member_num) {
		MemberDTO dto = memberMapper.getMember(member_num);
		req.setAttribute("dto", dto);
		return "admin/memberAdmin/memberAdmin_detail";
	}
	
	private String settinOption(String search) {
		String options = "";
		if(search.equals("all")) {
			options = "<option value=\"all\" selected='selected'>전체</option>"
				 	+ "<option value=\"member_id\">회원ID</option>\n"
				 	+ "<option value=\"member_num\">회원번호</option>\n"
				 	+ "<option value=\"member_level\">회원등급</option>\n"
				 	+ "<option value=\"member_name\">회원이름</option>\n"
				 	+ "<option value=\"member_nickname\">닉네임</option>";
		}else if(search.equals("member_id")) {
			options = "<option value=\"all\">전체</option>"
				 	+ "<option value=\"member_id\" selected='selected'>회원ID</option>\n"
				 	+ "<option value=\"member_num\">회원번호</option>\n"
				 	+ "<option value=\"member_level\">회원등급</option>\n"
				 	+ "<option value=\"member_name\">회원이름</option>\n"
				 	+ "<option value=\"member_nickname\">닉네임</option>";
		}else if(search.equals("member_num")) {
			options = "<option value=\"all\">전체</option>"
				 	+ "<option value=\"member_id\">회원ID</option>\n"
				 	+ "<option value=\"member_num\" selected='selected'>회원번호</option>\n"
				 	+ "<option value=\"member_level\">회원등급</option>\n"
				 	+ "<option value=\"member_name\">회원이름</option>\n"
				 	+ "<option value=\"member_nickname\">닉네임</option>";
		}else if(search.equals("member_level")) {
			options = "<option value=\"all\">전체</option>"
				 	+ "<option value=\"member_id\">회원ID</option>\n"
				 	+ "<option value=\"member_num\">회원번호</option>\n"
				 	+ "<option value=\"member_level\" selected='selected'>회원등급</option>\n"
				 	+ "<option value=\"member_name\">회원이름</option>\n"
				 	+ "<option value=\"member_nickname\">닉네임</option>";
		}else if(search.equals("member_name")) {
			options = "<option value=\"all\">전체</option>"
				 	+ "<option value=\"member_id\">회원ID</option>\n"
				 	+ "<option value=\"member_num\">회원번호</option>\n"
				 	+ "<option value=\"member_level\">회원등급</option>\n"
				 	+ "<option value=\"member_name\" selected='selected'>회원이름</option>\n"
				 	+ "<option value=\"member_nickname\">닉네임</option>";
		}else if(search.equals("member_nickname")) {
			options = "<option value=\"all\">전체</option>"
				 	+ "<option value=\"member_id\">회원ID</option>\n"
				 	+ "<option value=\"member_num\">회원번호</option>\n"
				 	+ "<option value=\"member_level\">회원등급</option>\n"
				 	+ "<option value=\"member_name\">회원이름</option>\n"
				 	+ "<option value=\"member_nickname\" selected='selected'>닉네임</option>";
		}
		return options;
	}

}
