package com.group7.MGMN.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group7.MGMN.model.NoticeVO;
import com.group7.MGMN.model.PagingVO;
import com.group7.MGMN.service.NoticeService;

//noticeController 공지사항페이지!!!!!!
@Controller
public class NoticeController {
	@Autowired
	NoticeService notiservice;

//페이징 및 글목록 불러오기 
	@RequestMapping("/noticeList")
	public String NoticePaging(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

		int total = notiservice.noticountBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		System.out.println("total : "+total);
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("noticeList", notiservice.notiselectBoard(vo));
		return "notice/noticeList";
	}


	// 새글쓰기창으로 이동
	@RequestMapping("/notice/write")
	public String write() {
		return "notice/write";
	}


	//새글업로드
	@RequestMapping("/notice/insertNotice")
	public String insertNotice(NoticeVO noti, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		noti.setUserId(userId);		
		notiservice.insertNotice(noti);
		System.out.println("id"+userId);

		return "redirect:../noticeList";
	}

	//글 상세페이지로 이동
	@RequestMapping("/notice/detailNotice/{noticeNo}")
	public String detailNotice(@PathVariable int noticeNo, Model model) throws Exception {
		NoticeVO noti = notiservice.detailNotice(noticeNo);
		model.addAttribute("noti", noti);
		notiservice.notihitUp(noticeNo);//조회수증가
	
		return "notice/detailNotice";
		
	}

	// 게시물 삭제
	@RequestMapping("notice/deleteNotice/{noticeNo}")
	public String deleteNotice(@PathVariable int noticeNo) {
		notiservice.deleteNotice(noticeNo);
		return "redirect:/notiList";
	}
	//글 수정화면으로 이동
	@RequestMapping("/notice/updateNoticeForm/{noticeNo}")
	public String updateNoticeForm(@PathVariable int noticeNo, Model model) {
		NoticeVO noti = notiservice.detailNotice(noticeNo);
		model.addAttribute("noti", noti);
		return "notice/updateNoticeForm";
	}

	// 글 수정 : 수정된 글 DB에 저장
	@RequestMapping("/notice/updateNotice")
	public String updateNotice(NoticeVO noti) {
		notiservice.updateNotice(noti);		
		return "redirect:../notiList";  // 전체 상품 조회 페이지로 포워딩
	}
	
	


	// 상품 검색
	@ResponseBody
	@RequestMapping("/notice/noticeSearch")
	public ArrayList<NoticeVO> noticeSearch(@RequestParam HashMap<String, Object> param,
											Model model){

		ArrayList<NoticeVO> notiList = notiservice.noticeSearch(param);
		model.addAttribute("notiList", notiList);

		return notiList;
	}

}