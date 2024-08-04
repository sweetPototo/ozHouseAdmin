package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.Admin_QA_DTO;
import com.oz.ozHouseAdmin.dto.Admin_reQA_DTO;


@Service
public class AdminBoardMapper {
	
	@Autowired
	private SqlSession sqlSession;

	public List<Admin_QA_DTO> adminQAList(Map<String, String> params) {
		return sqlSession.selectList("adminQAList", params);
	}
	public List<Admin_QA_DTO> adminContent(int admin_QA_num) {
		return sqlSession.selectList("adminContent", admin_QA_num);
	}
	public int adminReQa(Map<String, Object> map) {
		return sqlSession.insert("adminReQa", map);
	}
	public List<Admin_reQA_DTO> adminReContent(int admin_reQA_num) {
		return sqlSession.selectList("adminReContent", admin_reQA_num);
	}
	public int adminReQaUpdate(Admin_reQA_DTO dto) {
		return sqlSession.update("adminReQaUpdate", dto);
	}
	public int adminQAstate(int admin_QA_num) {
		return sqlSession.update("adminQAstate", admin_QA_num);
	}
	
	public int productqaCount(Map<String, String> map) {
		return sqlSession.selectOne("productqaCount",map);
	}
	

}
