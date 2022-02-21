package com.group7.MGMN.model;

import java.util.Date;

public class BoardVO {
	private int brdNo;
	private Date brdDate;
	private String brdTitle;
	private String brdCon;
	private String brdImg;
	private String brdRecommend;
	private String userId;
	
	public int getBrdNo() {
		return brdNo;
	}
	public void setBrdNo(int brdNo) {
		this.brdNo = brdNo;
	}
	public Date getBrdDate() {
		return brdDate;
	}
	public void setBrdDate(Date brdDate) {
		this.brdDate = brdDate;
	}
	public String getBrdTitle() {
		return brdTitle;
	}
	public void setBrdTitle(String brdTitle) {
		this.brdTitle = brdTitle;
	}
	public String getBrdCon() {
		return brdCon;
	}
	public void setBrdCon(String brdCon) {
		this.brdCon = brdCon;
	}
	public String getBrdImg() {
		return brdImg;
	}
	public void setBrdImg(String brdImg) {
		this.brdImg = brdImg;
	}
	public String getBrdRecommend() {
		return brdRecommend;
	}
	public void setBrdRecommend(String brdRecommend) {
		this.brdRecommend = brdRecommend;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}

	
