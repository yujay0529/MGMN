package com.group7.MGMN.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group7.MGMN.model.MemberVO;
import com.group7.MGMN.service.MemberService;

@Controller
public class HomeController {
	
	// 홈
	@RequestMapping("/")
	public String viewIndex() {
		return "index";

	}
	//티쳐블머신
	@RequestMapping("/TeachableForm")
	public String Teachable()  {
		return "TeachableForm";

	}
}
