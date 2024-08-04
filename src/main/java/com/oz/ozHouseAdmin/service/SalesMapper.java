package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.ListDTO;

@Service
public class SalesMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ListDTO> selectListDay(Map<String, String> map){
		if(map.get("searchString") != null) {
			map.put("searchString", "%" + map.get("searchString") + "%");
		}
		List<ListDTO> list = sqlSession.selectList("selectListDay", map);
		return list;
	}
	
	public List<ListDTO> selectListMonth(Map<String, String> map){
		List<ListDTO> list = sqlSession.selectList("selectListMonth", map);
		return list;
	}
	
	public List<ListDTO> selectListYear(Map<String, String> map){
		List<ListDTO> list = sqlSession.selectList("selectListYear", map);
		return list;
	}
	public String month() {
		return sqlSession.selectOne("month");
	}
	public String year() {
		return sqlSession.selectOne("year");
	}
}
