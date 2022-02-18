package com.group7.MGMN.model;

import java.sql.Date;

public class QnAVO {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private int qnaHit;
	private String qnaFile;
	private Date qnaCreateDate;
	private String qnaComment;
	private String userId;
	private String category;
	

	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public int getQnaHit() {
		return qnaHit;
	}
	public void setQnaHit(int qnaHit) {
		this.qnaHit = qnaHit;
	}
	public String getQnaFile() {
		return qnaFile;
	}
	public void setQnaFile(String qnaFile) {
		this.qnaFile = qnaFile;
	}
	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}
	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}
	public String getQnaComment() {
		return qnaComment;
	}
	public void setQnaComment(String qnaComment) {
		this.qnaComment = qnaComment;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaHit=" + qnaHit
				+ ", qnaFile=" + qnaFile + ", qnaCreateDate=" + qnaCreateDate + ", qnaComment=" + qnaComment
				+ ", userId=" + userId + ", category=" + category + "]";
	}
	
	
	
	
}
