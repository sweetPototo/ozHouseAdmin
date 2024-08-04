package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.Mer_CouponListDTO;
import com.oz.ozHouseAdmin.dto.MsgDTO;

@Service
public class CouponMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Mer_CouponListDTO> selectCoupon(){
		List<Mer_CouponListDTO> list = sqlSession.selectList("selectCoupon");
		return list;
	}
	
	public Mer_CouponListDTO couponDetail(int mer_couponnum) {
		Mer_CouponListDTO dto = sqlSession.selectOne("couponDetail", mer_couponnum);
		return dto;
	}
	
	public int msgin_cou (MsgDTO dto) {
		return sqlSession.insert("msgin_cou", dto);
	}
	
	public int allCount(){
		int res = sqlSession.selectOne("allCouponCount");
		return res;
	}
	
	public int appliCount(){
		int res = sqlSession.selectOne("appliCount");
		return res;
	}
	
	public int completeCount(){
		int res = sqlSession.selectOne("completeCount");
		return res;
	}
	
	public int inputImg(int mer_couponnum) {
		int res = sqlSession.update("inputImg", mer_couponnum);
		return res;
	}
	
	public int couponCancelUpdate(int couponnum) {
		int res = sqlSession.update("couponCancelUpdate", couponnum);
		return res;
	}
	
	public List<Mer_CouponListDTO> searchCouponList(Map map){
		List<Mer_CouponListDTO> list = sqlSession.selectList("searchCouponList", map);
		return list;
	}
	
	public int couponDelete(String mer_couponnum) {
		int res = sqlSession.delete("couponDelete", mer_couponnum);
		return res;
	}
}
