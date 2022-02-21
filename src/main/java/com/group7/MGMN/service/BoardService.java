package com.group7.MGMN.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.dao.IBoardDAO;
import com.group7.MGMN.model.BoardVO;

@Service
public class BoardService implements IBoardService {
	@Autowired
	@Qualifier("IBoardDAO")
	IBoardDAO dao;

	@Override
	public ArrayList<BoardVO> boardList() {
		return dao.boardList();
	}

	 //주문서에 사용할 회원정보 알아오기
	
	
	@Override
	public void insertBoard(BoardVO board) { 
		dao.insertBoard(board);
	}
	
	@Override
	public BoardVO detailView(String brdNo) { 
		return dao.detailView(brdNo);
	}
	@Override
	public void deleteBoard(String brdNo) { 
		dao.deleteBoard(brdNo);
	}
	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		dao.updateBoard(board);
	}

}