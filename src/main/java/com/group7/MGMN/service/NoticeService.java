package com.group7.MGMN.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.dao.INoticeDAO;
import com.group7.MGMN.model.NoticeVO;
import com.group7.MGMN.model.PagingVO;

@Service

public class NoticeService implements INoticeService {

	@Autowired
	@Qualifier("INoticeDAO")
	INoticeDAO dao;
	

	@Override
	public void insertNotice(NoticeVO notiVo) {
		dao.insertNotice(notiVo);

	}

	@Override
	public void updateNotice(NoticeVO notiVo){
		dao.updateNotice(notiVo);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		dao.deleteNotice(noticeNo);

	}
	
//공지사항 상세페이지
	@Override
	public NoticeVO detailNotice(int noticeNo){
		return dao.detailNotice(noticeNo);	
		
	}
	//검색
	@Override
	public ArrayList<NoticeVO> noticeSearch(HashMap<String, Object> map) {
		return dao.noticeSearch(map);
	}
	
	@Override
	public int noticountBoard() {
		return dao.noticountBoard();
	}

	@Override
	public List<NoticeVO> notiselectBoard(PagingVO vo) {
		return dao.notiselectBoard(vo);
	}

	@Override
	public int notihitUp(int noticeNo) throws Exception {
		return dao.notihitUp(noticeNo);
	}



}
