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
import org.springframework.web.servlet.ModelAndView;

import com.group7.MGMN.model.MarketVO;
import com.group7.MGMN.model.PagingVO;
import com.group7.MGMN.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	// 중고거래 페이지로 이동  (미사용)
	//@RequestMapping("/market")
	//public String viewMarket() {
	//	return "market/marketView";
		
	//}
	
	//지역별 상품 조회
	//@RequestMapping("/market/listRegionPost/{mkRegion}")
	//public String listRegionPost(@PathVariable String mkRegion, Model model) {
	//	ArrayList<MarketVO> mkList = service.listRegionPost(mkRegion);
	//	model.addAttribute("mkList", mkList);
		
	//	return "market/listRegionPostView";
	//}
	
	//지역별 상품 조회(페이징 추가)
	@RequestMapping("/market/listRegionPost")
	public String listRegionPostPaging(Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, HttpSession session) {
		
		// mkRegion 값에 session에 넣어둔 "address"값 넣기
		String mkRegion = (String)session.getAttribute("address");
		
		// 페이징
		int total = service.countMkBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		System.out.println("total : "+total);
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		vo.setMkRegion(mkRegion);
		model.addAttribute("paging", vo);
		model.addAttribute("mkList", service.selectMkBoard(vo));

		return "market/listRegionPostView";
		
	}
	
	//상품 상세 정보 페이지로 이동
	@RequestMapping("/market/detailViewPost/{mkNo}")
	public String detailViewPost(@PathVariable int mkNo, Model model) throws Exception {
		MarketVO mkVO = service.detailViewPost(mkNo);
		
		model.addAttribute("mkVO", mkVO);
		service.hitUp(mkNo);	//조회수증가
		
		return "market/detailViewPost";
	}
	
	// 상품 등록 페이지로 이동
	@RequestMapping("/insertPostView")
	public String insertPostView() {
		return "market/insertPostView";
	}
	
	//상품 등록
	@RequestMapping("/insertPost")
	public String insertPost(MarketVO mkVO, HttpSession session) {								// 전체 vo
		System.out.println(mkVO.getMkContent());								
		// mkVO.getMkContent() 값을 변수에 저장하고 substring 함수 사용해서 img 태그를 추출 추출한값을 mkVO.setMKImg 저장 >> 값을 리스트에서 출력!
		int idx1 = mkVO.getMkContent().indexOf("<img");
		int idx2 = mkVO.getMkContent().indexOf("\">");
		String imgThumbnail = mkVO.getMkContent().substring(idx1, idx2+2);
		mkVO.setMkImg(imgThumbnail);
		
		// session 변수를 getAttribute로 가져와서 mkVO값에 set사용해서 저장하기
		String mkRegion = (String)session.getAttribute("address");
		mkVO.setMkRegion(mkRegion);
		service.insertPost(mkVO);						// DB에 들어감
		return "redirect:/market/listRegionPost/" + mkVO.getMkRegion();		// vo에 넣어둔 mkRegion 객체를 불러오는 개념
	}
	
	// 수정 화면으로 이동
	@RequestMapping("/market/updatePostForm/{mkNo}")
	public String updatePostForm(@PathVariable int mkNo, Model model) {
		// 게시번호 전달하고, 해당 상품 정보 받아오기
		MarketVO mkVO = service.detailViewPost(mkNo);
		model.addAttribute("mkVO", mkVO);
		return "market/updatePostForm";
	}
	
	// 게시글 수정
	@RequestMapping("/market/updatePost")
	public String updatePost(MarketVO mkVO) {
		System.out.println("updatPost : " + mkVO);
		// mkVO.getMkContent() 값을 변수에 저장하고 substring 함수 사용해서 img 태그를 추출 추출한값을 mkVO.setMKImg 저장 >> 값을 리스트에서 출력!
		int idx1 = mkVO.getMkContent().indexOf("<img");
		int idx2 = mkVO.getMkContent().indexOf("\">");
		String imgThumbnail = mkVO.getMkContent().substring(idx1, idx2+2);
		mkVO.setMkImg(imgThumbnail);
		service.updatePost(mkVO);
		return "redirect:/market/listRegionPost/" + mkVO.getMkRegion();
	}
	
	// 게시글 삭제
	@RequestMapping("/market/deletePost/{mkNo}/{mkRegion}")
	public String deletePost(@PathVariable int mkNo, @PathVariable String mkRegion) {			// 주소로 값을 넘겨받은 경우에 @PathVariable로 받아준다
		service.deletePost(mkNo);
		return "redirect:/market/listRegionPost/" + mkRegion;
	}
	
	
	// 게시글 검색
	@RequestMapping("/market/marketSearch2")
	public ModelAndView list(	//옵션, 키워드, 페이지의 기본값을 각각 설정
						@RequestParam(defaultValue="1") int nowPage,
						@RequestParam(defaultValue="userId") String searchType,
						@RequestParam(defaultValue="") String keyword
						) throws Exception {
		
		// 레코드 개수를 계산
		int count = 1000;
		
		// 페이지 관련 설정, 시작번호와 끝버호를 구해서 각각 변수에 저장
		// Pager pager = new Pager(count, nowPage);
		
		return null;
	}
	
	// @ResponseBody
	@RequestMapping("/market/marketSearch")
	//	public ArrayList<ProductVO> productSearch(@RequestParam("type") String type,
	//										  @RequestParam("keyword") String keyword) {
	public String marketSearch(@RequestParam HashMap<String,Object> param
								 ,@RequestParam(value="nowPage", required=false)String nowPage
								 ,@RequestParam(value="cntPerPage", required=false)String cntPerPage
								 ,Model model
								 ,HttpSession session) {
		
		
		  if (nowPage == null && cntPerPage == null) { 
			  nowPage = "1"; cntPerPage = "8";
		  } else if (nowPage == null) { 
			  nowPage = "1"; 
		  } else if (cntPerPage == null) {
			  cntPerPage = "8"; }
		  	System.out.println(nowPage);
			System.out.println(cntPerPage);
		
		
		ArrayList<MarketVO> mkList = service.mkSearchPost(param);
		model.addAttribute("mkList", mkList);
		
		int total = mkList.size();
		
		System.out.println("total : "+total);
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		vo.setSearchType((String)param.get("searchType"));
		vo.setSearchKeyword((String)param.get("searchKeyword"));
		
		String mkRegion = (String)session.getAttribute("address");
		vo.setMkRegion(mkRegion);
		
		
		model.addAttribute("paging", vo);
		model.addAttribute("mkList", service.searchSelectMkBoard(vo));
		
		//System.out.println(mkList.size());
		
		// prdList로 제대로 반화되었는지 확인하기 위한 코드
		//		for(int i =0; i < mkList.size(); i++) {
		//			MarketVO mkVO = (MarketVO) mkList.get(i);
		//			System.out.println(mkVO.getMkTitle());
		//		}
		// System.out.println("a");
		
		return "market/searchResultView";
	
	}

}












