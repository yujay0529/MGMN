package com.group7.MGMN.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.dao.IMarketCommentDAO;
import com.group7.MGMN.model.MarketCommentVO;

@Service
public class MarketCommentService implements IMarketCommentService {
	
	@Autowired
	@Qualifier("IMarketCommentDAO")
	IMarketCommentDAO commentdao;
	
	@Override
	public int commentCount() throws Exception {
		
		return commentdao.commentCount();
	}

	@Override
	public List<MarketCommentVO> commentList(int mkNo) throws Exception {
		
		return commentdao.commentList(mkNo);
	}

	@Override
	public int commentInsert(MarketCommentVO comment) throws Exception {
		
		return commentdao.commentInsert(comment);
	}

	@Override
	public int commentUpdate(MarketCommentVO comment) throws Exception {
		
		return commentdao.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int cmtNo) throws Exception {
		
		return commentdao.commentDelete(cmtNo);
	}

}

