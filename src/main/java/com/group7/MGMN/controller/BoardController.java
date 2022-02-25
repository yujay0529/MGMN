package com.group7.MGMN.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.group7.MGMN.model.BoardVO;
import com.group7.MGMN.service.BoardService;



@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("/BoardList")
	public String BoardList(Model model) {
		ArrayList<BoardVO> boardList = service.boardList();
		model.addAttribute("boardList",boardList);
		return "/board/BoardList";
	}
	@RequestMapping("/insertForm")
	public String insertForm() {
		return "/board/insertForm";
	}
	
	@RequestMapping("/insertBoard")
	public String insertBoard(BoardVO board) {
		int idx1 = board.getBrdCon().indexOf("<img");
		int idx2 = board.getBrdCon().indexOf("\">");
		String Thumbnail = board.getBrdCon().substring(idx1, idx2+2);
		board.setBrdImg(Thumbnail);
		service.insertBoard(board);
		return "redirect:./BoardList";
	}
	
	@RequestMapping("/board/detailView/{brdNo}")
	public String detailView(@PathVariable String brdNo, Model model) {
		BoardVO board = service.detailView(brdNo);
		model.addAttribute("board", board);

		return "board/detailView";
	}
	@RequestMapping("/board/deleteBoard/{brdNo}")
	public String deleteProduct(@PathVariable String brdNo) {

		service.deleteBoard(brdNo);
		return "redirect:/BoardList";

	}
	@RequestMapping(value="/board/updateBoard", method=RequestMethod.GET)
	public void getUpdateBoard(@RequestParam("brdNo") String brdNo, Model model) {
		BoardVO board = service.detailView(brdNo);
		model.addAttribute("detailView", board);
	}
	@RequestMapping(value="board/updateBoard", method=RequestMethod.POST)
	public String postUpdateBoard(BoardVO board){
		int idx1 = board.getBrdCon().indexOf("<img");
		int idx2 = board.getBrdCon().indexOf("\">");
		String Thumbnail = board.getBrdCon().substring(idx1, idx2+2);
		board.setBrdImg(Thumbnail);
		service.updateBoard(board);
		return "redirect:/board/detailView/brdNo="+board.getBrdNo();
	}
}
/*
 * dao에 dao 인터페이스
 * 
 * model에 vo
 * 
 * service에 boardservice, iboardservice
 */