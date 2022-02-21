package com.group7.MGMN.dao;

import java.util.List;

import com.group7.MGMN.model.MarketCommentVO;

public interface IMarketCommentDAO {
	
	 // 댓글 개수
    public int commentCount() throws Exception;
 
    // 댓글 목록
    public List<MarketCommentVO> commentList(int mkNo) throws Exception;
 
    // 댓글 작성
    public int commentInsert(MarketCommentVO comment) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(MarketCommentVO comment) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int cmtNo) throws Exception;





}