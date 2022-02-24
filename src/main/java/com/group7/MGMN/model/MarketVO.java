package com.group7.MGMN.model;

import java.util.Date;

public class MarketVO {
	private int mkNo;
	private String mkTitle;
	private String mkContent;
	private String mkRegion;
	private int mkPrice;
	private String mkImg;
	private String userId;
	private String ctgId;
	private Date mkCreateDate;
	private int mkHit;
	
	public int getMkNo() {
		return mkNo;
	}
	public void setMkNo(int mkNo) {
		this.mkNo = mkNo;
	}
	public String getMkTitle() {
		return mkTitle;
	}
	public void setMkTitle(String mkTitle) {
		this.mkTitle = mkTitle;
	}
	public String getMkContent() {
		return mkContent;
	}
	public void setMkContent(String mkContent) {
		this.mkContent = mkContent;
	}
	public String getMkRegion() {
		return mkRegion;
	}
	public void setMkRegion(String mkRegion) {
		this.mkRegion = mkRegion;
	}
	public int getMkPrice() {
		return mkPrice;
	}
	public void setMkPrice(int mkPrice) {
		this.mkPrice = mkPrice;
	}
	public String getMkImg() {
		return mkImg;
	}
	public void setMkImg(String mkImg) {
		this.mkImg = mkImg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCtgId() {
		return ctgId;
	}
	public void setCtgId(String ctgId) {
		this.ctgId = ctgId;
	}
	public Date getMkCreateDate() {
		return mkCreateDate;
	}
	public void setMkCreateDate(Date mkCreateDate) {
		this.mkCreateDate = mkCreateDate;
	}
	public int getMkHit() {
		return mkHit;
	}
	public void setMkHit(int mkHit) {
		this.mkHit = mkHit;
	}
	
	@Override
	public String toString() {
		return "MarketVO [mkNo=" + mkNo + ", mkTitle=" + mkTitle + ", mkContent=" + mkContent + ", mkRegion=" + mkRegion
				+ ", mkPrice=" + mkPrice + ", mkImg=" + mkImg + ", userId=" + userId + ", ctgId=" + ctgId
				+ ", mkCreateDate=" + mkCreateDate + ", mkHit=" + mkHit + "]";
	}
	
}
