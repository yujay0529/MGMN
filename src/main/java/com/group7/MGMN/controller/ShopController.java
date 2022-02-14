package com.group7.MGMN.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
public class ShopController {

    /**
     * shop 페이지로 이동
     */
    @RequestMapping("/shops")
    public String shops(Model model) {
        return "shop/shopList";
    }
}
