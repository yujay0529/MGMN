package com.group7.MGMN.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.group7.MGMN.model.NoticeVO;
import com.group7.MGMN.model.PagingVO;



public interface INoticeService {
	

	void insertNotice(NoticeVO notiVo);			// 공지 등록
	void updateNotice(NoticeVO notiVo);			// 글 수정
	void deleteNotice(int noticeNo);		//글 삭제
	NoticeVO detailNotice(int noticeNo);// 공지 상세 조회
	ArrayList<NoticeVO> noticeSearch(HashMap<String, Object> map)throws Exception; // 글 검색
	public int noticountBoard();// 게시물 총 갯수
	public List<NoticeVO> notiselectBoard(PagingVO vo);// 페이징 처리 게시글 조회
	public int notihitUp(int noticeNo)throws Exception;//조회수
	
}
