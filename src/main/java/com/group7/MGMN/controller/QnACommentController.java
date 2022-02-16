package com.group7.MGMN.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group7.MGMN.model.QnACommentVO;
import com.group7.MGMN.model.QnAVO;
import com.group7.MGMN.service.QnACommentService;


@Controller
	@RequestMapping("/comment")
	
public class QnACommentController {

	@Autowired
	QnACommentService mCommentService;
	    
	    
	    @RequestMapping("/list") //댓글 리스트
	    @ResponseBody
	    private List<QnACommentVO> commentServiceList(int qnaNo) throws Exception{
	    	return mCommentService.commentList(qnaNo);

	    }
	  
	    @RequestMapping("/insert") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(HttpSession session,
	    															@RequestParam int qnaNo, @RequestParam String content) throws Exception{
	        
	        QnACommentVO comment = new QnACommentVO();
	        String userId = (String) session.getAttribute("userId");
	        comment.setQnaNo(qnaNo);
	        comment.setContent(content);
	        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
	        comment.setUserId(userId) ;
	        
	        return mCommentService.commentInsert(comment);
	    }
	    
	    @RequestMapping("/update") //댓글 수정  
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam int commentNo, @RequestParam String content) throws Exception{
	        
	        QnACommentVO comment = new QnACommentVO();
	        comment.setCommentNo(commentNo);
	        comment.setContent(content);
	        
	        return mCommentService.commentUpdate(comment);
	    }
	    
	    @RequestMapping("/delete/{commentNo}") //댓글 삭제  
	    @ResponseBody
	    private int mCommentServiceDelete(@PathVariable int commentNo) throws Exception{
	        
	        return mCommentService.commentDelete(commentNo);
	    }


}
