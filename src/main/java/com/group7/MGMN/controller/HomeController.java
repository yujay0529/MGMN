package com.group7.MGMN.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// 홈
	@RequestMapping("/")
	public String viewIndex() {
		return "index";

	}
	
	// 회원가입 폼
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}

	// 로그인 폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
}
