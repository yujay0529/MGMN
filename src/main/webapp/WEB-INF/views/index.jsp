<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
				
	function toMarket() {		// 중고거래 링크 접근과 동시에 ip => 주소 
		// ip 구하는 api 키
		// IP API 변경
		// let apiKey = 'e467b63698e3483a919b49c7ee41550f';
		
		$.getJSON("https://api.ipify.org?format=jsonp&callback=?", function (data) {
		// $.getJSON('https://ipgeolocation.abstractapi.com/v1/?api_key=' + apiKey, function (data) {
			console.log(data.ip);
			// console.log(data.ip_address);
			// ip 주소를 RestController 로 post => geolocation api 실행
			$.ajax({
				type: "post",
				url: "/location2",
				data: {
					ip: data.ip
					// ip: data.ip_address
				},
				dataType: "text",
				success: function(data) {
					location.href="/market/listRegionPost";
				},
				error: function(data, textStatus) {
					console.log(data);
					console.log(textStatus);
				}
			})
		});
	} 
</script>

</head>
<body>
	<div id="wrap">
				
			<!-- TOP  -->
		   <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		   
			<section>

	         <a href="<c:url value='qnaList' />">qna페이지</a><br><br>
	         <a href="<c:url value='shops' />">동네 샵정보</a><br><br>
	         <a href="javascript:toMarket();">중고거래 페이지 </a><br><br>
	 
			</section>
			
		
			<!-- BOTTOM  -->
		   <jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
			</div>
	</body>
</html>
