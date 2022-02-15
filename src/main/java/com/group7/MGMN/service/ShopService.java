package com.group7.MGMN.service;

import com.group7.MGMN.dao.IShopDAO;
import com.group7.MGMN.model.ShopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ShopService implements IShopService {

    @Autowired
    IShopDAO dao;

    @Override
    public ArrayList<ShopVO> listAllShop() {
        return dao.listAllShop();
    }

    @Override
    public ShopVO shopDetail(int shopNo) {
        return dao.shopDetail(shopNo);
    }
}
