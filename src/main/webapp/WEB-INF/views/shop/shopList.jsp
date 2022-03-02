<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <title>우리동네 샵</title>
        <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
        </style>
        <link rel="stylesheet" href="/css/shop.css" type="text/css"/>
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mlfhntsz0j"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="/js/shop.js"></script>

    </head>

    <body>
        <div class="container">
            <div>이 컴퓨터의 IP 주소: <span id="client-ip"></span></div>
            <div>IP 주소에 해당하는 현재 위치 : <span id="client-location"></span></div>
            <div>IP 주소에 해당하는 현재 위도 : <span id="client-lat"></span></div>
            <div>IP 주소에 해당하는 현재 경도 : <span id="client-long"></span></div>
		</div>
			
			<div class="map">
			<!-- naver map api -->
            <div id="map" style="width:100%;height:400px;"></div>
			<script>
				// map 호출
				
				// sessionStorage 값 호출
				var lat = sessionStorage.getItem("lat");
				var long = sessionStorage.getItem("long");
				
				var mapOptions = {
				    center: new naver.maps.LatLng(lat, long),
				    zoom: 16,
				    zoomControl: true, //줌 컨트롤의 표시 여부
			        zoomControlOptions: { //줌 컨트롤의 옵션
			            position: naver.maps.Position.TOP_RIGHT
			        }
				};
				
				// 마커 표시
				var map = new naver.maps.Map('map', {
				    center: new naver.maps.LatLng(lat, long),
				    zoom: 16
				});

				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(lat, long),
				    map: map
				});
				
				
				
				// var map = new naver.maps.Map('map', mapOptions);
			</script>
			
			<!-- 카카오 map api -->
			<div id="kakaoMap" style="width:100%;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2cd84f2ce02e39f1a4ce1851203000a"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667),
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
			</script>
			</div>
			
			
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
