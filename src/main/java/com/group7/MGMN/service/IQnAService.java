package com.group7.MGMN.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.group7.MGMN.model.CategoryVO;
import com.group7.MGMN.model.PagingVO;
import com.group7.MGMN.model.QnAVO;

public interface IQnAService {
	
	//ArrayList<QnAVO> qnaList(); 
	QnAVO detailqna(int qnaNo);// 글상세조회
	public int qnahitUp(int qnaNo)throws Exception;//조회수
	void insertqna(QnAVO qnaVO);//새글쓰기

	void updateqna(QnAVO qnaVO) ;	// 글 수정
	void deleteqna(int qnaNo);		//글 삭제
	ArrayList<QnAVO> qnaSearch(HashMap<String, Object> map)throws Exception; //  검색
	public int qnacountBoard();// 게시물 총 갯수
	public List<QnAVO> qnaselectBoard(PagingVO pagingvo);// 페이징 처리 게시글 조회
	ArrayList<QnAVO> qnaCheck(HashMap<String, Object> map)throws Exception; // 체크박스 
	

}
