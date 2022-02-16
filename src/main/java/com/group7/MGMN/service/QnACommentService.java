package com.group7.MGMN.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.dao.IQnACommentDAO;
import com.group7.MGMN.model.QnACommentVO;



@Service
public class QnACommentService implements IQnACommentService {
	

	@Autowired
	@Qualifier("IQnACommentDAO")
	IQnACommentDAO commentdao;

	@Override
	public int commentCount() throws Exception {
		// TODO Auto-generated method stub
		return commentdao.commentCount();
	}

	@Override
	public List<QnACommentVO> commentList(int qnaNo) throws Exception {
		// TODO Auto-generated method stub
		return commentdao.commentList(qnaNo);
	}

	@Override
	public int commentInsert(QnACommentVO comment) throws Exception {
		// TODO Auto-generated method stub
		return commentdao.commentInsert(comment);
	}

	@Override
	public int commentUpdate(QnACommentVO comment) throws Exception {
		return commentdao.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int commentNo) throws Exception {
		return commentdao.commentDelete(commentNo);
	}

}
