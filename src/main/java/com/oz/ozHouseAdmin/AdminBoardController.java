package com.oz.ozHouseAdmin;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oz.ozHouseAdmin.service.AdminBoardMapper;
import com.oz.ozHouseAdmin.bean.AdminLoginBean;
import com.oz.ozHouseAdmin.dto.Admin_QA_DTO;
import com.oz.ozHouseAdmin.dto.Admin_reQA_DTO;

@Controller
public class AdminBoardController {
	
	@Autowired
	private AdminBoardMapper adminboardMapper;
	
	@RequestMapping("/board_admin.do")
	public String productBoard(HttpServletRequest req, @RequestParam Map<String, String> params) {
		HttpSession session = req.getSession();
		AdminLoginBean loginOk = (AdminLoginBean)session.getAttribute("loginMember");
		if(loginOk == null) {
			req.setAttribute("msg", "로그인 후 사용가능합니다.");
			req.setAttribute("url", "admin_main.do");
			return "forward:message.jsp";
		}
		List<Admin_QA_DTO> list = adminboardMapper.adminQAList(params); 
		int productqaCount = adminboardMapper.productqaCount(params);
		req.setAttribute("adminQAList", list);
		req.setAttribute("productqaCount", productqaCount);
		return "admin/board/board_list";
	}
	@RequestMapping("/admin_qa_content.do")
	public String adminContent(HttpServletRequest req, int admin_QA_num) {
		List<Admin_QA_DTO> list = adminboardMapper.adminContent(admin_QA_num);
		List<Admin_reQA_DTO> list2 = adminboardMapper.adminReContent(admin_QA_num);
	    req.setAttribute("adminContent", list);
	    req.setAttribute("adminReContent", list2);
	    req.setAttribute("admin_QA_num", admin_QA_num);
		return "admin/board/board_content";
	}
	@RequestMapping(value="/admin_reqa.do", method=RequestMethod.GET)
	public String adminReQA(HttpServletRequest req, @RequestParam("admin_QA_num") int adminQANum) {
		List<Admin_QA_DTO> list = adminboardMapper.adminContent(adminQANum);
	    req.setAttribute("adminContent", list);
		req.setAttribute("admin_QA_num", adminQANum);
		return "admin/board/board_write";
	}
	@RequestMapping(value="/admin_reqa.do", method=RequestMethod.POST)
	public String adminReQA(HttpServletRequest req, HttpServletResponse resp,@RequestParam Map<String, Object> params) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int res = adminboardMapper.adminReQa(params);
		int adminQANum = Integer.parseInt(req.getParameter("admin_QA_num"));
		if (res>0) {
			int updateRes = adminboardMapper.adminQAstate(adminQANum);
			req.setAttribute("msg", "답변 등록에 성공했습니다.");
			req.setAttribute("url", "admin_qa_content.do?admin_QA_num="+adminQANum);
		}else {
			req.setAttribute("msg", "답변 등록에 실패했습니다. 다시 시도해주세요.");
			req.setAttribute("url", "admin_qa_content.do?admin_QA_num="+adminQANum);
		}
		return "forward:message.jsp";
	}
	@RequestMapping(value="/admin_reqa_update.do", method=RequestMethod.GET)
	public String adminReQAModify(HttpServletRequest req, int admin_reQA_num) {
		List<Admin_QA_DTO> list = adminboardMapper.adminContent(admin_reQA_num);
	    req.setAttribute("adminContent", list);
		List<Admin_reQA_DTO> dto = adminboardMapper.adminReContent(admin_reQA_num);
		req.setAttribute("adminReContent", dto);
		return "admin/board/board_update";
	}
	@RequestMapping(value="/admin_reqa_update.do", method=RequestMethod.POST)
	public String adminReQAModify(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute Admin_reQA_DTO dto, int admin_reQA_num) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println(admin_reQA_num);
		System.out.println(dto.getAdmin_reQA_num());
		int res = adminboardMapper.adminReQaUpdate(dto);
		if (res>0) {
			req.setAttribute("msg", "답변 수정에 성공했습니다.");
			req.setAttribute("url", "admin_qa_content.do?admin_QA_num="+dto.getAdmin_reQA_num());
		}else {
			req.setAttribute("msg", "답변 수정에 실패했습니다. 다시 시도해주세요.");
			req.setAttribute("url", "admin_reqa_update.do?admin_reQA_num="+dto.getAdmin_reQA_num());
		}
		return "forward:message.jsp";
	}

}
