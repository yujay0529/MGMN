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
   
    // 여기서부터 수정해야함!  마켓 코멘트 컨트롤러
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int commentServiceInsert(HttpSession session,
    									@RequestParam int mkNo, @RequestParam String content) throws Exception{
        
        MarketCommentVO comment = new MarketCommentVO();
		/* String userId = (String) session.getAttribute("userId"); */
        comment.setMkNo(mkNo);
        comment.setContent(content);
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "kim"이라는 값을 입력해놨습니다.
        comment.setUserId("kim");
        
        return commentService.commentInsert(comment);
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
