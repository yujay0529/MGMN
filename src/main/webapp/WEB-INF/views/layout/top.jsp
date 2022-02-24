<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/index.js'/>"></script>
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        
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


</head>
<body>
	<header>
		<div id="headerBox">
		 <div id="menubar" class="main-menu">	
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html" style="width:300px;height:20px;font-size:30px;">MGMN</a>
                    </div>
      

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#home">Home<span class="sr-only">(current)</span></a></li>
                           <c:if test="${empty sessionScope.sid }">
							<li><a href="<c:url value='/joinForm'/>">Join</a><li>
							<li><a href="<c:url value='/loginForm'/>">Login</a><li>
                            <li>  <a href="<c:url value='noticeList' />">Notice</a></li>
                            <li>  <a href="javascript:toMarket();">Market</a></li>
                            <li>  <a href="<c:url value='qnaList' />">Q&A</a></li>
                            <li><a href="<c:url value='shops' />">ShopList</a></li>
                            <li><a href="#our-feature">Blog</a></li>
                            <li><a href="#">Contact Us</a></li>
                            </c:if>
                            		
						
                            	<c:if test="${not empty sessionScope.sid}">

						
                            <li>  <a href="javascript:toMarket();">Market</a></li>
                            <li>  <a href="<c:url value='qnaList' />">Q&A</a></li>
                            <li><a href="<c:url value='shops' />">ShopList</a></li>
                            <li><a href="<c:url value='/store'/>">스토어</a></li>
                            <li>  <a href="<c:url value='noticeList' />">Notice</a></li>
							<li><a href="<c:url value='/BoardList'/>">이벤트</a><li>			
							<li><a href="<c:url value='/mypet'/>">마이펫</a> </li>
							<li><a href="<c:url value='/mypage'/>"> ${sessionScope.sid} 님 환영합니다!</a></li>
							<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
								&nbsp;
						</c:if>
						</div>
                        </ul>
						
		
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
			</div>
</body>
</html>