package com.group7.MGMN.controller;

import java.math.BigDecimal;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.group7.MGMN.service.GeolocationAPI;

@RestController
public class ShopRestController {

    /**
     * naver Geolocation API (ip로 지역정보 가져오기)
     * @param ip ajax에서 받아온 ip 인자로 넘겨주기
     * @return api 결과 (도, 시 / 군 / 구, 동, 위도, 경도 등)
     */
    @RequestMapping("/location")
    public String location(@RequestParam("ip") String ip) {
        System.out.println("ip = " + ip);
        String result = GeolocationAPI.getLocation(ip);
        System.out.println("result = " + result);
        return result;
    }
    
    // 위도
    @RequestMapping("/locationLat")
    public BigDecimal locationLat(@RequestParam("ip") String ip) {
        BigDecimal result = GeolocationAPI.getLat(ip);
        System.out.println("lat = " + result);
        return result;
    }
    // 경도
    @RequestMapping("/locationLong")
    public BigDecimal locationLong(@RequestParam("ip") String ip) {
        BigDecimal result = GeolocationAPI.getLong(ip);
        System.out.println("long = " + result);
        return result;
    }
}
