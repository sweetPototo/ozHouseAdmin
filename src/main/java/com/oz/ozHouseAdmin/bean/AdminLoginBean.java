package com.oz.ozHouseAdmin.bean;

import com.oz.ozHouseAdmin.dto.AdminDTO;
import com.oz.ozHouseAdmin.service.AdminMapper;

public class AdminLoginBean {
	private int admin_num;
	private String admin_id;
	private String admin_pw;
	
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	public int getAdmin_num() {
		return admin_num;
	}

	public void setAdmin_num(int admin_num) {
		this.admin_num = admin_num;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public int loginOk(AdminMapper adminMapper) {
		try {
			
			AdminDTO dto = adminMapper.checkMerId(admin_id);
			admin_num = dto.getAdmin_num();
			if (dto != null) {
				if(dto.getAdmin_passwd().trim().equals(admin_pw)) {
					return OK;
				}else {
					return NOT_PW;
				}
			}else {
				return NOT_ID;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
