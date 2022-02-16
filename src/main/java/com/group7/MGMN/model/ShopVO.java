package com.group7.MGMN.model;

import java.math.BigDecimal;

public class ShopVO {
    private int shopNo;
    private String shopClass;
    private String shopThumb;
    private String shopName;
    private String shopTel;
    private String shopInfo;
    private String shopDetail;
    private String shopLocation;
    private BigDecimal shopLat;
    private BigDecimal shopLong;
    private float shopRating;
    private int shopEvalNum;

    public int getShopNo() {
        return shopNo;
    }

    public void setShopNo(int shopNo) {
        this.shopNo = shopNo;
    }

    public String getShopClass() {
        return shopClass;
    }

    public void setShopClass(String shopClass) {
        this.shopClass = shopClass;
    }

    public String getShopThumb() {
        return shopThumb;
    }

    public void setShopThumb(String shopThumb) {
        this.shopThumb = shopThumb;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShopTel() {
        return shopTel;
    }

    public void setShopTel(String shopTel) {
        this.shopTel = shopTel;
    }

    public String getShopInfo() {
        return shopInfo;
    }

    public void setShopInfo(String shopInfo) {
        this.shopInfo = shopInfo;
    }

    public String getShopDetail() {
        return shopDetail;
    }

    public void setShopDetail(String shopDetail) {
        this.shopDetail = shopDetail;
    }

    public String getShopLocation() {
        return shopLocation;
    }

    public void setShopLocation(String shopLocation) {
        this.shopLocation = shopLocation;
    }

    public BigDecimal getShopLat() {
        return shopLat;
    }

    public void setShopLat(BigDecimal shopLat) {
        this.shopLat = shopLat;
    }

    public BigDecimal getShopLong() {
        return shopLong;
    }

    public void setShopLong(BigDecimal shopLong) {
        this.shopLong = shopLong;
    }

    public float getShopRating() {
        return shopRating;
    }

    public void setShopRating(float shopRating) {
        this.shopRating = shopRating;
    }

    public int getShopEvalNum() {
        return shopEvalNum;
    }

    public void setShopEvalNum(int shopEvalNum) {
        this.shopEvalNum = shopEvalNum;
    }
}
