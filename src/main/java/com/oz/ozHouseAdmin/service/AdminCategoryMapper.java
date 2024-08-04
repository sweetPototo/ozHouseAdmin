package com.oz.ozHouseAdmin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.CategoryDTO;

@Service
public class AdminCategoryMapper {
	@Autowired
	private SqlSession sqlSession;
	
	//ī�װ� ���
	public int cateInput(CategoryDTO dto) {
		return sqlSession.insert("cateInput", dto);
	}

	//ī�װ� ����Ʈ
	public List<CategoryDTO> cateList() {
		return sqlSession.selectList("cateList");
	}
	
	//ī�װ� ������
	public List<CategoryDTO> cateContent(int category_num) {
		return sqlSession.selectList("cateContent", category_num);
	}
	
	//ī�װ� ����
	public int cateUpdate(CategoryDTO dto) {
		return sqlSession.update("cateUpdate", dto);
	}
	

}
