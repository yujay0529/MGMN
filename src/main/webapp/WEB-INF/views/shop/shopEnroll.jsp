<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>shop 등록 페이지</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="<c:url value='/js/searchZip.js'/>"></script>
        <script>
            $(function() {
                // file image 변화 감지
                $("#input_img").on('change', function () {
                    readURL(this);
                });

                // 우편번호 클릭시
                $("#userAddress1").on('click', function () {
                     callGeocoding();
                })
            })

            // file image 미리보기
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah').attr('src', e.target.result);
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }

            function callGeocoding() {
                const geocodingUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode";
                const clientID = "e9m4p9u3gx";
                const clientSecret = "dFMcRtfMmms518Hr17OcdpRjqVfsSyda7LJoOwko";
                const address = $("#userAddress1").text();

                let params = {
                    query: '중랑구 면목4동'
                }

                $.ajax({
                    url: geocodingUrl,
                    type: "get",
                    headers: {
                        "X-NCP-APIGW-API-KEY-ID": clientID,
                        "X-NCP-APIGW-API-KEY": clientSecret,
                        "Access-Control-Allow-Origin": "*"
                    },
                    data: {
                        "query": "중랑구 면목4동"

                    },
                    success: (data) => {
                        console.log(data);
                        return data;
                    },
                    error: (e, stat) => {
                        console.log(e);
                        console.log(stat);
                    }

                })
            }
        </script>

    </head>
    <body>
        <div id="wrap">
            <form name="enroll_form" id="enroll_form" action="/shop/shopEnroll" enctype="multipart/form-data">
                <%-- 입력해야 할 샵 정보
                1. 샵 구분 (병원, 미용, 카페, 호텔)
                2. 샵 썸네일 파일 등록
                3. 샵 이름 입력
                4. 샵 번호 입력
                5. 샵 편의시설 입력
                6. 샵 상세정보 입력
                7. 샵 위치 등록
                8. (위치에 따른 위도 경도 자동 등록 api)--%>

                <h4>샵 업종구분</h4>
                <select id="shop_class" name="shopClass">
                    <option value="null">선택하세요</option>
                    <option value="hospital">병원</option>
                    <option value="salon">미용</option>
                    <option value="cafe">카페</option>
                    <option value="hotel">호텔</option>
                </select>

                <h4>샵 썸네일 등록</h4>
                <input id="input_img" type="file" name="shopThumbnail">

                <h4>썸네일 미리보기</h4>
                <img id="blah" src="#" alt="your image" />

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
                상세 주소: <input type="text" id="userAddress2"  name="userAddress2" size="70" placeholder="상세 주소 입력">

                <input hidden name="shopLat"/>
                <input hidden name="shopLong" />

                <input type="submit" value="등록하기">
            </form>
        </div>
        <script>


        </script>
    </body>
</html>
