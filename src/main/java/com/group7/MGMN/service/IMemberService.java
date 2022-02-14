package com.group7.MGMN.service;

import java.util.HashMap;

import com.group7.MGMN.model.MemberVO;

public interface IMemberService {
	MemberVO loginCheck(HashMap<String, Object> map);
	String memIdCheck(String userId);
	
	void register(MemberVO vo);
}
