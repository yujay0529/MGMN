package com.group7.MGMN.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.group7.MGMN.service.IMemberService;
import com.group7.MGMN.dao.IMemberDAO;
import com.group7.MGMN.model.MemberVO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Override
	public MemberVO loginCheck(HashMap<String, Object> map) {		
		return dao.loginCheck(map);
	}
	
	@Override
	public String memIdCheck(String userId) {
		return dao.memIdCheck(userId);
	}
	
	@Override
	public void register(MemberVO vo) {
		dao.register(vo);
	}
}
