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
   
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int commentServiceInsert(HttpSession session,
    									@RequestParam int mkNo,@RequestParam String userId, @RequestParam String content) throws Exception{
        
        MarketCommentVO commentVO = new MarketCommentVO();
		/* String userId = (String) session.getAttribute("userId"); */
        commentVO.setMkNo(mkNo);
        commentVO.setContent(content);
        commentVO.setUserId(userId);
        
        return commentService.commentInsert(commentVO);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int commentServiceUpdateProc(@RequestParam int cmtNo, @RequestParam String content) throws Exception{
        
        MarketCommentVO comment = new MarketCommentVO();
        comment.setCmtNo(cmtNo);
        comment.setContent(content);
        
        return commentService.commentUpdate(comment);
    }
    
    @RequestMapping("/delete/{cmtNo}") //댓글 삭제  
    @ResponseBody
    private int commentServiceDelete(@PathVariable int cmtNo) throws Exception{
        
        return commentService.commentDelete(cmtNo);
    }


}
