package com.oz.ozHouseAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oz.ozHouseAdmin.dto.MerchantDTO;
import com.oz.ozHouseAdmin.bean.MemberFind;
import com.oz.ozHouseAdmin.bean.AdminLoginBean;
import com.oz.ozHouseAdmin.dto.AdminDTO;
import com.oz.ozHouseAdmin.service.AdminMapper;
import com.oz.ozHouseAdmin.service.StoreAdminMapper;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private StoreAdminMapper storeAdminMapper;
	
	@RequestMapping(value="/admin_insert.do")
	public String adminInsertdo(HttpServletRequest req) {
		HttpSession session = req.getSession();
		AdminLoginBean loginOk = (AdminLoginBean)session.getAttribute("loginMember");
		if(loginOk == null) {
			req.setAttribute("msg", "로그인 후 이용가능합니다.");
			req.setAttribute("url", "admin_main.do");
			return "forward:message.jsp";
		}
		return "admin/adminManagement/admin_insert";
	}
	
	@RequestMapping(value="/admin_join.do")
	public String adminInsert(HttpServletRequest req, @ModelAttribute AdminDTO dto) {
		int res = adminMapper.insertAdmin(dto);
		
		if (res>0) {
			req.setAttribute("msg", "관리자가 추가되었습니다.");
			req.setAttribute("url", "admin_main.do");
		}else if (res<0){
			req.setAttribute("msg", "관리자 추가가 완료되지 않았습니다.");
			req.setAttribute("url", "admin_main.do");
		}
    	return "forward:message.jsp";
	}
	
	public boolean isValid(String str) {
        // 占쎌젟域뱀뮉紐댐옙�겱占쎈뻼占쎌뱽 占쎄텢占쎌뒠占쎈릭占쎈연 占쎌겫�눧占�, 占쎈떭占쎌쁽, - 占쎌굢占쎈뮉 _揶쏉옙 占쎈툡占쎈빒 �눧紐꾩쁽揶쏉옙 占쎈７占쎈맙占쎈┷占쎈선 占쎌뿳占쎈뮉筌욑옙 野껓옙占쎄텢
        return Pattern.matches("^[a-zA-Z0-9-_]*$", str);
    }
	
    @RequestMapping("/mer_checkId.do")
    @ResponseBody
    public String checkId(@RequestParam("admin_id") String id) {
        String result="N";
        if (adminMapper.checkMerId(id) != null) result = "Y"; 	// 占쎈툡占쎌뵠占쎈탵 占쎄텢占쎌뒠 �겫�뜃占쏙옙�뮟
        if (id.trim().equals("")) result = "E";					// 占쎈툡占쎌뵠占쎈탵 �뜮袁⑸선 占쎌뿳占쎌뱽 占쎈르
        if (id.length() < 5 || id.length() > 12) result = "L";	// length 占쎌궎�몴占�
        if (isValid(id) == false) result = "V";					// �눧紐꾩쁽占쎈였 野껓옙占쎄텢
        return result;
    }
    
    @RequestMapping(value="/admin_list.do")
    public String adminList(HttpServletRequest req) {
    	List<AdminDTO> list = adminMapper.allAdmin();
		req.setAttribute("admin", list);
		return "admin/adminManagement/admin_list";
    }
    
    @RequestMapping(value="/merchant_login.do", method=RequestMethod.GET)
	public String login() {
		return "admin/admin_manage";
	}
    
	@RequestMapping(value="/merchant_login.do", method=RequestMethod.POST)
	public String loginOk(HttpServletRequest req, HttpServletResponse resp, 
			@ModelAttribute AdminLoginBean loginOk, @RequestParam(required=false) String saveId) {
		int res = loginOk.loginOk(adminMapper);
		String msg = null, url = null;
		switch(res){
		case AdminLoginBean.OK :
			Cookie ck = new Cookie("saveId", loginOk.getAdmin_id());
			if (saveId != null) {
				ck.setMaxAge(7*24*60*60);
			}else {
				ck.setMaxAge(0);
			}
			resp.addCookie(ck);
			HttpSession session = req.getSession();
			session.setAttribute("loginMember", loginOk);
			msg = loginOk.getAdmin_id() + "님, Oz의 집 관리자 페이지에 오신 것을 환영합니다.";
			url = "admin_main.do";
			break;
		case AdminLoginBean.NOT_ID :
			msg = "ID가 일치하지 않습니다.";
			break;
		case AdminLoginBean.NOT_PW :
			msg = "비밀번호가 일치하지 않습니다.";
			break;
		case AdminLoginBean.ERROR : 
			msg = "DB조회 시 오류가 발생하였습니다.";
			break;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
    	return "forward:message.jsp";
	}
    
    @RequestMapping(value="/merchant_logout.do")
    public String logout(HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	session.invalidate();
    	String msg = "로그아웃되었습니다.";
    	String url = "admin_main.do";
    	req.setAttribute("msg", msg);
    	req.setAttribute("url", url);
    	return "forward:message.jsp";
    }
    
    @RequestMapping(value="/admin_delete.do")
    public String adminDelete(HttpServletRequest req, String admin_num) {
    	int res = adminMapper.adminDelete(admin_num);
    	if(res>0) {
    		req.setAttribute("msg", "관리자가 삭제되었습니다.");
    		req.setAttribute("url", "admin_list.do");
    	}else {
    		req.setAttribute("msg", "관리자 삭제가 완료되지 않았습니다.");
    		req.setAttribute("url", "admin_list.do");
    	}
    	return "forward:message.jsp";
    }
    
    @RequestMapping(value="/admin_update.do", method=RequestMethod.GET)
    public String adminUpdate(HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	AdminLoginBean loginOk = (AdminLoginBean)session.getAttribute("loginMember");
    	AdminDTO dto = adminMapper.checkMerId(loginOk.getAdmin_id());
    	req.setAttribute("adminUpdate", dto);
    	return "admin/adminManagement/admin_update";
    }
    
    @RequestMapping(value="/admin_update.do", method=RequestMethod.POST)
    public String adminUpdateOk(HttpServletRequest req, @ModelAttribute AdminDTO dto,
    		String mode) {
    	if(mode.equals("inform")) {
	    	HttpSession session = req.getSession();
	    	session.setAttribute("adminUpdate", dto);
    	}
    	req.setAttribute("mode", mode);
    	return "admin/adminManagement/admin_adminOk";
    }
    
    @RequestMapping(value="/admin_update_check.do")
    public String adminUpdateCheck(HttpServletRequest req, @RequestParam Map<String, String> map) {
		if(map.get("mode").equals("inform")) {
			return "admin/adminManagement/admin_updateForm";
		}else {
			return "admin/adminManagement/admin_updatePass";
		}
    }
    
    @RequestMapping(value="/admin_updateOk.do")
    public String adminUpdateOk(HttpServletRequest req, @ModelAttribute AdminDTO dto) {
    	int res = adminMapper.adminUpdate(dto);
    	if(res>0) {
    		req.setAttribute("msg", "정보수정이 완료되었습니다.");
    		req.setAttribute("url", "admin_update.do");
    	}else {
    		req.setAttribute("msg", "정보수정이 완료되지 않았습니다.");
    		req.setAttribute("url", "admin_update.do");
    	}
    	return "forward:message.jsp";
    }
    
    @RequestMapping(value="/admin_updatePass.do", method=RequestMethod.POST)
	public String myInformUpdatePassOk(HttpServletRequest req, @RequestParam Map<String, String> map) {
		int res = adminMapper.updatePass(map);
		String msg = null, url = "admin_update.do";
		if(res>0) {
			msg = "비밀번호가 변경되었습니다.";
		}else {
			msg = "비밀번호 변경이 완료되지 않았습니다.";
		}
		HttpSession session = req.getSession();
		AdminLoginBean loginOk = (AdminLoginBean)session.getAttribute("loginMember");
		loginOk.setAdmin_pw(map.get("admin_pw"));
		session.setAttribute("loginMember", loginOk);
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "forward:message.jsp";
	}
    
    //�븘�씠�뵒, 鍮꾨�踰덊샇 李얘린
    @RequestMapping(value="/admin_find.do", method=RequestMethod.GET)
   	public String searchMember() {
   		return "admin/join/admin_find";
   	}
       
    // �씠硫붿씪 �삎�떇 寃�利�
       private static final String EMAIL_REGEX =
               "^[a-zA-Z0-9_+&*-]+(?:\\." +
               "[a-zA-Z0-9_+&*-]+)*@" +
               "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
               "A-Z]{2,7}$";
       
       public static boolean isValidEmail(String email) {
           Pattern pattern = Pattern.compile(EMAIL_REGEX);
           Matcher matcher = pattern.matcher(email);
           return matcher.matches();
       }
       
       @RequestMapping(value="/admin_send_find_email.do", method=RequestMethod.POST)
   	public String sendEmail1(HttpServletRequest req, String admin_email) {
       	String mer_id = adminMapper.checkMerchantIdEmail(admin_email);
       	if (mer_id == null) {
	         req.setAttribute("msg", "관리자로 지정되지 않은 E-mail 주소입니다.");
	         req.setAttribute("url", "admin_find.do");
	         return "forward:message.jsp";
	    }
       	int oauthNum = MemberFind.sendEmailCheck(admin_email, mer_id);
       	req.setAttribute("oauthNum", oauthNum);
       	req.setAttribute("member_email", admin_email);
   		return "admin/join/admin_send_find_email";
       }
       
       @RequestMapping(value="/admin_find.do", method=RequestMethod.POST)
   	public String searchMember(HttpServletRequest req, String admin_email) {
    	   System.out.println("mer_email : " + admin_email);
   		String member_id = adminMapper.checkMerchantIdEmail(admin_email);
   		
   		int oauthNum = Integer.parseInt(req.getParameter("oauthNum"));
   		int userSendNum = Integer.parseInt(req.getParameter("userSendNum"));
   		
   		if (oauthNum == userSendNum) {
   			req.setAttribute("msg", "비밀번호를 재설정합니다.");
   			req.setAttribute("url", "admin_changePass.do?mode=find&id=" + member_id);
   		}else {
   			req.setAttribute("msg", "인증번호가 일치하지 않습니다. 다시 진행하여 주십시오.");
   			req.setAttribute("url", "admin_find.do");
   		}
   		
   		return "forward:message.jsp";
   	}
       
       @RequestMapping(value = "admin_changePass.do", method = RequestMethod.GET)
       public String mypage_updatePasswd(HttpServletRequest req) {
       	String mode = req.getParameter("mode");
       	
       	if (mode != null) {
       		req.setAttribute("mode", "find");
       		req.setAttribute("member_id", req.getParameter("id"));
       	}
           return "admin/join/admin_changePass";
       }
       
       private AdminDTO getMember(HttpServletRequest req) {
       	HttpSession session = req.getSession();
       	AdminLoginBean loginMember = (AdminLoginBean)session.getAttribute("loginMember");
        AdminDTO dto = adminMapper.checkMerId(loginMember.getAdmin_id());
       	return dto;
       }
       
       @RequestMapping(value = "admin_changePass.do", method = RequestMethod.POST)
       public String mypage_updatePasswdPro(HttpServletRequest req) {
       	AdminDTO dto = new AdminDTO();
       	String mode = req.getParameter("mode");
       	String id = req.getParameter("member_id");
       	String new_pass = req.getParameter("new_member_passwd");
       	
           boolean passwd = false;
           
           if (!mode.equals("find")) {
           	dto = getMember(req);
               String old_pass = req.getParameter("member_passwd");
           	//passwd = passwordEncoder.matches(old_pass, dto.getMember_passwd());
           }else if(mode.equals("find")) {
           	passwd = true;
           	dto.setAdmin_id(id);
           }
       	
       	if (passwd) {
       		dto.setAdmin_passwd(new_pass);
       		Map <String, String> map = new HashMap<String, String>();
       		map.put("mer_id", dto.getAdmin_id());
       		map.put("mer_pw", dto.getAdmin_passwd());
           	int res = adminMapper.updatePass(map);
       		if (res>0) {
       			req.setAttribute("msg", "비밀번호 재설정이 완료되었습니다. 로그인을 진행해 주세요.");
       			req.setAttribute("url", "admin_main.do");
       		}else if (res<0){
       			req.setAttribute("msg", "비밀번호가 재설정되지 않았습니다.");
       			req.setAttribute("url", "admin_main.do");
       		}
       	}else {
       		req.setAttribute("msg", "비밀번호가 재설정되지 않았습니다.");
   			req.setAttribute("url", "admin_main.do");
       	}
       	
           return "forward:message.jsp";
       }

}
