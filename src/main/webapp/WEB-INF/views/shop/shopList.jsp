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
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mlfhntsz0j"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="/js/shop.js"></script>
    </head>

    <body>
    	<!-- TOP  -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
        <link rel="stylesheet" href="/css/shop.css" type="text/css"/>
    		
        <div class="container" id="contentCtn">
        	<div id="shopLogo"><img src="<c:url value='/image/shopLogo.jpg' />"></div>
            
            <div class="nowLocation">
            	<ul>
            		<li id="leftList">현재 우리 동네</li>
            		<li id="rightList"><span id="client-location"></span></li>
            	</ul>
            </div>
            <!-- <div>이 컴퓨터의 IP 주소: <span id="client-ip"></span></div> -->
            <!-- <div>IP 주소에 해당하는 현재 위도 : <span id="client-lat"></span></div> -->
            <!-- <div>IP 주소에 해당하는 현재 경도 : <span id="client-long"></span></div> -->
		
			<div class="map_wrap">
				<!-- naver map api -->
	            <!-- <div id="map" style="width:100%;height:400px;"></div>
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
				</script> -->
				
				<!-- 카카오 map api -->
				<div id="map" style="width:1280px;height:500px;position:relative;overflow:hidden;align:center;"></div>
				<div id="menu_wrap" class="bg_white">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" id="keyword" size="15"> 
			                    <button id="submit_btn" type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2cd84f2ce02e39f1a4ce1851203000a&libraries=services"></script>
			<script>
			
				// sessionStorage 값 호출
				var lat = sessionStorage.getItem("lat");
				var long = sessionStorage.getItem("long");	
			
				// 마커를 담을 배열
				var markers = [];
			
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    	mapOption = {
			        center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    	};  
				
				//지도 생성
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(lat, long); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();  
				
				// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				
				// 키워드로 장소를 검색합니다
				searchPlaces();
				
				// 키워드 검색을 요청하는 함수입니다
				function searchPlaces() {

				    var keyword = document.getElementById('keyword').value;

				    if (!keyword.replace(/^\s+|\s+$/g, '')) {
				        // alert('키워드를 입력해주세요!');
				        return false;
				    }

				    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				    ps.keywordSearch( keyword, placesSearchCB); 
				}
				
				// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {

				        // 정상적으로 검색이 완료됐으면
				        // 검색 목록과 마커를 표출합니다
				        displayPlaces(data);

				        // 페이지 번호를 표출합니다
				        displayPagination(pagination);

				    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				        alert('검색 결과가 존재하지 않습니다.');
				        return;

				    } else if (status === kakao.maps.services.Status.ERROR) {

				        alert('검색 결과 중 오류가 발생했습니다.');
				        return;

				    }
				}
				
				// 검색 결과 목록과 마커를 표출하는 함수입니다
				function displayPlaces(places) {

				    var listEl = document.getElementById('placesList'), 
				    menuEl = document.getElementById('menu_wrap'),
				    fragment = document.createDocumentFragment(), 
				    bounds = new kakao.maps.LatLngBounds(), 
				    listStr = '';
				    
				    // 검색 결과 목록에 추가된 항목들을 제거합니다
				    removeAllChildNods(listEl);

				    // 지도에 표시되고 있는 마커를 제거합니다
				    removeMarker();
				    
				    for ( var i=0; i<places.length; i++ ) {

				        // 마커를 생성하고 지도에 표시합니다
				        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
				            marker = addMarker(placePosition, i), 
				            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        bounds.extend(placePosition);

				        // 마커와 검색결과 항목에 mouseover 했을때
				        // 해당 장소에 인포윈도우에 장소명을 표시합니다
				        // mouseout 했을 때는 인포윈도우를 닫습니다
				        (function(marker, title) {
				            kakao.maps.event.addListener(marker, 'mouseover', function() {
				                displayInfowindow(marker, title);
				            });

				            kakao.maps.event.addListener(marker, 'mouseout', function() {
				                infowindow.close();
				            });

				            itemEl.onmouseover =  function () {
				                displayInfowindow(marker, title);
				            };

				            itemEl.onmouseout =  function () {
				                infowindow.close();
				            };
				        })(marker, places[i].place_name);

				        fragment.appendChild(itemEl);
				    }

				    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
				    listEl.appendChild(fragment);
				    menuEl.scrollTop = 0;

				    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				    map.setBounds(bounds);
				}
				
				// 검색결과 항목을 Element로 반환하는 함수입니다
				function getListItem(index, places) {

				    var el = document.createElement('li'),
					    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
					                '<div class="info">' +			// 업체명에 네이버 링크 걸어둠
					                '   <h5>' +'<a target="_blank" href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='
					                	+places.place_name+'">'+places.place_name+'</a>'
					                	+'</h5>';

				    if (places.road_address_name) {
				        itemStr += '    <span>' + places.road_address_name + '</span>' +
				                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
				    } else {
				        itemStr += '    <span>' +  places.address_name  + '</span>'; 
				    }
				                 
				      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
				                '</div>';           

				    el.innerHTML = itemStr;
				    el.className = 'item';

				    return el;
				}
				
				// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
				function addMarker(position, idx, title) {
				    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
				        imgOptions =  {
				            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
				        },
				        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
				            marker = new kakao.maps.Marker({
				            position: position, // 마커의 위치
				            image: markerImage 
				        });

				    marker.setMap(map); // 지도 위에 마커를 표출합니다
				    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

				    return marker;
				}
				
				// 지도 위에 표시되고 있는 마커를 모두 제거합니다
				function removeMarker() {
				    for ( var i = 0; i < markers.length; i++ ) {
				        markers[i].setMap(null);
				    }   
				    markers = [];
				}
				
				// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
				function displayPagination(pagination) {
				    var paginationEl = document.getElementById('pagination'),
				        fragment = document.createDocumentFragment(),
				        i; 

				    // 기존에 추가된 페이지번호를 삭제합니다
				    while (paginationEl.hasChildNodes()) {
				        paginationEl.removeChild (paginationEl.lastChild);
				    }

				    for (i=1; i<=pagination.last; i++) {
				        var el = document.createElement('a');
				        el.href = "#";
				        el.innerHTML = i;

				        if (i===pagination.current) {
				            el.className = 'on';
				        } else {
				            el.onclick = (function(i) {
				                return function() {
				                    pagination.gotoPage(i);
				                }
				            })(i);
				        }

				        fragment.appendChild(el);
				    }
				    paginationEl.appendChild(fragment);
				}
				
				// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
				// 인포윈도우에 장소명을 표시합니다
				function displayInfowindow(marker, title) {
				    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

				    infowindow.setContent(content);
				    infowindow.open(map, marker);
				}

				 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
				function removeAllChildNods(el) {   
				    while (el.hasChildNodes()) {
				        el.removeChild (el.lastChild);
				    }
				}
				 
			</script>
		
			<script type="text/javascript">
			
				// sessionStorage 값 호출
				var address = sessionStorage.getItem("address");
			
	            function toClinic() {
	            	$("#keyword").val(address+" 동물 병원");
	            	$("#submit_btn").trigger("click");
	            	
	            }
	            
	            function toSalon() {
	            	$("#keyword").val(address+" 반려 동물 미용");
	            	$("#submit_btn").trigger("click");
	            	
	            }
	            
	            function toCafe() {
	            	$("#keyword").val(address+" 애견 카페");
	            	$("#submit_btn").trigger("click");
	            	
	            }
	            
	            function toHotel() {
	            	$("#keyword").val(address+" 애견 호텔");
	            	$("#submit_btn").trigger("click");
	            	
	            }
            </script>
			
            <div class="search_button_wrapper">
                <button class="btn_class" id="btn_clinic" onclick="toClinic();">동물병원</button>
                <button class="btn_class" id="btn_salon" onclick="toSalon();">미용실</button>
                <button class="btn_class" id="btn_cafe" onclick="toCafe();"> 카페</button>
                <button class="btn_class" id="btn_hotel" onclick="toHotel();">호텔</button>
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
            </div>
            
            <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
            
    </body>


</html>
