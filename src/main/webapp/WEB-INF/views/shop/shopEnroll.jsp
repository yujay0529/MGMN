<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>shop 등록 페이지</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="<c:url value='/js/searchZip.js'/>"></script>
        <script src="<c:url value='/js/shopEnroll.js'/>"></script>
    </head>
    <body>
        <div id="wrap">
            <form name="enroll_form" id="enroll_form" method="post" action="/shop/shopEnroll" enctype="multipart/form-data">

                <h4>샵 업종구분</h4>
                <select id="shop_class" name="shopClass">
                    <option value="null" selected>선택하세요</option>
                    <option value="hospital">병원</option>
                    <option value="salon">미용</option>
                    <option value="cafe">카페</option>
                    <option value="hotel">호텔</option>
                </select>

                <h4>샵 썸네일 등록</h4>
                <input id="input_img" type="file" name="shopImg"/>

                <h4>썸네일 미리보기</h4>
                <img id="img_preview" src="#" alt="your image" />

                <h4>샵 이름 입력</h4>
                <input id="shop_name" name="shopName"type="text">

                <h4>샵 전화번호 입력</h4>
                <input id="shop_tel" name="shopTel" type="text">

                <h4>샵 편의시설 입력</h4>
                <input id="shop_info" name="shopInfo" type="text">

                <h4>샵 상세정보 입력</h4>
                <input id="shop_detail" name="shopDetail" type="text">

                <h4>샵 주소입력</h4>
                우편번호: <input type="text" id="userZipcode" name="userZipcode"   size="5" >
                <input type="button" id="searchZip" name="searchZip" value="우편번호찾기" readonly><br>
                지번 주소: <input type="text"  id="userAddress1"  name="userAddress1" size="70" readonly><br>
                상세 주소: <input type="text" id="userAddress2"  name="userAddress2" size="70" placeholder="상세 주소 입력"><br><br>

                <input hidden name="shopLat" value="0"/>
                <input hidden name="shopLong" value="0" />
                <input hidden name="shopRating" value="0"/>
                <input hidden name="shopEvalNum" value="0"/>

                <input type="submit" value="등록하기">
            </form>
        </div>
        <script>


        </script>
    </body>
</html>
