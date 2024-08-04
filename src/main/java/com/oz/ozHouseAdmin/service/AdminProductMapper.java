package com.oz.ozHouseAdmin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.MsgDTO;
import com.oz.ozHouseAdmin.dto.ProductDTO;
import com.oz.ozHouseAdmin.dto.RequestProductDTO;

@Service
public class AdminProductMapper {
	
	@Autowired
	private SqlSession sqlSession;

	public int updateProductToday(Map<String, String> map) {
		return sqlSession.update("updateProductToday", map);
	}
	
	public ProductDTO getProduct(String product_num) {
		java.util.Map<String, String> map = new java.util.Hashtable<>();
		map.put("key", "product_num");
		map.put("value", String.valueOf(product_num));
		return sqlSession.selectOne("getProduct", map);
	}
	public List<ProductDTO> listproduct(Map<String, String> map) {
		return sqlSession.selectList("ListProduct", map);
	}
	
	public int ListCount(Map<String, String> map) {
		return sqlSession.selectOne("ListCount", map);
	}	
	
	public RequestProductDTO getreProduct(String product_num) {
		java.util.Map<String, String> map = new java.util.Hashtable<>();
		map.put("key", "product_num");
		map.put("value", String.valueOf(product_num));
		return sqlSession.selectOne("getreProduct", map);
	}
//	public int todays(int product_num) {
//		return sqlSession.update("todays", product_num);
//	}
	public int todaysno(int product_num) {
		return sqlSession.update("todays_no", product_num);
	}
	
	public int requestproductUpdate(int product_num) {
		return sqlSession.update("requestproductUpdate", product_num);
	}
	
	
	public List<ProductDTO> requestListProduct(Map<String, String> map) {
		return sqlSession.selectList("requestListProduct", map);
	}
	
	public int requestListCount(Map<String, String> map) {
		return sqlSession.selectOne("requestListCount", map);
	}	
	
	public List<ProductDTO> deleteRequestProduct(Map<String, String> map) {
		return sqlSession.selectList("deleteRequestProduct", map);
	}
	
	public int deleteRequestCount(Map<String, String> map) {
		return sqlSession.selectOne("deleteRequestCount", map);
	}	
	
	public List<ProductDTO> updateRequestListProduct(Map<String, String> map) {
		return sqlSession.selectList("updateRequestListProduct", map);
	}
	
	public int updateRequestListCount(Map<String, String> map) {
		return sqlSession.selectOne("updateRequestListCount", map);
	}
	
	public List<ProductDTO> allListProduct(Map<String, String> map) {
		return sqlSession.selectList("allListProduct", map);
	}
	
	public int allListCount(Map<String, String> map) {
		return sqlSession.selectOne("allListCount", map);
	}
	
	public int fok(Map<String, String> map) {
		return sqlSession.selectOne("fok", map);
	}
	
	public int fre(Map<String, String> map) {
		return sqlSession.selectOne("fre", map);
	}
	
	public int fc(Map<String, String> map) {
		return sqlSession.selectOne("fc", map);
	}
	
	public int msgin (MsgDTO dto) {
		return sqlSession.insert("msgin", dto);
	}
	
	
	
	
	public List<ProductDTO> cancelRequestProduct(Map<String, String> map) {
		return sqlSession.selectList("cancelRequestProduct", map);
	}
	
	public int cancelRequestCount(Map<String, String> map) {
		return sqlSession.selectOne("cancelRequestCount", map);
	}
	
	public int productok(int product_num) {
		return sqlSession.update("productok", product_num);
	}

	public int productCancel(int product_num) {
		return sqlSession.update("productCancel", product_num);
	}
	
	public int productRe(int product_num) {
		return sqlSession.update("productRe", product_num);
	}

	public int requestok(int product_num) {
		return sqlSession.update("requestok", product_num);
	}
	
	public int requestCancel(int product_num) {
		return sqlSession.update("requestCancel", product_num);
	}

	public int requestRe(int product_num) {
		return sqlSession.update("requestRe", product_num);
	}
	
	public int fcancle(int product_num) {
		return sqlSession.delete("fcancle", product_num);
	}
	public int reproductfcancle(int product_num) {
		return sqlSession.delete("reproductfcancle", product_num);
	}

	public int dcancle(int product_num) {
		return sqlSession.update("dcancle", product_num);
	}

	public int ucancle(int product_num) {
		return sqlSession.update("ucancle", product_num);
	}
	
	public int deletereProduct(int product_num) {
		return sqlSession.update("deletereProduct", product_num);
	}
	public int deletemsg(int product_num) {
		return sqlSession.update("deletemsg", product_num);
	}
}
