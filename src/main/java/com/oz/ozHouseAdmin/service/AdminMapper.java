package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.AdminDTO;

@Service
public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertAdmin(AdminDTO dto) {
		return sqlSession.insert("insertAdmin", dto);
	}
	
	public AdminDTO checkMerId(String admin_id) {
        return sqlSession.selectOne("checkMerId", admin_id);
    }
	
	public List<AdminDTO> allAdmin(){
		return sqlSession.selectList("allAdmin");
	}
	
	public int adminDelete(String admin_num) {
		return sqlSession.delete("adminDelete", admin_num);
	}
	
	public int adminUpdate(AdminDTO dto) {
		return sqlSession.update("adminUpdate", dto);
	}
	
	public int updatePass(Map<String, String> map) {
		return sqlSession.update("updatePass",map);
	}
	
	public String checkMerchantIdEmail(String admin_email) {
		return sqlSession.selectOne("checkMerchantIdEmail", admin_email);
	}
}
