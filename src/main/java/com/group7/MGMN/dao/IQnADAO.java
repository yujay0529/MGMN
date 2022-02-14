package com.group7.MGMN.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.group7.MGMN.model.CategoryVO;
import com.group7.MGMN.model.PagingVO;
import com.group7.MGMN.model.QnAVO;

public interface IQnADAO {
	//ArrayList<QnAVO> qnaList(); 
	QnAVO detailqna(int qnaNo);// 글상세조회
	public int hitUp(int qnaNo)throws Exception;//조회수
	void insertqna(QnAVO qnaVO);//새글쓰기
	List<CategoryVO> category() throws Exception;//카테고리ㅣ  
	void updateqna(QnAVO qnaVO)throws Exception;	// 글 수정
	void deleteqna(int qnaNo);		//글 삭제
	ArrayList<QnAVO> qnaSearch(HashMap<String, Object> map); // 글 검색
	public int countBoard();// 게시물 총 갯수
	public List<QnAVO> selectBoard(PagingVO pagingvo);// 페이징 처리 게시글 조회
	

}
