package com.group7.MGMN.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group7.MGMN.model.PetVO;
import com.group7.MGMN.service.PetService;

@Controller
public class PetController {

	@Autowired
	PetService service;
	
	// 마이펫 페이지로 이동
	@RequestMapping("/mypet")
	public String viewMypet() {
		return "/mypet/mypet";
	}
	
	
	// 마이펫 등록
	@RequestMapping("/insertPetInfo")
	public String insertPetInfo(PetVO petVO) {
		service.insertPetInfo(petVO);
		return "redirect:/mypet";
	}
	
	
}
