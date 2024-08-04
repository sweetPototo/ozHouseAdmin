package com.oz.ozHouseAdmin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.ozHouseAdmin.dto.NoticeDTO;

@Service
public class AdminNoticeMapper {
	@Autowired
	private SqlSession sqlSession;
	
	//�������� ���
	public int noticeInput(NoticeDTO dto) {
		return sqlSession.insert("noticeInput", dto);
	}
	
	//�������� ����Ʈ
	public List<NoticeDTO> noticeList() {
		return sqlSession.selectList("noticeList");
	}
	
	//�������� ������
	public List<NoticeDTO> noticeContent(int notice_num) {
		return sqlSession.selectList("noticeContent", notice_num);
	}
	
	//�������� ����
	public int noticeUpdate(NoticeDTO dto) {
		return sqlSession.update("noticeUpdate", dto);
	}
	
	//�������� ����
	public int noticeDelete(int notice_num) {
		return sqlSession.delete("noticeDelete", notice_num);
	}
}
