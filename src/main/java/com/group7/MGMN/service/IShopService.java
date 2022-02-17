package com.group7.MGMN.service;

import com.group7.MGMN.model.ShopVO;

import java.util.ArrayList;

public interface IShopService {
    ArrayList<ShopVO> listAllShop();

    ShopVO shopDetail(int shopNo);

    void shopEnroll(ShopVO vo);
}
