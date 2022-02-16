package com.group7.MGMN.controller;

import com.group7.MGMN.model.ShopVO;
import com.group7.MGMN.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
public class ShopController {

    @Autowired
    ShopService service;

    /**
     * shop 페이지로 이동
     * shop 페이지는 첫 입장시 주변 모든 샵(동물병원, 미용, 카페, 호텔) 정보를 보여줌
     */
    @RequestMapping("/shops")
    public String shops(Model model) {
        ArrayList<ShopVO> list = service.listAllShop();
        model.addAttribute("shops", list);
        return "shop/shopList";
    }

    /**
     * shopDetail 페이지로 이동
     */
    @RequestMapping("/shops/shopDetail/{shopNo}")
    public String shopDetail(@PathVariable int shopNo, Model model) {
        ShopVO shop = service.shopDetail(shopNo);
        model.addAttribute("shop", shop);

        return "shop/shopDetail";
    }

    /**
     * shopEnroll 페이지로 이동
     */
    @RequestMapping("shopEnroll")
    public String shopEnroll() {
        return "shop/shopEnroll";
    }
}
