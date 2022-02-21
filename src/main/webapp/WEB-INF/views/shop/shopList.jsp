<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>

        <title>인덱스 페이지</title>
        <link rel="stylesheet" href="/css/shop.css" type="text/css"/>
<%--        <script type="text/javascript"--%>
<%--                src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e9m4p9u3gx"></script>--%>
        <%--        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>--%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="/js/shop.js"></script>

    </head>

    <body>
        <div class="container">
            <div>이 컴퓨터의 IP 주소: <span id="client-ip"></span></div>
            <div>IP 주소에 해당하는 현재 위치 : <span id="client-location"></span></div>

            <%-- 네이버 맵 api

            <h1>지도표시하기</h1>

            <div id="map" style="width:100%;height:400px;"></div>

            <script type="text/javascript">
                var mapOptions = {
                    center: new naver.maps.LatLng(37.3595704, 127.105399),
                    zoom: 10
                };

                var map = new naver.maps.Map('map', mapOptions);
            </script>
            --%>

            <div class="search_button_wrapper">
                <button class="btn_class">동물병원</button>
                <button class="btn_class">미용실</button>
                <button class="btn_class">카페</button>
                <button class="btn_class">호텔</button>
            </div>

            <div class="contentBox">
                <c:forEach items="${shops}" var="shop">
                    <div class="shop_wrapper" onclick="location.href='/shops/shopDetail/${shop.shopNo}'">
                        <img src="/image/${shop.shopThumb}" width="120px" />
                        <div>${shop.shopClass}</div>
                        <div>${shop.shopName}</div>
                        <div>${shop.shopInfo}</div>
                        <div>${shop.shopLocation}</div>
                        <div>${shop.shopRating}</div>
                        <div>${shop.shopEvalNum}</div>
                    </div>
                </c:forEach>
        </div>
    </body>


</html>
