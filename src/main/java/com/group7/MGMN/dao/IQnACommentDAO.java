package com.group7.MGMN.dao;

import java.util.List;

import com.group7.MGMN.model.QnACommentVO;

public interface IQnACommentDAO {

		
		  // 댓글 개수
	    public int commentCount() throws Exception;
	 
	    // 댓글 목록
	    public List<QnACommentVO> commentList(int qnaNo) throws Exception;
	 
	    // 댓글 작성
	    public int commentInsert(QnACommentVO comment) throws Exception;
	    
	    // 댓글 수정
	    public int commentUpdate(QnACommentVO comment) throws Exception;
	 
	    // 댓글 삭제
	    public int commentDelete(int commentNo) throws Exception;





}
