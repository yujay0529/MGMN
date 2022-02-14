package com.group7.MGMN.dao;

import com.group7.MGMN.model.ShopVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

public interface IShopDAO {

    ArrayList<ShopVO> listAllShop();
}
