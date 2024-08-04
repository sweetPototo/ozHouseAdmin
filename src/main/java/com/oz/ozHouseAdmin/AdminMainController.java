package com.oz.ozHouseAdmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	//main
	@RequestMapping(value= {"/", "/admin_main.do"})
	public String AdminmainHome() {
		return "admin/admin_manage";
	}
}
