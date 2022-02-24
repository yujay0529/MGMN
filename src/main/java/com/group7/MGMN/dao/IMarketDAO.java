package com.group7.MGMN.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.group7.MGMN.model.MarketVO;
import com.group7.MGMN.model.PagingVO;

public interface IMarketDAO {
	ArrayList<MarketVO> listRegionPost(String mkRegion);		// 지역별 게시글 조회
	ArrayList<MarketVO> listCtgPost(String ctgId);			// 카테고리별 게시글 조회
	void insertPost(MarketVO mkVO);							// 게시글 등록
	void updatePost(MarketVO mkVO);							// 게시글 수정
	void deletePost(int mkNo);								// 게시글 삭제
	public int hitUp(int mkNo)throws Exception;				//	조회수
	MarketVO detailViewPost(int mkNo);						// 게시글 상세 조회
	ArrayList<MarketVO> mkSearchPost(HashMap<String, Object> map);	// 게시글 검색
	
	// 페이징
	public int countMkBoard(); // 게시물 총 개수(검색추가)
	
	
	public List<MarketVO> selectMkBoard(PagingVO pagingvo);	// 페이징 처리 게시글 조회
	
	public ArrayList<MarketVO> searchSelectMkBoard(PagingVO pagingvo); // 검색 후 페이징 처리 게시글 조회 
}
