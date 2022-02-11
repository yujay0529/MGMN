package com.group7.MGMN.dao;

import java.util.HashMap;

import com.group7.MGMN.model.MemberVO;


public interface IMemberDAO {
	MemberVO loginCheck(HashMap<String, Object> map);
	String memIdCheck(String userId);
	//회원가입
	void register(MemberVO vo);	
}
