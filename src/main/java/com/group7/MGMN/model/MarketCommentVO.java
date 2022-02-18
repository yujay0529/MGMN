package com.group7.MGMN.model;

public class MarketCommentVO {
	private int cmtNo;
	private int mkNo;
	private String content;
	private String userId;
	private String commentDate;
	
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public int getMkNo() {
		return mkNo;
	}
	public void setMkNo(int mkNo) {
		this.mkNo = mkNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	
	
}