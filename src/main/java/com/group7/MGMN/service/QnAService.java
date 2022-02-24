package com.group7.MGMN.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.dao.IQnADAO;
import com.group7.MGMN.model.CategoryVO;
import com.group7.MGMN.model.PagingVO;
import com.group7.MGMN.model.QnAVO;
@Service
public class QnAService implements IQnAService {

	@Autowired
	@Qualifier("IQnADAO")
	IQnADAO dao;
	
	
//	@Override
//	public ArrayList<QnAVO> qnaList() {
//		return dao.qnaList();
//	}
	
	@Override
	public void insertqna(QnAVO qnaVO) {
		dao.insertqna(qnaVO);

	}

	@Override
	public void updateqna(QnAVO qnaVO){
		// TODO Auto-generated method stub
		dao.updateqna(qnaVO);

	}

	@Override
	public void deleteqna(int qnaNo) {
		dao.deleteqna(qnaNo);

	}

	@Override
	public QnAVO detailqna(int qnaNo) {
		return dao.detailqna(qnaNo);
	}

	@Override
	public ArrayList<QnAVO> qnaSearch(HashMap<String, Object> map)throws Exception {
		return dao.qnaSearch(map);
	}
	
	@Override
	public int qnahitUp(int qnaNo) throws Exception {
		return dao.qnahitUp(qnaNo);
	}


	@Override
	public int qnacountBoard() {
		return dao.qnacountBoard();
	}

	@Override
	public List<QnAVO> qnaselectBoard(PagingVO vo) {
		return dao.qnaselectBoard(vo);
	}
	@Override
	public ArrayList<QnAVO> qnaCheck(HashMap<String, Object> map)throws Exception {
		return dao.qnaCheck(map);
	}
	}
