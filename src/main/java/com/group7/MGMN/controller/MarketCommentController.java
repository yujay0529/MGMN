package com.group7.MGMN.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group7.MGMN.model.MarketCommentVO;
import com.group7.MGMN.model.QnACommentVO;
import com.group7.MGMN.service.MarketCommentService;


@Controller
@RequestMapping("/mkComment")
public class MarketCommentController {

	@Autowired
	MarketCommentService commentService;
	    
	    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<MarketCommentVO> commentServiceList(int mkNo) throws Exception{
    	return commentService.commentList(mkNo);

    }
   


}
