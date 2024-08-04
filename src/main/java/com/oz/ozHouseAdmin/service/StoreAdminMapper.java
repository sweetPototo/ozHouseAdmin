package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.CategoryDTO;
import com.oz.ozHouseAdmin.dto.AdminDTO;
import com.oz.ozHouseAdmin.dto.InbrandDTO;
import com.oz.ozHouseAdmin.dto.MerchantDTO;
import com.oz.ozHouseAdmin.dto.StoreListDTO;

@Service
public class StoreAdminMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<StoreListDTO> selectMerchant(){
		List<StoreListDTO> list = sqlSession.selectList("selectMerchant");
		return list;
	}	
	
	public StoreListDTO merchantDetail(String mer_num) {
		StoreListDTO dto = sqlSession.selectOne("merchantDetail", mer_num);
		return dto;
	}
	
	public List<StoreListDTO> selectMerchantApplicate() {
		List<StoreListDTO> list = sqlSession.selectList("selectMerchantApplicate");
		return list;
	}
	
	public List<StoreListDTO> selectMerchantComplete() {
		List<StoreListDTO> list = sqlSession.selectList("selectMerchantComplete");
		return list;
	}
	
	public List<StoreListDTO> selectMerchantDelete(){
		List<StoreListDTO> list = sqlSession.selectList("selectMerchantDelete");
		return list;
	}
	
	public List<StoreListDTO> searchStoreList(Map map){
		if(map.get("searchString") != null) {
			map.put("searchString", "%" + map.get("searchString") + "%");
		}
		List<StoreListDTO> list = sqlSession.selectList("searchStoreList", map);
		return list;
	}
	
	public AdminDTO searchAdmin(String admin_num) {
		AdminDTO admin = sqlSession.selectOne("searchAdmin", admin_num);
		return admin;
	}
	
	public int admindeleteOk(String mer_num) {
		int res = sqlSession.update("admindeleteOk", mer_num);
		return res;
	}
	
	public int adminapproveOk(String mer_num) {
		int res = sqlSession.update("adminapproveOk", mer_num);
		return res;
	}
	
	public int selectAllStore() {
		int res = sqlSession.selectOne("selectAllStore");
		return res;
	}
	public int selectAppliStoreCount() {
		int res = sqlSession.selectOne("selectAppliStoreCount");
		return res;
	}
	public int selectCompleteStoreCount() {
		int res = sqlSession.selectOne("selectCompleteStoreCount");
		return res;
	}
	public int selectDeleteStoreCount() {
		int res = sqlSession.selectOne("selectDeleteStoreCount");
		return res;
	}
	
	public int updateStore(MerchantDTO dto) {
		return sqlSession.update("updateStore", dto);
	}
	
	public int admincancelOk(String mer_num) {
		return sqlSession.update("admincancelOk", mer_num);
	}
	
	public String selectCateName(int mer_category) {
		String cName = sqlSession.selectOne("selectCateNameMain", mer_category);
		return cName;
	}
}
