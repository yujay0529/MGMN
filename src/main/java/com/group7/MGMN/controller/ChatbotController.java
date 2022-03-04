package com.group7.MGMN.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.group7.MGMN.service.ChatbotService;

@Controller
public class ChatbotController {
	
	@Autowired
	private ChatbotService service;

	
	@RequestMapping("/ChatbotForm")
	public String Chatbot() {
		return "ChatbotForm";
	}

}
