package com.oz.ozHouseAdmin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminManageMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//��ü count
	public int allCount(String product_approval_status) {
		return sqlSession.selectOne("allCount", product_approval_status);
	}
	
	//���δ�� count
	public int waitCount(String product_approval_status) {
		return sqlSession.selectOne("waitCount", product_approval_status);
	}
	
	//���κ��� count
	public int requestCount(String product_approval_status) {
		return sqlSession.selectOne("requestCount", product_approval_status);
	}
	
	//�����ݷ� count
	public int cancleCount(String product_approval_status) {
		return sqlSession.selectOne("cancleCount", product_approval_status);
	}

	//�Ǹ��� count
	public int saleOk(String product_approval_status) {
		return sqlSession.selectOne("saleOk", product_approval_status);
	}
	
	//������� count
	public int requestCancle(String product_approval_status) {
		return sqlSession.selectOne("requestCancle", product_approval_status);
	}
	
}
