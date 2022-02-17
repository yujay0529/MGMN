package com.group7.MGMN.controller;

import com.group7.MGMN.model.ShopVO;
import com.group7.MGMN.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.UUID;

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


    /**
     * shop 등록
     */
    @RequestMapping("/shop/shopEnroll")
    public String enroll(@RequestParam("shopClass") String shopClass,
                         @RequestParam("shopName") String shopName,
                         @RequestParam("shopTel") String shopTel,
                         @RequestParam("shopInfo") String shopInfo,
                         @RequestParam("shopDetail") String shopDetail,
                         @RequestParam("userAddress1") String shopAddress1,
                         @RequestParam("userAddress2") String shopAddress2,
                         @RequestParam("shopLat") String shopLat,
                         @RequestParam("shopLong") String shopLong,
                         @RequestParam("shopRating") String shopRating,
                         @RequestParam("shopEvalNum") String shopEvalNum,
                         @RequestParam("shopImg") MultipartFile file) throws IOException {

        ShopVO vo = new ShopVO();
        String location = shopAddress1 + " " + shopAddress2;
        String savedFileName = "";
        BigDecimal shopLatitude = new BigDecimal(shopLat);
        BigDecimal shopLongitude = new BigDecimal(shopLong);
        float rating = Float.valueOf(shopRating);
        int evalNum = Integer.valueOf(shopEvalNum);

        // 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
        String uploadPath = "";

        // 2. 원본 파일 이름 알아오기
        String originalFileName = file.getOriginalFilename();

        // 3. 파일 이름 중복되지 않도록 이름 변경 : 서버에 저장할 이름 . UUID 사용
        UUID uuid = UUID.randomUUID();
        savedFileName = uuid.toString() + "_" + originalFileName;

        // 4. 파일 생성
        File file1 = new File(uploadPath + savedFileName);

        // 5. 서버로 전송
        file.transferTo(file1);

        vo.setShopClass(shopClass);
        vo.setShopName(shopName);
        vo.setShopTel(shopTel);
        vo.setShopInfo(shopInfo);
        vo.setShopDetail(shopDetail);
        vo.setShopLocation(location);
        vo.setShopLat(shopLatitude);
        vo.setShopLong(shopLongitude);
        vo.setShopRating(rating);
        vo.setShopEvalNum(evalNum);
        vo.setShopThumb(savedFileName);

        service.shopEnroll(vo);
        return "shop/shopList";
    }
}
