package com.group7.MGMN.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group7.MGMN.model.PagingVO;
import com.group7.MGMN.model.QnAVO;
import com.group7.MGMN.service.QnAService;

@Controller
public class QnAController {
	@Autowired
	QnAService qnaService;

//	@RequestMapping("/qnaList")//질문 글목록 
//	public String qnaList(Model model) {
//		ArrayList<QnAVO> qnaList = qnaService.qnaList();
//		model.addAttribute("qnaList", qnaList);
//
//		return "qna/qnaList";
//	}	
	//+ 페이징 추가 아좌좌
		@RequestMapping("/qnaList")
		public String qnaPaging(PagingVO vo, Model model
				, @RequestParam(value="nowPage", required=false)String nowPage
				, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

			int total = qnaService.countBoard();
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
			model.addAttribute("qnaList", qnaService.selectBoard(vo));
			return "qna/qnaList";
		}
		
		//글 상세페이지로 이동
		@RequestMapping("/qna/detailqna/{qnaNo}")
		public String detailqna(@PathVariable int qnaNo, Model model) throws Exception {
			QnAVO qnaVO = qnaService.detailqna(qnaNo);
			model.addAttribute("qna", qnaVO);
			qnaService.hitUp(qnaNo);//조회수증가
		
			return "qna/qnaDetail";
			
		}
		
		// 새글쓰기창으로 이동
		@RequestMapping("/qna/write")
		public String write() {
			return "qna/write";
		}
		
		//새글업로드
		@RequestMapping("/qna/insertqna")
		public String insertqna(QnAVO qnaVO, HttpSession session) {
			String userId = (String) session.getAttribute("userId");
			qnaVO.setUserId(userId);		
			qnaService.insertqna(qnaVO);
			System.out.println("id"+userId);

			return "redirect:../qnaList";
		}
		// 게시물 삭제
		@RequestMapping("qna/deleteqna/{qnaNo}")
		public String deleteqna(@PathVariable int qnaNo) {
			qnaService.deleteqna(qnaNo);
			return "redirect:/qnaList";
		}
		//글 수정화면으로 이동
		@RequestMapping("/qna/updateqnaForm/{qnaNo}")
		public String updateqnaForm(@PathVariable int qnaNo, Model model) {
			QnAVO qnaVO = qnaService.detailqna(qnaNo);
			model.addAttribute("qna", qnaVO);
			return "qna/updateqnaForm";
		}

		// 글 수정 : 수정된 글 DB에 저장
		@RequestMapping("/qna/updateqna")
		public String updateqna(QnAVO qnaVO) throws Exception  {
			qnaService.updateqna(qnaVO);		
			return "redirect:../qnaList";  
		}
}
