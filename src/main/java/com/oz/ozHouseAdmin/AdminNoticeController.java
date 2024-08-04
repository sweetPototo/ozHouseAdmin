package com.oz.ozHouseAdmin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oz.ozHouseAdmin.dto.NoticeDTO;
import com.oz.ozHouseAdmin.service.AdminNoticeMapper;

@Controller
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeMapper adminnoticeMapper;
	
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙트
	@RequestMapping("/notice_admin.do")
	public String noticeAdmin(HttpServletRequest req) {
		List<NoticeDTO> list = adminnoticeMapper.noticeList();
		req.setAttribute("noticeList", list);
		return "admin/notice/notice_list";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏢세븝옙占쏙옙
	@RequestMapping("/admin_notice_content.do")
	public String noticeContent(HttpServletRequest req, int notice_num) {
		List<NoticeDTO> list = adminnoticeMapper.noticeContent(notice_num);
		req.setAttribute("noticeContent", list);
		return "admin/notice/notice_content";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占�
	@RequestMapping(value="/admin_notice_input.do", method=RequestMethod.GET)
	public String noticeInput(HttpServletRequest req) {
		return "admin/notice/notice_input";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占�
	@RequestMapping(value="/admin_notice_input.do", method=RequestMethod.POST)
	public String noticeInput(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute NoticeDTO dto) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int res = adminnoticeMapper.noticeInput(dto);
		if (res > 0) {
			String msg = "공지사항 등록에 성공했습니다.";
			String url = "notice_admin.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}else {
			String msg = "공지사항 등록에 실패했습니다. 다시 시도해주세요.";
			String url = "admin_notice_input.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}
		return "forward:message.jsp";
	}
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value="/admin_notice_update.do", method=RequestMethod.GET)
	public String noticeUpdate(HttpServletRequest req, int notice_num) {
		List<NoticeDTO> list = adminnoticeMapper.noticeContent(notice_num);
		req.setAttribute("noticeContent", list); 
		return "admin/notice/notice_update";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping(value="/admin_notice_update.do", method=RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest req, HttpServletResponse resp, @ModelAttribute NoticeDTO dto) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int res = adminnoticeMapper.noticeUpdate(dto);
		if (res > 0) {
			String msg = "공지사항 수정에 성공했습니다.";
			String url = "notice_admin.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}else {
			String msg = "공지사항 수정에 실패했습니다. 다시 시도해주세요.";
			String url = "admin_notice_update.do";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}
		return "forward:message.jsp";
	}
	
	//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	@RequestMapping("/admin_notice_delete.do")
	public String noticeDelete(HttpServletRequest req, int notice_num) {
		int res = adminnoticeMapper.noticeDelete(notice_num);
		String url = "notice_admin.do";
		if (res > 0) {
			String msg = "공지사항 삭제에 성공했습니다.";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}else {
			String msg = "공지사항 삭제에 실패했습니다. 다시 시도해주세요.";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
		}
		return "forward:message.jsp";
	}	
}
