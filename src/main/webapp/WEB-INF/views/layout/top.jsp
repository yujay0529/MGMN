<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>

<link href="<c:url value='/css/index.css'/>" rel="stylesheet"
	type="text/css">

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/index.js'/>"></script>

</head>
<body>
	<header>
		<div id="headerBox">
			<div id="topMenu">
				<c:if test="${empty sessionScope.sid }">
					<a href="<c:url value='/'/>">HOME</a>
					<a href="<c:url value='/joinForm'/>">회원가입</a>
					<a href="<c:url value='/loginForm'/>">로그인</a>
				</c:if>
				<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
						<c:if test="${not empty sessionScope.sid}">
						<a href="<c:url value='/'/>">HOME</a>
						&nbsp;
						&nbsp;
						<a href="<c:url value='/mypage'/>"> ${sessionScope.sid} 님 환영합니다!</a>
						&nbsp;
						<a href="<c:url value='/logout'/>">로그아웃</a> 	
						</c:if>
				
			</div>
			<div id="logoBox">
				<a href="<c:url value='/'/>"><img src="/img/" id="logo"></a>
			</div>
		</div>
	</header>
	<nav>
		
	</nav>
</body>
</html>