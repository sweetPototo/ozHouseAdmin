package com.oz.ozHouseAdmin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oz.ozHouseAdmin.bean.AdminLoginBean;
import com.oz.ozHouseAdmin.dto.CategoryDTO;
import com.oz.ozHouseAdmin.service.AdminCategoryMapper;

@Controller
public class AdminCategoryController {
	
	@Autowired
	private AdminCategoryMapper admincategoryMapper;
	
	//카占쌓곤옙 占쏙옙占쏙옙트
	@RequestMapping("/category_admin.do")
	public String categoryAdmin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		AdminLoginBean loginOk = (AdminLoginBean)session.getAttribute("loginMember");
		if(loginOk == null) {
			req.setAttribute("msg", "로그인 후 사용가능합니다.");
			req.setAttribute("url", "admin_main.do");
			return "forward:message.jsp";
		}
		List<CategoryDTO> list = admincategoryMapper.cateList();
		req.setAttribute("cateList", list);
		return "admin/category/category_list";
	}
	
	//카占쌓곤옙 占쏙옙占�
	@RequestMapping(value="/admin_cate_input.do", method=RequestMethod.GET)
	public String cateInput(HttpServletRequest req) {
		return "admin/category/category_input";
	}
	
	//카占쌓곤옙 占쏙옙占�
	@RequestMapping(value="/admin_cate_input.do", method=RequestMethod.POST)
	public String cateInput(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute CategoryDTO dto) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int res = admincategoryMapper.cateInput(dto);
		if (res > 0) {
			String msg = "카테고리 등록에 성공했습니다.";
			String url = "category_admin.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}else {
			String msg = "카테고리 등록에 실패했습니다.";
			String url = "admin_cate_input.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}
		return "forward:message.jsp";
	}
	
	//카占쌓곤옙 占쏙옙占쏙옙
	@RequestMapping(value="/admin_cate_update.do", method=RequestMethod.GET)
	public String cateUpdate(HttpServletRequest req, int category_num) {
		List<CategoryDTO> list = admincategoryMapper.cateContent(category_num);
		req.setAttribute("cateContent", list); 
		return "admin/category/category_update";
	}
	
	//카占쌓곤옙 占쏙옙占쏙옙
	@RequestMapping(value="/admin_cate_update.do", method=RequestMethod.POST)
	public String cateUpdate(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute CategoryDTO dto) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int res = admincategoryMapper.cateUpdate(dto);
		if (res > 0) {
			String msg = "카테고리 수정에 성공했습니다.";
			String url = "category_admin.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}else {
			String msg = "카테고리 수정에 실패했습니다.";
			String url = "admin_cate_update.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}
		return "forward:message.jsp";
	}
	

}
