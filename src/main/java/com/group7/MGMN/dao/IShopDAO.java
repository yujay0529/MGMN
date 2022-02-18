package com.group7.MGMN.dao;

import com.group7.MGMN.model.ShopVO;

import java.util.ArrayList;

public interface IShopDAO {

    ArrayList<ShopVO> listAllShop();

    ShopVO shopDetail(int shopNo);

    void shopEnroll(ShopVO vo);
}
