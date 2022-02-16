package com.group7.MGMN.model;

import java.sql.Date;

public class QnACommentVO {
	private int commentNo;
	private int qnaNo;
	private String content;
	private Date commnetDate;
	private String userId;
	
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommnetDate() {
		return commnetDate;
	}
	public void setCommnetDate(Date commnetDate) {
		this.commnetDate = commnetDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
	
	

}
