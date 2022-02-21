package com.group7.MGMN.dao;

import java.util.ArrayList;

import com.group7.MGMN.model.BoardVO;

public interface IBoardDAO {
	ArrayList<BoardVO> boardList();
	void insertBoard(BoardVO board);
	void updateBoard(BoardVO board);
	void deleteBoard(String brdNo);
	BoardVO detailView(String brdNo);
	//주문서에 사용할 회원정보 알아오기
	//detail
}
