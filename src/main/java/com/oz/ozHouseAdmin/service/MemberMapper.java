package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.MemberDTO;

@Service
public class MemberMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<MemberDTO> allMember(){
		return sqlSession.selectList("allMember");
	}
	
	public int countMember() {
		return sqlSession.selectOne("countMember");
	}
	
	public MemberDTO getMember(String member_num) {
		return sqlSession.selectOne("getMember", member_num);
	}
	
	public List<MemberDTO> searchMemberList(Map<String, String> map){
		return sqlSession.selectList("searchMemberList", map);
	}
}
